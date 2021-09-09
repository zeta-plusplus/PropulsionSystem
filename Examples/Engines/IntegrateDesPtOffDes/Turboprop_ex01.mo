within PropulsionSystem.Examples.Engines.IntegrateDesPtOffDes;

model Turboprop_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.InltCharFixed00 Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-208, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombCharFixed02 Comb036(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-49.75, 99.8}, extent = {{-20.25, -16.2}, {20.25, 16.2}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-90, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-170, 150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear idealGear1(ratio = 1 / 3)  annotation(
    Placement(visible = true, transformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {60, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 100, offset = 1600, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {110, 110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {-130, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_Nprop(duration = 10, height = 100, offset = 1500, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-130, -120}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {-130, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable02 Cmp(redeclare package Medium = engineAir, PRdes_paramInput = 20, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-120, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint01 NmechDesShH(NmechDes_paramInput = 10000)  annotation(
    Placement(visible = true, transformation(origin = {-30, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtDesignPoint01 NmechDes(NmechDes_paramInput = 4500)  annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 Trb041(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {30, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable02 Trb049(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtDesignPoint01 MassFlowDes(redeclare package Medium = engineAir, m_flow_des_paramInput = 100) annotation(
    Placement(visible = true, transformation(origin = {-170, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAeByFlowCharFixed02 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {160, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid01 Flt2Fluid(redeclare package Medium = engineAir, MN_paramInput = 0.5, alt_paramInput = 3000)  annotation(
    Placement(visible = true, transformation(origin = {-280, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariableOffDesign ConstraintDesPt annotation(
    Placement(visible = true, transformation(origin = {-130, -60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.PropActDiskCharFixed00 Prop1(Vinf_FnSaturation_paramInput = 100, switch_FnSaturation = PropulsionSystem.BaseClasses.BasicElements.PropellerActuatorDiskBase00.switchThrustSaturation.byVinf)  annotation(
    Placement(visible = true, transformation(origin = {-218, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(Prop1.flange_1, speedSensor1.flange) annotation(
    Line(points = {{-198, -20}, {-130, -20}, {-130, -20}, {-130, -20}}));
  connect(Flt2Fluid.y_V_inf, Prop1.u_Vinf) annotation(
    Line(points = {{-258, 44}, {-250, 44}, {-250, -12}, {-240, -12}, {-240, -12}}, color = {0, 0, 127}));
  connect(idealGear1.flange_b, NmechDes.flange_1) annotation(
    Line(points = {{-80, -20}, {-60, -20}}));
  connect(NmechDes.flange_2, Trb049.flange_1) annotation(
    Line(points = {{-40, -20}, {80, -20}}));
  connect(speedSensor1.flange, idealGear1.flange_a) annotation(
    Line(points = {{-130, -20}, {-100, -20}, {-100, -20}, {-100, -20}}));
  connect(speedSensor1.w, ConstraintDesPt.u_variable) annotation(
    Line(points = {{-130, -41}, {-130, -41}, {-130, -49}, {-130, -49}}, color = {0, 0, 127}));
  connect(ConstraintDesPt.u_targetValue, from_rpm1.y) annotation(
    Line(points = {{-130, -72}, {-130, -72}, {-130, -78}, {-130, -78}}, color = {0, 0, 127}));
  connect(ramp_Nprop.y, from_rpm1.u) annotation(
    Line(points = {{-130, -109}, {-130, -103}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb4sink, Nzl.port_2) annotation(
    Line(points = {{-280, 80}, {-280, 80}, {-280, 174}, {180, 174}, {180, -4}, {180, -4}}, color = {0, 127, 255}));
  connect(Flt2Fluid.y_V_inf, Inlt010.u_V_infini) annotation(
    Line(points = {{-258, 44}, {-222, 44}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, Inlt010.port_1) annotation(
    Line(points = {{-260, 60}, {-234, 60}, {-234, 68}, {-228, 68}}, color = {0, 127, 255}));
  connect(Trb049.port_2, Nzl.port_1) annotation(
    Line(points = {{120, -4}, {140, -4}, {140, -4}, {140, -4}}, color = {0, 127, 255}));
  connect(MassFlowDes.port_2, Cmp.port_1) annotation(
    Line(points = {{-160, 68}, {-140, 68}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, NmechDesShH.flange_1) annotation(
    Line(points = {{-100, 52}, {-40, 52}}));
  connect(Cmp.port_2, Comb036.port_1) annotation(
    Line(points = {{-100, 68}, {-100, 100}, {-70, 100}}, color = {0, 127, 255}));
  connect(Inlt010.port_2, MassFlowDes.port_1) annotation(
    Line(points = {{-188, 68}, {-180, 68}, {-180, 68}, {-180, 68}}, color = {0, 127, 255}));
  connect(Constraint.u_targetValue, ramp_TIT.y) annotation(
    Line(points = {{72, 110}, {98, 110}, {98, 110}, {98, 110}}, color = {0, 0, 127}));
  connect(temperature.T, Constraint.u_variable) annotation(
    Line(points = {{7, 110}, {47, 110}, {47, 110}, {47, 110}}, color = {0, 0, 127}));
  connect(Trb041.port_2, Trb049.port_1) annotation(
    Line(points = {{50, 68}, {80, 68}, {80, -4}}, color = {0, 127, 255}));
  connect(temperature.port, Trb041.port_1) annotation(
    Line(points = {{0, 100}, {10, 100}, {10, 68}}, color = {0, 127, 255}));
  connect(NmechDesShH.flange_2, Trb041.flange_1) annotation(
    Line(points = {{-20, 52}, {10, 52}}));
  connect(Comb036.port_2, temperature.port) annotation(
    Line(points = {{-29.5, 99.8}, {0.5, 99.8}, {0.5, 99.8}, {0.5, 99.8}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Comb036.port_fuel) annotation(
    Line(points = {{-80, 130}, {-66, 130}, {-66, 116}}, color = {0, 127, 255}));
  connect(VarBySolver.y_independent, boundary.m_flow_in) annotation(
    Line(points = {{-159, 150}, {-145, 150}, {-145, 138}, {-100, 138}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-300, -200}, {300, 200}})),
    __OpenModelica_commandLineOptions = "",
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "plt", s = "dassl"));
  
end Turboprop_ex01;
