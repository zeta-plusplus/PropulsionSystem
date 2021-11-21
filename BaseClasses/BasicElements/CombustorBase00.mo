within PropulsionSystem.BaseClasses.BasicElements;

partial model CombustorBase00
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
  
  
  
  /* ---------------------------------------------
      parameters
  --------------------------------------------- */
  //********** Initialization Parameters **********
  //--- fluid_1, port_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = 20*101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Temperature T1_init(displayUnit = "K") = 800 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = T1_init*1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = p1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 1600.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = T2_init*1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- others ---
  parameter Real effComb_init=0.999 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  
  
  
  /* ---------------------------------------------
      Internal variables
  --------------------------------------------- */
  Real effComb(start=effComb_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
  
  /* ---------------------------------------------
           Internal objects
  --------------------------------------------- */  
  PropulsionSystem.Elements.BasicElements.HeatInjector00 HeatInjector(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.Combustion00 Combustion annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
  
  
  /* ---------------------------------------------
            Interface
  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow1_init, min=if (allowFlowReversal) then -Constants.inf else 0.0), 
    h_outflow(start = h1_init), 
    p(start=p1_init)
  ) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow2_init, max=if allowFlowReversal then +Constants.inf else 0.0), 
    h_outflow(start = h2_init), 
    p(start=p2_init)
  ) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_m_flow_fuel(quantity = "MassFlowRate", unit = "kg/s", displayUnit = "kg/s") "[kg/s], mass flow rate of fuel" annotation(
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
protected
  /* ---------------------------------------------
          Non-modifiable parameters
    --------------------------------------------- */
  parameter Real effCombDes(fixed=false) annotation(
    HideResult=false);
  
  
equation
  connect(Combustion.y_m_flow_fuel, y_m_flow_fuel) annotation(
    Line(points = {{-39, 44}, {72, 44}, {72, -70}, {110, -70}}, color = {0, 0, 127}));
  connect(Combustion.y_Qcomb, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-39, 50}, {-10, 50}, {-10, 40}}, color = {0, 0, 127}));
  connect(prescribedHeatFlow1.port, HeatInjector.HeatPort_1) annotation(
    Line(points = {{-10, 20}, {-10, 20}, {-10, 10}, {-10, 10}}, color = {191, 0, 0}));
  connect(HeatInjector.port_2, port_2) annotation(
    Line(points = {{0, 0}, {100, 0}}, color = {0, 127, 255}));
  connect(port_1, HeatInjector.port_1) annotation(
    Line(points = {{-100, 0}, {-20, 0}}, color = {0, 127, 255}));
  
  /* ---------------------------------------------
    Connections, interface <-> internal variables
  --------------------------------------------- */
  Combustion.u_effComb= effComb;
//--------------------
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Comb",
    Icon(graphics = {Text(origin = {0, -69}, extent = {{-80, 9}, {80, -11}}, textString = "%name"), Rectangle(origin = {-59, -1}, fillPattern = FillPattern.Solid, extent = {{-7, 33}, {7, -33}}), Rectangle(origin = {-72, 0}, fillPattern = FillPattern.Solid, extent = {{-14, 14}, {14, -14}}), Line(origin = {21.84, 43.84}, points = {{-79.8365, -11.8365}, {-57.8365, 0.16351}, {-21.8365, 6.1635}, {76.1635, 6.1635}}, thickness = 0.75), Line(origin = {18.85, -40.85}, points = {{-76.8538, 6.85384}, {-52.8538, -3.14616}, {-14.8538, -7.14616}, {79.1462, -7.14616}}, thickness = 0.75), Polygon(origin = {18, 7}, lineColor = {184, 9, 55}, fillColor = {255, 11, 27}, fillPattern = FillPattern.Solid, lineThickness = 1.5, points = {{-64, -5}, {-60, 9}, {-48, 19}, {-32, 27}, {-12, 29}, {14, 29}, {32, 25}, {48, 13}, {58, 3}, {66, -9}, {46, 1}, {28, 3}, {16, 1}, {2, -7}, {-4, -15}, {-14, -23}, {-24, -29}, {-42, -29}, {-52, -27}, {-62, -15}, {-64, -5}}), Polygon(origin = {-5, 9}, lineColor = {217, 140, 7}, fillColor = {255, 183, 1}, fillPattern = FillPattern.Solid, points = {{-35, -5}, {-29, 1}, {-15, 9}, {1, 13}, {13, 15}, {27, 13}, {39, 9}, {21, 3}, {9, -1}, {1, -7}, {-7, -17}, {-17, -21}, {-27, -19}, {-35, -15}, {-37, -9}, {-35, -5}})}, coordinateSystem(extent = {{-100, -80}, {100, 80}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end CombustorBase00;
