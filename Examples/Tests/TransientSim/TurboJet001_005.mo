within PropulsionSystem.Examples.Tests.TransientSim;

model TurboJet001_005
  extends Modelica.Icons.Example;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0, alt = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {40, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1600, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated) annotation(
    Placement(visible = true, transformation(origin = {70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1(dm_fuel_des = 0.1, switchCausality_dq = PropulsionSystem.Elements.BasicElements.CombustFuel.switchCausality_GeneratedHeat.input_dmFuel, switchInput_dm_fuel = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, dPqPdes = 0.03) annotation(
    Placement(visible = true, transformation(origin = {140, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium = engineAir, Amech_th_def = 0.0195384) annotation(
    Placement(visible = true, transformation(origin = {170, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {210, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //-----
  PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb041(redeclare package Medium = engineAir, PRdes = 2.42403, Tdes_1(displayUnit = "K") = 1600, dmDes_1 = 10, effDes = 0.9, pDes_1 = 754659, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchDef_NcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, PRdes = 8, Tdes_1(displayUnit = "K") = 288.16, pDes_1 = 96257.5, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true, thetaCurveDes = 3.14 / 4) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_rating(duration = 0.1, height = 0.2, offset = 0.1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShM(J = 100, a(fixed = true, start = 0), w(fixed = false)) annotation(
    Placement(visible = true, transformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  model NukeTurbojet001_002
    extends Modelica.Icons.Example;
    package engineAir = Modelica.Media.Air.DryAirNasa;
    //-----
    PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0, alt = 0) annotation(
      Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir, m_flow1_init = 11.9, p2_init = 96.26 * 1000) annotation(
      Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, T1_init = 615.3, T2_init = 615.3, dPqPdes = 0.02, h1_init = 1.004 * 1000 * 615.3, h2_init = 1.004 * 1000 * 615.3, m_flow1_init = 11.9, p1_init = 937.9 * 1000, p2_init = 919.2 * 1000) annotation(
      Placement(visible = true, transformation(origin = {28, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, T1_init = 615.3, T2_init = 1554, TtOutletDes(displayUnit = "K") = 1600, h1_init = 1.004 * 1000 * 615.3, h2_init = 1.004 * 1000 * 1554, m_flow1_init = 11.9, p1_init = 919.2 * 1000, p2_init = 919.2 * 1000, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated) annotation(
      Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, T1_init = 1275, T2_init = 1275, dPqPdes = 0.03, h1_init = 1.004 * 1000 * 1275, h2_init = 1.004 * 1000 * 1275, m_flow1_init = 11.9, p1_init = 359.0 * 1000, p2_init = 348.2 * 1000) annotation(
      Placement(visible = true, transformation(origin = {220, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl070(redeclare package Medium = engineAir, Amech_th_def = 0.0195384, T1_init = 1275, T2Tot_init = 1275, T2_init = 945.3, TStat_th_init = 945.3, h1_init = 1.004 * 1000 * 1275, h2Tot_init = 1.004 * 1000 * 1275, h2_init = 1.004 * 1000 * 945.3, hStat_th_init = 1.004 * 1000 * 945.3, m_flow1_init = 11.9, p1_init = 348.2 * 1000, p2Tot_init = 348.2 * 1000) annotation(
      Placement(visible = true, transformation(origin = {280, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
      Placement(visible = true, transformation(origin = {320, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    //-----
    PropulsionSystem.Elements.BasicElements.Turbine_Map_WcEff Trb041(redeclare package Medium = engineAir, PRdes = 2.42403, T1_init = 1554, T2_init = 1275, Tdes_1(displayUnit = "K") = 1600, dmDes_1 = 10, effDes = 0.9, h1_init = 1.004 * 1000 * 1554, h2_init = 1.004 * 1000 * 1275, m_flow1_init = 11.9, p1_init = 919.2 * 1000, p2_init = 359.0 * 1000, pDes_1 = 754659, pathName_tableFile = "./tableData/table_Trb_PR_NcqNcDes_001.txt", switchDef_NcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_PR_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchDef_s_eff_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true) annotation(
      Placement(visible = true, transformation(origin = {160, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, PRdes = 8, T2_init = 615.3, Tdes_1(displayUnit = "K") = 288.16, h2_init = 1.004 * 1000 * 615.3, m_flow1_init = 11.9, p1_init = 96.26 * 1000, p2_init = 937.9 * 1000, pDes_1 = 96257.5, pathName_tableFile = "./tableData/table_Cmp_theta_NcqNcDes_001.txt", switchSmoothness = Modelica.Blocks.Types.Smoothness.ContinuousDerivative, switchUseMapDataFile_PR = true, switchUseMapDataFile_Wc = true, switchUseMapDataFile_eff = true, thetaCurveDes = 3.14 / 4) annotation(
      Placement(visible = true, transformation(origin = {-32, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp_rho_control(duration = 10, height = 1000, offset = -1000, startTime = 60) annotation(
      Placement(visible = true, transformation(origin = {30, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner EngineSimEnvironment environment annotation(
      Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
      Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.Inertia ShM(J = 100, a(fixed = true, start = 0)) annotation(
      Placement(visible = true, transformation(origin = {60, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Fluid.Vessels.ClosedVolume Vol042(redeclare package Medium = engineAir, T_start = 1275, V = 1, nPorts = 2, p_start = 359 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
      Placement(visible = true, transformation(origin = {190, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Fluid.Vessels.ClosedVolume Vol046(redeclare package Medium = engineAir, T_start = 1275, V = 1, nPorts = 2, p_start = 348.2 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
      Placement(visible = true, transformation(origin = {250, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Fluid.Vessels.ClosedVolume Vol030(redeclare package Medium = engineAir, T_start = 615.3, V = 1, nPorts = 2, p_start = 937.9 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
      Placement(visible = true, transformation(origin = {-2, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Fluid.Vessels.ClosedVolume Vol040(redeclare package Medium = engineAir, T_start = 1554, V = 1, nPorts = 2, p_start = 919.2 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
      Placement(visible = true, transformation(origin = {120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Fluid.Vessels.ClosedVolume Vol036(redeclare package Medium = engineAir, T_start = 615.3, V = 1, nPorts = 2, p_start = 919.2 * 1000, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Thermal.HeatTransfer.Components.Convection convection030 annotation(
      Placement(visible = true, transformation(origin = {10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor030(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 615.3)) annotation(
      Placement(visible = true, transformation(origin = {10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Blocks.Sources.Constant Gcs(k = 10000) annotation(
      Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.Convection convection036 annotation(
      Placement(visible = true, transformation(origin = {70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor036(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 615.3)) annotation(
      Placement(visible = true, transformation(origin = {70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Thermal.HeatTransfer.Components.Convection convection040 annotation(
      Placement(visible = true, transformation(origin = {130, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor040(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 1554)) annotation(
      Placement(visible = true, transformation(origin = {130, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Thermal.HeatTransfer.Components.Convection convection042 annotation(
      Placement(visible = true, transformation(origin = {200, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor042(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 1275)) annotation(
      Placement(visible = true, transformation(origin = {200, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor046(C = 10 * 1000, T(displayUnit = "K", fixed = true, start = 1275)) annotation(
      Placement(visible = true, transformation(origin = {260, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Modelica.Thermal.HeatTransfer.Components.Convection convection046 annotation(
      Placement(visible = true, transformation(origin = {260, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

    model MoltenSaltReactor
      extends Modelica.Icons.Example;
      //----------
      package reactorFuel = Nuclear.FuelSaltLiFBeF2(final singleState = true, final enthalpyOfT = true);
      // redeclare package Medium = reactorFuel
      //package liquid2 = Modelica.Media.Water.StandardWaterOnePhase;
      //package engineAir = Modelica.Media.Air.DryAirNasa;
      // redeclare package Medium = engineAir
      //----------
      inner Modelica.Fluid.System system annotation(
        Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Sources.Ramp ramp1(duration = 100, height = 0, offset = 0, startTime = 20) annotation(
        Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = reactorFuel, T_start = 1000, V = 1e-6, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
        Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = reactorFuel, diameter = 0.1, length = 0.5) annotation(
        Placement(visible = true, transformation(origin = {94, -40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = reactorFuel) annotation(
        Placement(visible = true, transformation(origin = {40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Math.Add add1 annotation(
        Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Blocks.Sources.Ramp Tfuel_ref(duration = 300, height = 0, offset = -1400, startTime = 100) annotation(
        Placement(visible = true, transformation(origin = {70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Blocks.Math.Gain Tfuel_rho_feedback(k = -9.5) annotation(
        Placement(visible = true, transformation(origin = {20, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Blocks.Math.Add3 add31 annotation(
        Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Sources.Constant rho0(k = -2) annotation(
        Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Nuclear.PointKineticMoltenSaltReactor_P1 pointKineticMoltenSaltReactor_P11(NominalPower = 1e7 / 1e6, T_ref = 600) annotation(
        Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Sources.Boundary_pT tank(redeclare package Medium = reactorFuel, nPorts = 1, p = 101.3 * 1000) annotation(
        Placement(visible = true, transformation(origin = {-50, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = reactorFuel) annotation(
        Placement(visible = true, transformation(origin = {10, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = reactorFuel, nPorts = 1, use_T_in = true, use_m_flow_in = true) annotation(
        Placement(visible = true, transformation(origin = {-10, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
      Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = reactorFuel, T_start = 1000, V = 10e-6, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
        Placement(visible = true, transformation(origin = {-20, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Sensors.Temperature temperature2(redeclare package Medium = reactorFuel) annotation(
        Placement(visible = true, transformation(origin = {40, -104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Fluid.Vessels.ClosedVolume volume2(redeclare package Medium = reactorFuel, T_start = 1000, V = 1e-6, nPorts = 3, use_HeatTransfer = true, use_portsData = false) annotation(
        Placement(visible = true, transformation(origin = {10, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
      Modelica.Thermal.HeatTransfer.Components.Convection convection1 annotation(
        Placement(visible = true, transformation(origin = {20, -170}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
      Modelica.Blocks.Sources.Constant const(k = 1e5) annotation(
        Placement(visible = true, transformation(origin = {50, -170}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b annotation(
        Placement(visible = true, transformation(origin = {20, -200}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u_rho_control annotation(
        Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
      Modelica.Blocks.Interfaces.RealInput u_m_flow_fuel annotation(
        Placement(visible = true, transformation(origin = {-120, -70}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    equation
      connect(volume.ports[2], pipe.port_a) annotation(
        Line(points = {{10, -30}, {94, -30}}, color = {0, 127, 255}));
      connect(volume2.ports[2], pipe.port_b) annotation(
        Line(points = {{10, -130}, {94, -130}, {94, -50}}, color = {0, 127, 255}));
      connect(u_m_flow_fuel, boundary.m_flow_in) annotation(
        Line(points = {{-120, -70}, {-18, -70}, {-18, -60}}, color = {0, 0, 127}));
      connect(u_rho_control, pointKineticMoltenSaltReactor_P11.rho_control) annotation(
        Line(points = {{-120, 0}, {-72, 0}, {-72, 5.5}, {-49, 5.5}}, color = {0, 0, 127}));
      connect(convection1.Gc, const.y) annotation(
        Line(points = {{30, -170}, {40, -170}, {40, -170}, {38, -170}}, color = {0, 0, 127}));
      connect(volume2.heatPort, convection1.solid) annotation(
        Line(points = {{20, -140}, {20, -160}}, color = {191, 0, 0}));
      connect(convection1.fluid, port_b) annotation(
        Line(points = {{20, -180}, {20, -200}}, color = {191, 0, 0}));
      connect(volume1.ports[2], volume2.ports[1]) annotation(
        Line(points = {{-20, -110}, {-20, -130}, {10, -130}}, color = {0, 127, 255}, thickness = 0.5));
      connect(volume2.ports[3], temperature2.port) annotation(
        Line(points = {{10, -130}, {10, -118}, {40, -118}, {40, -114}}, color = {0, 127, 255}));
      connect(volume1.ports[3], temperature1.port) annotation(
        Line(points = {{-20, -110}, {10, -110}, {10, -100}, {10, -100}}, color = {0, 127, 255}));
      connect(tank.ports[1], volume1.ports[1]) annotation(
        Line(points = {{-40, -100}, {-40, -110}, {-20, -110}}, color = {0, 127, 255}, thickness = 0.5));
      connect(temperature1.T, boundary.T_in) annotation(
        Line(points = {{17, -90}, {27, -90}, {27, -72}, {-14, -72}, {-14, -62}}, color = {0, 0, 127}));
      connect(boundary.ports[1], volume.ports[1]) annotation(
        Line(points = {{-10, -40}, {-10, -30}, {10, -30}}, color = {0, 127, 255}, thickness = 0.5));
      connect(add31.y, pointKineticMoltenSaltReactor_P11.rho) annotation(
        Line(points = {{-70, 19}, {-70, 16}, {-49, 16}}, color = {0, 0, 127}));
      connect(pointKineticMoltenSaltReactor_P11.port_b, volume.heatPort) annotation(
        Line(points = {{-31, 17}, {-22, 17}, {-22, -20}, {0, -20}}, color = {191, 0, 0}));
      connect(add31.u2, rho0.y) annotation(
        Line(points = {{-70, 42}, {-70, 54}, {-50, 54}, {-50, 58}}, color = {0, 0, 127}));
      connect(add31.u1, Tfuel_rho_feedback.y) annotation(
        Line(points = {{-62, 42}, {-62, 48}, {-8, 48}, {-8, 70}, {9, 70}}, color = {0, 0, 127}));
      connect(ramp1.y, add31.u3) annotation(
        Line(points = {{-90, 49}, {-90, 46}, {-78, 46}, {-78, 42}}, color = {0, 0, 127}));
      connect(Tfuel_rho_feedback.u, add1.y) annotation(
        Line(points = {{32, 70}, {40, 70}, {40, 51}}, color = {0, 0, 127}));
      connect(add1.u2, Tfuel_ref.y) annotation(
        Line(points = {{46, 28}, {46, 20}, {59, 20}}, color = {0, 0, 127}));
      connect(temperature.T, add1.u1) annotation(
        Line(points = {{47, -10}, {47, -10.5}, {55, -10.5}, {55, 13}, {34, 13}, {34, 28}}, color = {0, 0, 127}));
      connect(volume.ports[3], temperature.port) annotation(
        Line(points = {{10, -30}, {25, -30}, {25, -20}, {40, -20}}, color = {0, 127, 255}));
      annotation(
        Diagram(coordinateSystem(extent = {{-100, -200}, {100, 100}}), graphics = {Rectangle(origin = {-28, 33}, pattern = LinePattern.Dash, extent = {{-80, 73}, {106, -65}}), Text(origin = {10, 94}, extent = {{-34, 6}, {34, -6}}, textString = "reactor core")}),
        __OpenModelica_commandLineOptions = "",
        Icon(graphics = {Rectangle(origin = {-66, 75}, fillColor = {240, 240, 240}, fillPattern = FillPattern.Solid, extent = {{-34, 25}, {166, -175}}), Text(origin = {-10, -52}, extent = {{-90, -8}, {110, -38}}, textString = "reactor"), Bitmap(origin = {-4, 37}, extent = {{-86, 63}, {94, -97}}, imageSource = "/9j/4AAQSkZJRgABAQEAlgCWAAD/2wBDAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRT/2wBDAQMEBAUEBQkFBQkUDQsNFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBT/wAARCAIMAl0DASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD9BaKKK/ysPuAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiub+JHxC0b4U+A9b8XeIJmg0fS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C4I4civvrwD8NvC3wt0GPRvCWgWHh/TE58ixhEYY/wB5z1dv9piT710lFfzlnvFeccST5sxruUekVpFekVp83d+Z7FKhTor3EFFFFfIm4UUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFAHIePvg/4I+Kdqbfxd4T0fxEm3ar6hZpJIn+45G5D7qRXzb44/4JX/AAQ8VeY+k22teEZ25H9l6gZYwfdZxJx7Aj2xX2DRX0WW8RZxlFlgMVOmuyk7f+A7fgYzo06nxRTPy68cf8EdfEFsZJPB/wAQtN1EHlbfW7OS1K+xkjMmfrtFeJ+J/wDgmT8ffDu9rfw1Y69GvV9L1SA8eoWVkY/gM1+2NFfpOC8XuJ8KkqsoVf8AFD/5BxOOWX0ZbXR/Pn4m/Zf+Lvg9m/tb4a+KLZF6zLpc0sX/AH8RSv61wGqeH9V0Ntuo6ZeWDZxi6geM/wDjwFf0l0jKsilWUMp4IIyDX2WH8cMVFL6xgYy/wzcfzjI53lsekj+aaiv6NtT+GvhDWm3aj4V0S/bruutOhkP/AI8prJl+A3wzn/1vw68Jyf72h2p/9kr2oeOGFa9/AyXpNP8A9tRn/Zsukj+d+iv6Fv8AhnH4TFw5+F/gwuOjf8I/aZ/9F1p2fwZ+H2n4+y+BfDVtjp5OkW6fySrl44YK3u4GT/7eX+TF/Zsv5j+dYAk4Aya6jQ/hX418T7f7G8H69q277v2HTJ5s/Tapr+h/TvC+i6O4ew0iwsnXo1vbJGR+QrTrzK/jjJq1DL7etS/4KC/MtZZ3n+B+Cvhv9iH47eK5ESy+GOuwFuh1KJbED6mdkxXs3hH/AIJM/GPXNj6xf+HPDcR+8lxePcTD6LEjKf8AvsV+wlFfKYzxm4grq2Hp06a9G3+Lt+B0Ry6kt22fnb4G/wCCO3h6zkjl8YfELUtUXq1to1kloB7eZI0uR/wEV9IfD/8AYH+Bfw78uS08BWWr3acm511mvyxHfZKTGD9FFfQVFfnmY8ccR5rdYnGzs+kXyL7ocqfzOuGGo0/hiVdL0mx0Oyjs9OsrfT7SMYS3tYljjX6KoAFWqKK+IlJyd5O7OkKKKKkAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/2Q==")}, coordinateSystem(initialScale = 0.1)),
        experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
        __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
    end MoltenSaltReactor;

    PropulsionSystem.Examples.OpenCAEsymposium2019.Transient.NukeTurbojet.MoltenSaltReactor moltenSaltReactor1 annotation(
      Placement(visible = true, transformation(origin = {90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Constant dmy_m_flowFuel(k = 1) annotation(
      Placement(visible = true, transformation(origin = {270, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp ramp_m_flow_fuel(duration = 10, height = 0, offset = 10, startTime = 60) annotation(
      Placement(visible = true, transformation(origin = {30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Thermal.HeatTransfer.Components.HeatCapacitor heatCapacitor1(C = 1e5, T(displayUnit = "K", fixed = true, start = 615.3)) annotation(
      Placement(visible = true, transformation(origin = {100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  equation
    connect(heatCapacitor1.port, Brn036.HeatPort_1) annotation(
      Line(points = {{90, 30}, {90, 30}, {90, 10}, {90, 10}}, color = {191, 0, 0}));
    connect(moltenSaltReactor1.port_b, heatCapacitor1.port) annotation(
      Line(points = {{90, 60}, {90, 60}, {90, 30}, {90, 30}}, color = {191, 0, 0}));
    connect(ramp_m_flow_fuel.y, moltenSaltReactor1.u_m_flow_fuel) annotation(
      Line(points = {{42, 40}, {68, 40}, {68, 66}, {79, 66}}, color = {0, 0, 127}));
    connect(ramp_rho_control.y, moltenSaltReactor1.u_rho_control) annotation(
      Line(points = {{42, 70}, {60.5, 70}, {60.5, 74}, {79, 74}}, color = {0, 0, 127}));
    connect(dmy_m_flowFuel.y, perf001.dm_fuel_in) annotation(
      Line(points = {{281, -130}, {295, -130}, {295, -126}, {309, -126}}, color = {0, 0, 127}));
    connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
      Line(points = {{285, 2.22045e-16}, {303.3, 2.22045e-16}, {303.3, -114}, {309, -114}}, color = {0, 0, 127}));
    connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
      Line(points = {{-53, -4}, {-48, -4}, {-48, -118}, {309, -118}}, color = {0, 0, 127}));
    connect(flightToEngine1.port_fluid2Eng, Inlt010.port_1) annotation(
      Line(points = {{-80, 8}, {-68, 8}}, color = {0, 127, 255}));
    connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
      Line(points = {{-79, -4}, {-67, -4}}, color = {0, 0, 127}));
    connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
      Line(points = {{-90, 10}, {-90, 14}, {290, 14}, {290, 8}}, color = {0, 127, 255}));
    connect(Inlt010.port_2, Cmp020.port_1) annotation(
      Line(points = {{-50, 8}, {-42, 8}}, color = {0, 127, 255}));
    connect(Vol030.ports[2], Duct030.port_1) annotation(
      Line(points = {{-2, 10}, {8, 10}, {8, 8}, {18, 8}, {18, 8}}, color = {0, 127, 255}));
    connect(Duct030.port_2, Vol036.ports[1]) annotation(
      Line(points = {{38, 8}, {44, 8}, {44, 10}, {60, 10}, {60, 10}}, color = {0, 127, 255}));
    connect(Vol036.ports[2], Brn036.port_1) annotation(
      Line(points = {{60, 10}, {72, 10}, {72, 8}, {80, 8}, {80, 8}}, color = {0, 127, 255}));
    connect(Brn036.port_2, Vol040.ports[1]) annotation(
      Line(points = {{100, 8}, {108, 8}, {108, 10}, {120, 10}, {120, 10}}, color = {0, 127, 255}));
    connect(Vol042.ports[2], Duct045.port_1) annotation(
      Line(points = {{190, 10}, {210, 10}, {210, 8}}, color = {0, 127, 255}));
    connect(Duct045.port_2, Vol046.ports[1]) annotation(
      Line(points = {{230, 8}, {232, 8}, {232, 10}, {250, 10}}, color = {0, 127, 255}));
    connect(Vol046.ports[2], Nzl070.port_1) annotation(
      Line(points = {{250, 10}, {260, 10}, {260, 8}, {270, 8}}, color = {0, 127, 255}));
    connect(Vol040.ports[2], Trb041.port_1) annotation(
      Line(points = {{120, 10}, {134, 10}, {134, 8}, {150, 8}}, color = {0, 127, 255}));
    connect(Trb041.port_2, Vol042.ports[1]) annotation(
      Line(points = {{170, 8}, {176, 8}, {176, 10}, {190, 10}}, color = {0, 127, 255}));
    connect(ShM.flange_b, Trb041.flange_1) annotation(
      Line(points = {{70, -100}, {146, -100}, {146, 0}, {150, 0}}));
    connect(Cmp020.port_2, Vol030.ports[1]) annotation(
      Line(points = {{-22, 8}, {-16, 8}, {-16, 10}, {-2, 10}, {-2, 10}}, color = {0, 127, 255}));
    connect(Cmp020.flange_2, ShM.flange_a) annotation(
      Line(points = {{-22, 0}, {-16, 0}, {-16, -100}, {50, -100}}));
    connect(Vol042.heatPort, convection042.fluid) annotation(
      Line(points = {{200, 0}, {200, 0}, {200, -30}, {200, -30}}, color = {191, 0, 0}));
    connect(Vol046.heatPort, convection046.fluid) annotation(
      Line(points = {{260, 0}, {260, 0}, {260, -30}, {260, -30}}, color = {191, 0, 0}));
    connect(Vol030.heatPort, convection030.fluid) annotation(
      Line(points = {{8, 0}, {10, 0}, {10, -30}, {10, -30}}, color = {191, 0, 0}));
    connect(Vol040.heatPort, convection040.fluid) annotation(
      Line(points = {{130, 0}, {130, 0}, {130, -30}, {130, -30}}, color = {191, 0, 0}));
    connect(Vol036.heatPort, convection036.fluid) annotation(
      Line(points = {{70, 0}, {70, 0}, {70, -30}, {70, -30}}, color = {191, 0, 0}));
    connect(Gcs.y, convection030.Gc) annotation(
      Line(points = {{-19, -50}, {-13, -50}, {-13, -40}, {-1, -40}, {-1, -40}}, color = {0, 0, 127}));
    connect(convection030.solid, heatCapacitor030.port) annotation(
      Line(points = {{10, -50}, {10, -50}, {10, -60}, {10, -60}}, color = {191, 0, 0}));
    connect(Gcs.y, convection036.Gc) annotation(
      Line(points = {{-19, -50}, {47, -50}, {47, -40}, {59, -40}, {59, -40}}, color = {0, 0, 127}));
    connect(Gcs.y, convection040.Gc) annotation(
      Line(points = {{-19, -50}, {107, -50}, {107, -40}, {119, -40}, {119, -40}}, color = {0, 0, 127}));
    connect(Gcs.y, convection042.Gc) annotation(
      Line(points = {{-19, -50}, {171, -50}, {171, -40}, {189, -40}, {189, -40}}, color = {0, 0, 127}));
    connect(Gcs.y, convection046.Gc) annotation(
      Line(points = {{-19, -50}, {237, -50}, {237, -40}, {249, -40}, {249, -40}}, color = {0, 0, 127}));
    connect(convection036.solid, heatCapacitor036.port) annotation(
      Line(points = {{70, -50}, {70, -50}, {70, -60}, {70, -60}}, color = {191, 0, 0}));
    connect(convection040.solid, heatCapacitor040.port) annotation(
      Line(points = {{130, -50}, {130, -50}, {130, -60}, {130, -60}}, color = {191, 0, 0}));
    connect(convection042.solid, heatCapacitor042.port) annotation(
      Line(points = {{200, -50}, {200, -50}, {200, -60}, {200, -60}}, color = {191, 0, 0}));
    connect(convection046.solid, heatCapacitor046.port) annotation(
      Line(points = {{260, -50}, {260, -50}, {260, -60}, {260, -60}}, color = {191, 0, 0}));
    annotation(
      uses(Modelica(version = "3.2.2")),
      Diagram(coordinateSystem(extent = {{-100, -140}, {340, 100}}, initialScale = 0.1), graphics = {Rectangle(origin = {43, 15}, pattern = LinePattern.Dash, extent = {{-29, 73}, {69, -35}})}),
      Icon(coordinateSystem(extent = {{-100, -200}, {300, 100}})),
      version = "",
      __OpenModelica_commandLineOptions = "",
      experiment(StartTime = 0, StopTime = 200, Tolerance = 1e-06, Interval = 0.02),
      __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));   end NukeTurbojet001_002;
equation
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, -34}, {-67, -34}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluid2Eng, Inlt010.port_1) annotation(
    Line(points = {{-80, -22}, {-70, -22}}, color = {0, 127, 255}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-53, -34}, {-48, -34}, {-48, -88}, {201, -88}}, color = {0, 0, 127}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-50, -22}, {-42, -22}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, -20}, {-90, 22}, {182, 22}, {182, -22}}, color = {0, 127, 255}));
  connect(ramp_rating.y, combustFuel1.dm_fuel_in) annotation(
    Line(points = {{12, 30}, {22, 30}, {22, 6}, {40, 6}, {40, 6}}, color = {0, 0, 127}));
  connect(Cmp020.flange_2, ShM.flange_a) annotation(
    Line(points = {{-22, -30}, {-16, -30}, {-16, -60}, {50, -60}}));
  connect(Cmp020.port_2, Duct030.port_1) annotation(
    Line(points = {{-22, -22}, {30, -22}, {30, -22}, {30, -22}}, color = {0, 127, 255}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{175, -30}, {193.3, -30}, {193.3, -84}, {199, -84}}, color = {0, 0, 127}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{61, -4}, {185, -4}, {185, -96}, {199, -96}}, color = {0, 0, 127}));
  connect(Duct045.port_2, Nzl070.port_1) annotation(
    Line(points = {{150, -22}, {158, -22}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Duct045.port_1) annotation(
    Line(points = {{120, -22}, {128, -22}}, color = {0, 127, 255}));
  connect(ShM.flange_b, Trb041.flange_1) annotation(
    Line(points = {{70, -60}, {94, -60}, {94, -30}, {100, -30}, {100, -30}}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{80, -22}, {100, -22}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Brn036.port_1) annotation(
    Line(points = {{50, -22}, {60, -22}}, color = {0, 127, 255}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{60, 0}, {70, 0}, {70, -20}}, color = {191, 0, 0}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -100}, {260, 100}}, initialScale = 0.1), graphics = {Rectangle(origin = {55, -15}, pattern = LinePattern.Dash, extent = {{-29, 27}, {35, -31}}), Text(origin = {40, 17}, extent = {{-18, 2}, {4, -2}}, textString = "Combustor")}),
    Icon(coordinateSystem(extent = {{-100, -100}, {260, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.04),
    __OpenModelica_simulationFlags(lv = "assert,LOG_STATS", s = "dassl", cpu = "()", outputFormat = "mat"));
end TurboJet001_005;
