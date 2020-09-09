within PropulsionSystem.Examples.WalkingInWorldOfThermoFluid;

model FlowResistance_ex02
  extends Modelica.Icons.Example;
  //----------
  replaceable package liquid1 = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = liquid1
  //----------
  inner Modelica.Fluid.System system(T_ambient(displayUnit = "K") = 15 + 273.15, p_ambient(displayUnit = "Pa") = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = liquid1, T = 15 + 273.15, m_flow = 1, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = liquid1, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {100, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = liquid1, diameter = 0.05, length = 5) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = liquid1, V = 1.0e-3, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = liquid1, V = 1.0e-3, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {60, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.OperatingSystem.SynchronizeRealtime synchronizeRealtime1 annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Utilities.TimeSignalOut timeSignalOut1 annotation(
    Placement(visible = true, transformation(origin = { -30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {4, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {70, 20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica_DeviceDrivers.Blocks.InputDevices.KeyboardInput keyboardInput1(sampleTime = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {-170, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Input.AccumulateDigitalInputSignal01 Accumulate(dt = 0.1, scl = 1, varInit = 10)  annotation(
    Placement(visible = true, transformation(origin = {-130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  InteractiveSimulation.Input.AccumulateDigitalInputSignal01 Accumulate1(dt = 0.1, scl = -1.0, varInit = 0) annotation(
    Placement(visible = true, transformation(origin = {-130, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = liquid1) annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  InteractiveSimulation.Output.dispVarPyConsole02_00 dispVarPyConsole(nVariables = 4, nameVariables = {"time[s]", "m_flow[kg/s]", "P_I[kPa]", "T_O[K}"})  annotation(
    Placement(visible = true, transformation(origin = {110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / 1000)  annotation(
    Placement(visible = true, transformation(origin = {20, -5}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
equation
  connect(Accumulate.y, add1.u1) annotation(
    Line(points = {{-119, 60}, {-117, 60}, {-117, 66}, {-113, 66}}, color = {0, 0, 127}));
  connect(keyboardInput1.keyUp, Accumulate.u) annotation(
    Line(points = {{-159, 66}, {-155, 66}, {-155, 60}, {-142, 60}}, color = {255, 0, 255}));
  connect(gain1.y, dispVarPyConsole.u_variables[3]) annotation(
    Line(points = {{20, -10}, {20, -10}, {20, -20}, {100, -20}, {100, -20}}, color = {0, 0, 127}));
  connect(pressure1.p, gain1.u) annotation(
    Line(points = {{16, 20}, {20, 20}, {20, 2}, {20, 2}}, color = {0, 0, 127}));
  connect(pressure1.port, pipe.port_a) annotation(
    Line(points = {{4, 30}, {20, 30}}, color = {0, 127, 255}));
  connect(volume.ports[2], pressure1.port) annotation(
    Line(points = {{-10, 30}, {4, 30}}, color = {0, 127, 255}));
  connect(pipe.port_b, volume1.ports[1]) annotation(
    Line(points = {{40, 30}, {60, 30}}, color = {0, 127, 255}));
  connect(timeSignalOut1.y, dispVarPyConsole.u_variables[1]) annotation(
    Line(points = {{-19, -40}, {12, -40}, {12, -20}, {99, -20}}, color = {0, 0, 127}));
  connect(temperature.T, dispVarPyConsole.u_variables[4]) annotation(
    Line(points = {{78, 20}, {86, 20}, {86, -20}, {99, -20}}, color = {0, 0, 127}));
  connect(massFlowRate1.m_flow, dispVarPyConsole.u_variables[2]) annotation(
    Line(points = {{-40, 18}, {-40, -20}, {99, -20}}, color = {0, 0, 127}));
  connect(boundary.ports[1], massFlowRate1.port_a) annotation(
    Line(points = {{-60, 30}, {-50, 30}, {-50, 30}, {-50, 30}}, color = {0, 127, 255}));
  connect(massFlowRate1.port_b, volume.ports[1]) annotation(
    Line(points = {{-30, 30}, {-14, 30}, {-14, 30}, {-10, 30}}, color = {0, 127, 255}));
  connect(volume1.ports[2], temperature.port) annotation(
    Line(points = {{60, 30}, {70, 30}, {70, 30}, {70, 30}}, color = {0, 127, 255}));
  connect(temperature.port, boundary1.ports[1]) annotation(
    Line(points = {{70, 30}, {90, 30}, {90, 30}, {90, 30}}, color = {0, 127, 255}));
  connect(add1.y, boundary.m_flow_in) annotation(
    Line(points = {{-89, 60}, {-85.5, 60}, {-85.5, 38}, {-80, 38}}, color = {0, 0, 127}));
  connect(keyboardInput1.keyDown, Accumulate1.u) annotation(
    Line(points = {{-170, 49}, {-170, 49}, {-170, 31}, {-142, 31}, {-142, 31}}, color = {255, 0, 255}));
  connect(Accumulate1.y, add1.u2) annotation(
    Line(points = {{-119, 30}, {-117, 30}, {-117, 54}, {-113, 54}, {-113, 54}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-180, -100}, {140, 100}})),
  __OpenModelica_commandLineOptions = "");
end FlowResistance_ex02;
