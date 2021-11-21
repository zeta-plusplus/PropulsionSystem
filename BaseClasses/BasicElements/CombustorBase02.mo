within PropulsionSystem.BaseClasses.BasicElements;

model CombustorBase02
  //********************************************************************************
  /********************************************************
                            imports
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  /********************************************************
          Declaration
  ********************************************************/
  /* ---------------------------------------------
                          Package
  --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  
  
  /* ---------------------------------------------
                          switch
  --------------------------------------------- */
  parameter Boolean allowFlowReversal= false
    "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)"
    annotation(
      Dialog(tab="Assumptions"), Evaluate=true);
  
  parameter Boolean printCmd = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(tab = "debug setting"));
  /* ---------------------------------------------
                    parameters
      --------------------------------------------- */
  //********** Initialization Parameters **********
  //--- fluid_1, port_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = 20* 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Temperature T1_init(displayUnit = "K") = 800.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = T1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 20*101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 1600 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = T2_init*1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- fluid_fuel ---
  parameter Modelica.SIunits.MassFlowRate m_flow_fuel_init(displayUnit = "kg/s") = 0.03 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_fuel"));
  parameter Modelica.SIunits.Pressure pfuel_init(displayUnit = "Pa") = p1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_fuel"));
  parameter Modelica.SIunits.Temperature Tfuel_init(displayUnit = "K") = 400 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_fuel"));
  parameter Modelica.SIunits.SpecificEnthalpy hfuel_init(displayUnit = "J/kg") = Tfuel_init * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_fuel"));
  //--- HeatInjector ---
  parameter Modelica.SIunits.HeatFlowRate Q_flow_init=m_flow1_init*(h2_init-h1_init) "" annotation(
    Dialog(tab = "Initialization", group = "HeatInjector"));
  parameter Modelica.SIunits.Temperature Twall_init= T2_init "" annotation(
    Dialog(tab = "Initialization", group = "HeatInjector"));
  //--- others ---
  parameter Real effComb_init=0.999 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.SpecificEntropy s_fluid_1_init=7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.SpecificEntropy s_fluid_2_init=7800.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  
  
  
  /* ---------------------------------------------
           Internal variables
  --------------------------------------------- */
  Real effComb(start=effComb_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  Modelica.SIunits.SpecificEntropy s_fluid_1(start=s_fluid_1_init) "specific entropy, fluid_1" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.SpecificEntropy s_fluid_2(start=s_fluid_2_init) "specific entropy, fluid_2" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  

  /* ---------------------------------------------
           Internal objects
  --------------------------------------------- */  
  PropulsionSystem.Subelements.Combustion00 Combustion annotation(
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //-----
  PropulsionSystem.Elements.BasicElements.IdealMixer01 Mixer(
    redeclare package Medium = Medium, 
    T1_init = T1_init, T2_init = Tfuel_init, T3_init = T2_init, 
    h1_init = h1_init, h2_init = hfuel_init, h3_init = h2_init, 
    m_flow1_init = m_flow1_init, m_flow2_init = m_flow_fuel_init, m_flow3_init = m_flow2_init, 
    p1_init = p1_init, p2_init = pfuel_init, p3_init = p2_init
  ) annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -6}, {10, 6}}, rotation = 0)));
  //-----
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(
    redeclare package Medium = Medium,
    port_a(
      m_flow(start=m_flow_fuel_init, min=if (allowFlowReversal) then -Constants.inf else 0.0),
      h_outflow(start = hfuel_init, min=0.0+1.0e-10),
      p(start=pfuel_init, min=0.0+1.0e-10)
    ),
    port_b(
      m_flow(start=-1.0*m_flow_fuel_init, max=if allowFlowReversal then +Constants.inf else 0.0),
      h_outflow(start = hfuel_init, min=0.0+1.0e-10),
      p(start=pfuel_init, min=0.0+1.0e-10)
    )
  ) annotation(
    Placement(visible = true, transformation(origin = {-80, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  //-----
  PropulsionSystem.Elements.BasicElements.HeatInjector00 HeatInjector(
    redeclare package Medium = Medium, Q_flow1_init = Q_flow_init, T1_init = T1_init, T2_init = T2_init, Twall1_init = Twall_init, h1_init = h1_init, h2_init = h2_init, m_flow1_init = m_flow1_init, m_flow2_init = m_flow2_init, p1_init = p1_init, p2_init = p2_init, s_fluid_1_init = s_fluid_1_init, s_fluid_2_init = s_fluid_2_init
  ) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1(
    port(Q_flow(start=-1.0*Q_flow_init), T(start=T2_init, min=0.0+1.0e-10)),
    Q_flow(start=Q_flow_init)
  ) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Medium.BaseProperties fluid_1(
    p(start = p1_init, min=0.0+1.0e-10), 
    T(start = T1_init, min=0.0+1.0e-10), 
    state.p(start = p1_init, min=0.0+1.0e-10), 
    state.T(start = T1_init, min=0.0+1.0e-10), 
    h(start = h1_init, min=0.0+1.0e-10)
  ) "flow station of inlet";
  Medium.BaseProperties fluid_2(
    p(start = p2_init, min=0.0+1.0e-10), 
    T(start = T2_init, min=0.0+1.0e-10), 
    state.p(start = p2_init, min=0.0+1.0e-10), 
    state.T(start = T2_init, min=0.0+1.0e-10), 
    h(start = h2_init, min=0.0+1.0e-10)
  ) "flow station of outlet";
  
  
  
  /* ---------------------------------------------
                     Interface
  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow1_init, min=if (allowFlowReversal) then -Constants.inf else 0.0), 
    h_outflow(start = h1_init, min=0.0+1.0e-10),
    p(start=p1_init, min=0.0+1.0e-10)
  ) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow2_init, max=if allowFlowReversal then +Constants.inf else 0.0), 
    h_outflow(start = h2_init, min=0.0+1.0e-10),
    p(start=p2_init, min=0.0+1.0e-10)
  ) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_m_flow_fuel(quantity = "MassFlowRate", unit = "kg/s", displayUnit = "kg/s") "[kg/s], mass flow rate of fuel" annotation(
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_fuel(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow_fuel_init, min=if (allowFlowReversal) then -Constants.inf else 0.0), 
    h_outflow(start = hfuel_init, min=0.0+1.0e-10),
    p(start=pfuel_init, min=0.0+1.0e-10)
  ) annotation(
    Placement(visible = true, transformation(origin = {-80, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
protected
  /* ---------------------------------------------
          Non-modifiable parameters
    --------------------------------------------- */
  parameter Real effCombDes(fixed=false) annotation(
    HideResult=false);
  
  
  
initial algorithm
/* ---------------------------------------------
    debug print, command window  
  --------------------------------------------- */
  if printCmd == true then
    print("\n");
    print("---initialization---" + "\n");
    print("instance:" + getInstanceName() + "\n");
    print("port_1.m_flow= " + String(port_1.m_flow) + "\n");
    print("port_1.p= " + String(port_1.p) + "\n");
    print("port_1.h_outflow= " + String(port_1.h_outflow) + "\n");
    print("port_2.m_flow= " + String(port_2.m_flow) + "\n");
    print("port_2.p= " + String(port_2.p) + "\n");
    print("port_2.h_outflow= " + String(port_2.h_outflow) + "\n");
  end if;
algorithm
  /* ---------------------------------------------
    debug print, command window   
  --------------------------------------------- */
  if printCmd == true then
    print("\n");
    print("instance:" + getInstanceName() + "\n");
    print("port_1.m_flow= " + String(port_1.m_flow) + "\n");
    print("port_1.p= " + String(port_1.p) + "\n");
    print("port_1.h_outflow= " + String(port_1.h_outflow) + "\n");
    print("port_2.m_flow= " + String(port_2.m_flow) + "\n");
    print("port_2.p= " + String(port_2.p) + "\n");
    print("port_2.h_outflow= " + String(port_2.h_outflow) + "\n");
  end if;
equation
  connect(HeatInjector.port_2, port_2) annotation(
    Line(points = {{40, 0}, {98, 0}, {98, 0}, {100, 0}}, color = {0, 127, 255}));
  connect(Mixer.port_3, HeatInjector.port_1) annotation(
    Line(points = {{-20, 0}, {20, 0}, {20, 0}, {20, 0}}, color = {0, 127, 255}));
  connect(Combustion.y_Qcomb, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{12, 60}, {30, 60}, {30, 40}, {30, 40}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, HeatInjector.HeatPort_1) annotation(
    Line(points = {{30, 20}, {30, 20}, {30, 10}, {30, 10}}, color = {191, 0, 0}));
  connect(massFlowRate1.m_flow, Combustion.u_m_flow_fuel) annotation(
    Line(points = {{-68, 70}, {-32, 70}, {-32, 66}, {-11, 66}}, color = {0, 0, 127}));
  connect(Combustion.y_m_flow_fuel, y_m_flow_fuel) annotation(
    Line(points = {{11, 54}, {72, 54}, {72, -70}, {110, -70}}, color = {0, 0, 127}));
  connect(massFlowRate1.port_b, Mixer.port_2) annotation(
    Line(points = {{-80, 60}, {-80, 60}, {-80, 4}, {-40, 4}, {-40, 4}}, color = {0, 127, 255}));
  connect(port_fuel, massFlowRate1.port_a) annotation(
    Line(points = {{-80, 100}, {-80, 100}, {-80, 80}, {-80, 80}}, color = {0, 127, 255}));
  connect(port_1, Mixer.port_1) annotation(
    Line(points = {{-100, 0}, {-40, 0}, {-40, 0}, {-40, 0}}, color = {0, 127, 255}));
/* ---------------------------------------------
    Connections, interface <-> internal variables   
  --------------------------------------------- */
//-- fluidPort_1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
//-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow);
//--------------------
  Combustion.u_effComb = effComb;
//--------------------
  s_fluid_1 = Medium.specificEntropy(fluid_1.state);
  s_fluid_2= Medium.specificEntropy(fluid_2.state);
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Comb",
    Icon(graphics = {Text(origin = {0, -69}, extent = {{-80, 9}, {80, -11}}, textString = "%name"), Rectangle(origin = {-80, 40}, fillPattern = FillPattern.Solid, extent = {{-6, 40}, {6, -40}}), Rectangle(origin = {-72, 0}, fillPattern = FillPattern.Solid, extent = {{-14, 14}, {14, -14}}), Rectangle(origin = {-80, 40}, fillPattern = FillPattern.Solid, extent = {{-6, 40}, {6, -40}}), Line(origin = {21.84, 43.84}, points = {{-79.8365, -11.8365}, {-57.8365, 0.16351}, {-21.8365, 6.1635}, {76.1635, 6.1635}}, thickness = 0.75), Line(origin = {18.85, -40.85}, points = {{-76.8538, 6.85384}, {-52.8538, -3.14616}, {-14.8538, -7.14616}, {79.1462, -7.14616}}, thickness = 0.75), Polygon(origin = {18, 5}, lineColor = {184, 9, 55}, fillColor = {255, 11, 27}, fillPattern = FillPattern.Solid, lineThickness = 1.5, points = {{-64, -5}, {-60, 9}, {-48, 19}, {-32, 27}, {-12, 29}, {14, 29}, {32, 25}, {48, 13}, {58, 3}, {66, -9}, {46, 1}, {28, 3}, {16, 1}, {2, -7}, {-4, -15}, {-14, -23}, {-24, -29}, {-42, -29}, {-52, -27}, {-62, -15}, {-64, -5}}), Polygon(origin = {-5, 9}, lineColor = {217, 140, 7}, fillColor = {255, 183, 1}, fillPattern = FillPattern.Solid, points = {{-35, -5}, {-29, 1}, {-15, 9}, {1, 13}, {13, 15}, {27, 13}, {39, 9}, {21, 3}, {9, -1}, {1, -7}, {-7, -17}, {-17, -21}, {-27, -19}, {-35, -15}, {-37, -9}, {-35, -5}}), Rectangle(origin = {-59, -1}, fillPattern = FillPattern.Solid, extent = {{-7, 33}, {7, -33}})}, coordinateSystem(extent = {{-100, -80}, {100, 80}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
    Diagram(graphics = {Text(origin = {-60, -17}, fillPattern = FillPattern.Solid, extent = {{-14, 5}, {32, -3}}, textString = "mix air and fuel"), Text(origin = {2, 81}, fillPattern = FillPattern.Solid, extent = {{-24, 7}, {50, -7}}, textString = "calc. heat by combustion"), Text(origin = {24, -23}, fillPattern = FillPattern.Solid, extent = {{-24, 7}, {44, -3}}, textString = "heat into mixture gas"), Line(origin = {-65.811, -5.97099}, points = {{-18, 0}, {18, 0}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {-61.5509, 48.6934}, points = {{-10.1565, 3.5764}, {-10.1565, -26.4236}, {-2.15653, -36.4236}, {13.8435, -38.4236}}, arrow = {Arrow.None, Arrow.Filled}),  Line(origin = {45.243, -15.8836}, points = {{-18, 0}, {18, 0}}, arrow = {Arrow.None, Arrow.Filled})}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end CombustorBase02;
