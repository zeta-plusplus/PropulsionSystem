within PropulsionSystem.BaseClasses.BasicElements;

model CombustorBase01
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
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Temperature T1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- fluid_fuel ---
  parameter Modelica.SIunits.MassFlowRate m_fuel_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_fuel"));
  parameter Modelica.SIunits.Pressure pfuel_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_fuel"));
  parameter Modelica.SIunits.Temperature Tfuel_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_fuel"));
  parameter Modelica.SIunits.SpecificEnthalpy hfuel_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_fuel"));
  
  
  /* ---------------------------------------------
           Internal variables
  --------------------------------------------- */
  Modelica.SIunits.MassFlowRate m_flow_max;
  Modelica.SIunits.MassFlowRate m_flow_min;
  Medium.MassFraction X_fuel[Medium.nX];
  Medium.ExtraProperty C_fuel[Medium.nC];
  Real effComb;
  
  
  
  /* ---------------------------------------------
           Internal objects
  --------------------------------------------- */  
  Medium.BaseProperties fluid_1(p.start = p1_init, T.start = T1_init, state.p.start = p1_init, state.T.start = T1_init, h.start = h1_init) "flow station of inlet";
  Medium.BaseProperties fluid_2(p.start = p1_init, T.start = T1_init, state.p.start = p1_init, state.T.start = T1_init, h.start = h1_init) "flow station of inlet";
  Medium.BaseProperties fluid_fuel(p.start = pfuel_init, T.start = Tfuel_init, state.p.start = pfuel_init, state.T.start = Tfuel_init, h.start = hfuel_init) "flow station of inlet";
  Medium.BaseProperties fluid_1afterMix(p.start = p1_init, T.start = T1_init, state.p.start = p1_init, state.T.start = T1_init, h.start = h1_init) "flow station of inlet";
  PropulsionSystem.Subelements.Combustion00 Combustion annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  
  
  /* ---------------------------------------------
                 Interface
  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium, m_flow(start = m_flow1_init), h_outflow.start = h1_init) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init), h_outflow.start = h2_init) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_m_flow_fuel(quantity = "MassFlowRate", unit = "kg/s", displayUnit = "kg/s") "[kg/s], mass flow rate of fuel" annotation(
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u_m_flow_fuel(quantity = "MassFlowRate", unit = "kg/s", displayUnit = "kg/s") "[kg/s], mass flow rate of fuel" annotation(
    Placement(visible = true, transformation(origin = {-80, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-80, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u_h_fuel(quantity = "SpecificEnthalpy", unit = "J/kg", displayUnit = "J/kg") annotation(
    Placement(visible = true, transformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-60, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
    print("instance:" + String(getInstanceName()) + "\n");
    print("port_1.m_flow= " + String(port_1.m_flow) + "\n");
    print("port_1.p= " + String(port_1.p) + "\n");
    print("port_1.h_outflow= " + String(port_1.h_outflow) + "\n");
    print("port_2.m_flow= " + String(port_2.m_flow) + "\n");
    print("port_2.p= " + String(port_2.p) + "\n");
    print("port_2.h_outflow= " + String(port_2.h_outflow) + "\n");
  end if;
algorithm
  
  /*
  if(u_m_flow_fuel>0.0)then
    //----- mixing -----
    fluid_1afterMix.Xi := (port_1.m_flow * fluid_1.Xi + u_m_flow_fuel * X_fuel) / (port_1.m_flow + u_m_flow_fuel);
    fluid_1afterMix.p := fluid_1.p;
    fluid_1afterMix.h := (port_1.m_flow * fluid_1.h + u_m_flow_fuel * fluid_fuel.h) / (port_1.m_flow + u_m_flow_fuel);
    port_2.m_flow := -1.0*(port_1.m_flow + u_m_flow_fuel);
    //----- heat injection -----
    fluid_2.p := fluid_1.p;
    fluid_2.Xi := fluid_1afterMix.Xi;
    fluid_2.h := (fluid_1afterMix.h * (port_1.m_flow + u_m_flow_fuel) + Combustion.y_Qcomb)/(port_1.m_flow + u_m_flow_fuel);
  else
    //----- mixing -----
    fluid_1afterMix.Xi := fluid_1.Xi;
    fluid_1afterMix.p := fluid_1.p;
    fluid_1afterMix.h := fluid_1.h;
    port_2.m_flow := -1.0*(port_1.m_flow);
    //----- heat injection -----
    fluid_2.p := fluid_1.p;
    fluid_2.Xi := fluid_1.Xi;
    fluid_2.h := fluid_1.h;
    
  end if;
  */
  
  /* ---------------------------------------------
    debug print, command window   
  --------------------------------------------- */
  if printCmd == true then
    print("\n");
    print("instance:" + String(getInstanceName()) + "\n");
    print("port_1.m_flow= " + String(port_1.m_flow) + "\n");
    print("port_1.p= " + String(port_1.p) + "\n");
    print("port_1.h_outflow= " + String(port_1.h_outflow) + "\n");
    print("port_2.m_flow= " + String(port_2.m_flow) + "\n");
    print("port_2.p= " + String(port_2.p) + "\n");
    print("port_2.h_outflow= " + String(port_2.h_outflow) + "\n");
  end if;
equation
  connect(Combustion.y_m_flow_fuel, y_m_flow_fuel) annotation(
    Line(points = {{11, 44}, {72, 44}, {72, -70}, {110, -70}}, color = {0, 0, 127}));
/* ---------------------------------------------
    Connections, interface <-> internal variables   
  --------------------------------------------- */
// distinguish inlet side
  m_flow_max = max(port_1.m_flow, port_2.m_flow);
  m_flow_min = min(port_1.m_flow, port_2.m_flow);
//-- fluidPort_1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
//-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow);
  
  
  if(allowFlowReversal==false)then
    port_1.h_outflow = fluid_1.h;
    port_1.Xi_outflow = fluid_1.Xi;  
  else
    if m_flow_max == port_1.m_flow then
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
    elseif m_flow_max == port_2.m_flow then
      port_2.h_outflow = fluid_2.h;
      port_2.Xi_outflow = fluid_2.Xi;
    else
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
    end if;
  end if;
//--------------------
  fluid_fuel.Xi = X_fuel;
  fluid_fuel.p = port_1.p;
  fluid_fuel.h = u_h_fuel;
//--------------------
  Combustion.u_effComb = effComb;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  if u_m_flow_fuel > 0.0 then
//----- mixing -----
    fluid_1afterMix.Xi = (port_1.m_flow * fluid_1.Xi + u_m_flow_fuel * X_fuel) / (port_1.m_flow + u_m_flow_fuel);
    fluid_1afterMix.p = fluid_1.p;
    fluid_1afterMix.h = (port_1.m_flow * fluid_1.h + u_m_flow_fuel * fluid_fuel.h) / (port_1.m_flow + u_m_flow_fuel);
    port_1.m_flow + u_m_flow_fuel + port_2.m_flow = 0;
//----- heat injection -----
    fluid_2.p = fluid_1.p;
    fluid_2.Xi = fluid_1afterMix.Xi;
    fluid_1afterMix.h * (port_1.m_flow + u_m_flow_fuel) + fluid_2.h * port_2.m_flow + Combustion.y_Qcomb = 0.0;
  else
//----- mixing -----
    fluid_1afterMix.Xi = fluid_1.Xi;
    fluid_1afterMix.p = fluid_1.p;
    fluid_1afterMix.h = fluid_1.h;
    port_1.m_flow + port_2.m_flow = 0;
//----- heat injection -----
    fluid_2.p = fluid_1.p;
    fluid_2.Xi = fluid_1afterMix.Xi;
    fluid_1afterMix.h * port_1.m_flow + fluid_2.h * port_2.m_flow = 0.0;
  end if;
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Comb",
    Icon(graphics = {Text(origin = {0, -69}, extent = {{-80, 9}, {80, -11}}, textString = "%name"), Rectangle(origin = {-59, -1}, fillPattern = FillPattern.Solid, extent = {{-7, 33}, {7, -33}}), Rectangle(origin = {-80, 40}, fillPattern = FillPattern.Solid, extent = {{-6, 40}, {6, -40}}), Rectangle(origin = {-72, 0}, fillPattern = FillPattern.Solid, extent = {{-14, 14}, {14, -14}}), Line(origin = {21.84, 43.84}, points = {{-79.8365, -11.8365}, {-57.8365, 0.16351}, {-21.8365, 6.1635}, {76.1635, 6.1635}}, thickness = 0.75), Line(origin = {18.85, -40.85}, points = {{-76.8538, 6.85384}, {-52.8538, -3.14616}, {-14.8538, -7.14616}, {79.1462, -7.14616}}, thickness = 0.75), Polygon(origin = {18, 7}, lineColor = {184, 9, 55}, fillColor = {255, 11, 27}, fillPattern = FillPattern.Solid, lineThickness = 1.5, points = {{-64, -5}, {-60, 9}, {-48, 19}, {-32, 27}, {-12, 29}, {14, 29}, {32, 25}, {48, 13}, {58, 3}, {66, -9}, {46, 1}, {28, 3}, {16, 1}, {2, -7}, {-4, -15}, {-14, -23}, {-24, -29}, {-42, -29}, {-52, -27}, {-62, -15}, {-64, -5}}), Polygon(origin = {-5, 9}, lineColor = {217, 140, 7}, fillColor = {255, 183, 1}, fillPattern = FillPattern.Solid, points = {{-35, -5}, {-29, 1}, {-15, 9}, {1, 13}, {13, 15}, {27, 13}, {39, 9}, {21, 3}, {9, -1}, {1, -7}, {-7, -17}, {-17, -21}, {-27, -19}, {-35, -15}, {-37, -9}, {-35, -5}})}, coordinateSystem(extent = {{-100, -80}, {100, 80}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
    Diagram(graphics = {Text(origin = {-60, -17}, fillPattern = FillPattern.Solid, extent = {{-14, 5}, {32, -3}}, textString = "mix air and fuel"), Text(origin = {2, 67}, fillPattern = FillPattern.Solid, extent = {{-24, 7}, {50, -7}}, textString = "calc. heat by combustion"), Text(origin = {24, -17}, fillPattern = FillPattern.Solid, extent = {{-24, 7}, {44, -3}}, textString = "heat into mixture gas"), Line(origin = {-58.4282, 2.77901}, points = {{-18, 0}, {18, 0}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {-47.84, 48.42}, points = {{-14.1565, 37.5764}, {-14.1565, -10.4236}, {-0.156532, -32.4236}, {13.8435, -38.4236}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {24.9977, 35.442}, points = {{-3, 15}, {9, 15}, {9, -27}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {44.9696, 4.07735}, points = {{-18, 0}, {18, 0}}, arrow = {Arrow.None, Arrow.Filled})}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end CombustorBase01;
