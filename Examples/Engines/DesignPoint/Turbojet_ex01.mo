within PropulsionSystem.Examples.Engines.DesignPoint;

model Turbojet_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-30, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid annotation(
    Placement(visible = true, transformation(origin = {-240, 10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt annotation(
    Placement(visible = true, transformation(origin = {-140, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1 annotation(
    Placement(visible = true, transformation(origin = {-190, 6}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint_m_flow_inlet annotation(
    Placement(visible = true, transformation(origin = {-190, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct030 annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed00 Comb annotation(
    Placement(visible = true, transformation(origin = {-0.156726, 29.6345}, extent = {{-19.8433, -13.8903}, {19.8433, 15.8746}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb annotation(
    Placement(visible = true, transformation(origin = {60, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.DuctCharFixed00 Duct050 annotation(
    Placement(visible = true, transformation(origin = {98, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl annotation(
    Placement(visible = true, transformation(origin = {140, -10}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature040 annotation(
    Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint_TIT annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-16, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance00 Perf annotation(
    Placement(visible = true, transformation(origin = {232, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {-10, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver1 annotation(
    Placement(visible = true, transformation(origin = {-10, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint_pwrExt annotation(
    Placement(visible = true, transformation(origin = {-30, -70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(temperature040.T, Constraint_TIT.u_variable) annotation(
    Line(points = {{37, 40}, {49, 40}, {49, 58}, {49, 58}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, Comb.u_m_flow_fuel) annotation(
    Line(points = {{-16, 59}, {-16, 48}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, Nzl.port_2) annotation(
    Line(points = {{-234, 30}, {-234, 98}, {160, 98}, {160, 6}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, massFlowRate1.port_a) annotation(
    Line(points = {{-220, 0}, {-210, 0}, {-210, 6}, {-200, 6}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt.u_V_infini) annotation(
    Line(points = {{-218, -8}, {-210, -8}, {-210, -18}, {-154, -18}}, color = {0, 0, 127}));
  connect(massFlowRate1.port_b, Inlt.port_1) annotation(
    Line(points = {{-180, 6}, {-160, 6}}, color = {0, 127, 255}));
  connect(massFlowRate1.m_flow, Constraint_m_flow_inlet.u_variable) annotation(
    Line(points = {{-190, -5}, {-190, -47}}, color = {0, 0, 127}));
  connect(Cmp.port_2, Duct030.port_1) annotation(
    Line(points = {{-60, 6}, {-56, 6}, {-56, 30}, {-50, 30}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Comb.port_1) annotation(
    Line(points = {{-30, 30}, {-20, 30}}, color = {0, 127, 255}));
  connect(temperature040.port, Trb.port_1) annotation(
    Line(points = {{30, 30}, {30, 6}, {40, 6}}, color = {0, 127, 255}));
  connect(Comb.port_2, temperature040.port) annotation(
    Line(points = {{19.6866, 30.1266}, {24.6866, 30.1266}, {24.6866, 30}, {30, 30}}, color = {0, 127, 255}));
  connect(Duct050.port_2, Nzl.port_1) annotation(
    Line(points = {{108, 6}, {120, 6}}, color = {0, 127, 255}));
  connect(Trb.port_2, Duct050.port_1) annotation(
    Line(points = {{80, 6}, {88, 6}}, color = {0, 127, 255}));
  connect(Inlt.port_2, Cmp.port_1) annotation(
    Line(points = {{-120, 6}, {-100, 6}, {-100, 6}, {-100, 6}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, Trb.flange_1) annotation(
    Line(points = {{-60, -10}, {40, -10}}));
  connect(Trb.flange_1, powerSensor1.flange_a) annotation(
    Line(points = {{40.4, -10}, {-9.6, -10}, {-9.6, -40}}));
  connect(powerSensor1.power, Constraint_pwrExt.u_variable) annotation(
    Line(points = {{-21, -42}, {-29, -42}, {-29, -58}, {-29, -58}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_b, torque1.flange) annotation(
    Line(points = {{-10, -60}, {-10, -60}, {-10, -70}, {-10, -70}}));
  connect(torque1.tau, VarBySolver1.y_independent) annotation(
    Line(points = {{-10, -92}, {-10, -92}, {-10, -98}, {-10, -98}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-300, -160}, {300, 140}})),
    __OpenModelica_commandLineOptions = "");end Turbojet_ex01;
