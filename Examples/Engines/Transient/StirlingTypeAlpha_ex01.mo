within PropulsionSystem.Examples.Engines.Transient;

model StirlingTypeAlpha_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-190, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume hotVolume(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.2 ^ 2, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.2 ^ 2, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-60, 120}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume coldVolume(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.2 ^ 2, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.2 ^ 2, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {80, 120}, extent = {{20, 20}, {-20, -20}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = engineAir, V = 0.1 * Modelica.Constants.pi / 4 * 0.1 ^ 2, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {10, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature coldHeatSource(T(displayUnit = "K") = 288.15) annotation(
    Placement(visible = true, transformation(origin = {150, 120}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 200) annotation(
    Placement(visible = true, transformation(origin = {-100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 200) annotation(
    Placement(visible = true, transformation(origin = {120, 120}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-30, 160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {50, 160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature hotHeatSource annotation(
    Placement(visible = true, transformation(origin = {-130, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TH(duration = 10, height = 900, offset = 288.15 + 10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-170, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false)  annotation(
    Placement(visible = true, transformation(origin = {-170, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(n = {1, 0, 0}, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-100, -160}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder1(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-70, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox1(density = 2700, r = {0, 0.1, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder2(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-30, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox2(density = 2700, r = {0, -0.1, 0}) annotation(
    Placement(visible = true, transformation(origin = {-10, -140}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder3(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {10, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {0.05, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-30, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox3(density = 2700, r = {0, 0, -0.1}) annotation(
    Placement(visible = true, transformation(origin = {30, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder4(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {50, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox4(density = 2700, r = {0, 0, 0.1}) annotation(
    Placement(visible = true, transformation(origin = {70, -140}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(r = {0.05, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {50, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute(n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox5(density = 2700, r = {0, 0.2, 0}) annotation(
    Placement(visible = true, transformation(origin = {-30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder5(density = 2700,diameter = 0.15, r = {0, 0.1, 0}) annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(animation = false,boxWidthDirection = {0, -1, 0}, n = {0, -1, 0}, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(animation = false, r = {0.15, 0.4 + 0.5, 0}) annotation(
    Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute3(n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox6(density = 2700, r = {0, 0.16, 0.1}) annotation(
    Placement(visible = true, transformation(origin = {50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute4(n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {50, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder6(density = 2700,diameter = 0.15, r = {0, 0.1, 0}) annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2(animation = false,n = {0, -1, 0}, s(fixed = false, start = 0.04), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(animation = false, r = {0.2, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 100, w(fixed = true, start = 5)) annotation(
    Placement(visible = true, transformation(origin = {-80, -200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 10, w(fixed = false, start = 10)) annotation(
    Placement(visible = true, transformation(origin = {10, -200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech(eff_paramInput = 0.95)  annotation(
    Placement(visible = true, transformation(origin = {-50, -200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-20, -200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(thermalConductor2.port_a, coldHeatSource.port) annotation(
    Line(points = {{130, 120}, {140, 120}, {140, 120}, {140, 120}}, color = {191, 0, 0}));
  connect(coldVolume.heatPort, thermalConductor2.port_b) annotation(
    Line(points = {{100, 120}, {110, 120}}, color = {191, 0, 0}));
  connect(coldVolume.flange, prismatic2.axis) annotation(
    Line(points = {{80, 100}, {80, 42}, {56, 42}}, color = {0, 127, 0}));
  connect(pipe1.port_b, coldVolume.ports[1]) annotation(
    Line(points = {{60, 160}, {80, 160}, {80, 140}}, color = {0, 127, 255}));
  connect(hotVolume.ports[1], pipe.port_a) annotation(
    Line(points = {{-60, 140}, {-60, 160}, {-40, 160}}, color = {0, 127, 255}));
  connect(ramp_TH.y, hotHeatSource.T) annotation(
    Line(points = {{-159, 120}, {-142, 120}}, color = {0, 0, 127}));
  connect(hotHeatSource.port, thermalConductor1.port_a) annotation(
    Line(points = {{-120, 120}, {-110, 120}}, color = {191, 0, 0}));
  connect(thermalConductor1.port_b, hotVolume.heatPort) annotation(
    Line(points = {{-90, 120}, {-80, 120}}, color = {191, 0, 0}));
  connect(hotVolume.flange, prismatic1.axis) annotation(
    Line(points = {{-60, 100}, {-60, 42}, {-36, 42}}, color = {0, 127, 0}));
  connect(bodyCylinder4.frame_b, bodyBox4.frame_a) annotation(
    Line(points = {{60, -130}, {70, -130}, {70, -130}, {70, -130}}, color = {95, 95, 95}));
  connect(inertia1.flange_a, LossRotMech.flange_2) annotation(
    Line(points = {{-70, -200}, {-60, -200}, {-60, -200}, {-60, -200}}));
  connect(inertia1.flange_b, revolute1.axis) annotation(
    Line(points = {{-90, -200}, {-100, -200}, {-100, -170}}));
  connect(powerSensor1.flange_a, inertia2.flange_b) annotation(
    Line(points = {{-10, -200}, {3.57625e-06, -200}, {3.57625e-06, -200}, {3.57625e-06, -200}}));
  connect(LossRotMech.flange_1, powerSensor1.flange_b) annotation(
    Line(points = {{-40, -200}, {-30, -200}, {-30, -200}, {-30, -200}}));
  connect(world.frame_b, fixedTranslation3.frame_a) annotation(
    Line(points = {{-160, -160}, {-160, 70}, {-120, 70}}, color = {95, 95, 95}));
  connect(world.frame_b, revolute1.frame_a) annotation(
    Line(points = {{-160, -160}, {-110, -160}}, color = {95, 95, 95}));
  connect(revolute1.frame_b, bodyCylinder1.frame_a) annotation(
    Line(points = {{-90, -160}, {-80, -160}}, color = {95, 95, 95}));
  connect(bodyCylinder1.frame_b, bodyBox1.frame_a) annotation(
    Line(points = {{-60, -160}, {-50, -160}, {-50, -150}}, color = {95, 95, 95}));
  connect(bodyBox1.frame_b, fixedTranslation1.frame_a) annotation(
    Line(points = {{-50, -130}, {-50, -110}, {-40, -110}}, color = {95, 95, 95}));
  connect(bodyBox1.frame_b, bodyCylinder2.frame_a) annotation(
    Line(points = {{-50, -130}, {-40, -130}}, color = {95, 95, 95}));
  connect(bodyCylinder2.frame_b, bodyBox2.frame_a) annotation(
    Line(points = {{-20, -130}, {-10, -130}}, color = {95, 95, 95}));
  connect(bodyBox2.frame_b, bodyCylinder3.frame_a) annotation(
    Line(points = {{-10, -150}, {-10, -150}, {-10, -160}, {0, -160}, {0, -160}}, color = {95, 95, 95}));
  connect(bodyCylinder3.frame_b, bodyBox3.frame_a) annotation(
    Line(points = {{20, -160}, {30, -160}, {30, -150}, {30, -150}}, color = {95, 95, 95}));
  connect(bodyBox3.frame_b, fixedTranslation2.frame_a) annotation(
    Line(points = {{30, -130}, {30, -110}, {40, -110}}, color = {95, 95, 95}));
  connect(bodyBox3.frame_b, bodyCylinder4.frame_a) annotation(
    Line(points = {{30, -130}, {40, -130}, {40, -130}, {40, -130}}, color = {95, 95, 95}));
  connect(revolute4.frame_a, fixedTranslation2.frame_b) annotation(
    Line(points = {{40, -80}, {40, -94}, {60, -94}, {60, -110}}, color = {95, 95, 95}));
  connect(revolute3.frame_a, bodyBox6.frame_b) annotation(
    Line(points = {{40, -10}, {40, -30}, {50, -30}}, color = {95, 95, 95}));
  connect(bodyCylinder6.frame_a, revolute3.frame_b) annotation(
    Line(points = {{50, 10}, {60, 10}, {60, -8}, {60, -8}, {60, -10}}, color = {95, 95, 95}));
  connect(bodyBox6.frame_a, revolute4.frame_b) annotation(
    Line(points = {{50, -50}, {50, -66}, {60, -66}, {60, -80}}, color = {95, 95, 95}));
  connect(prismatic2.frame_b, bodyCylinder6.frame_b) annotation(
    Line(points = {{50, 40}, {50, 30}}, color = {95, 95, 95}));
  connect(fixedTranslation4.frame_b, prismatic2.frame_a) annotation(
    Line(points = {{20, 70}, {50, 70}, {50, 60}}, color = {95, 95, 95}));
  connect(revolute.frame_a, fixedTranslation1.frame_b) annotation(
    Line(points = {{-40, -80}, {-40, -96}, {-20, -96}, {-20, -110}}, color = {95, 95, 95}));
  connect(bodyBox5.frame_a, revolute.frame_b) annotation(
    Line(points = {{-30, -50}, {-30, -64}, {-20, -64}, {-20, -80}}, color = {95, 95, 95}));
  connect(revolute2.frame_a, bodyBox5.frame_b) annotation(
    Line(points = {{-40, -10}, {-40, -30}, {-30, -30}}, color = {95, 95, 95}));
  connect(bodyCylinder5.frame_a, revolute2.frame_b) annotation(
    Line(points = {{-30, 10}, {-20, 10}, {-20, -10}}, color = {95, 95, 95}));
  connect(bodyCylinder5.frame_b, prismatic1.frame_b) annotation(
    Line(points = {{-30, 30}, {-30, 30}, {-30, 40}, {-30, 40}}, color = {95, 95, 95}));
  connect(fixedTranslation3.frame_b, prismatic1.frame_a) annotation(
    Line(points = {{-100, 70}, {-100, 70}, {-100, 60}, {-30, 60}, {-30, 60}}, color = {95, 95, 95}));
  connect(fixedTranslation3.frame_b, fixedTranslation4.frame_a) annotation(
    Line(points = {{-100, 70}, {0, 70}, {0, 70}, {0, 70}}, color = {95, 95, 95}));
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{-20, 160}, {10, 160}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe1.port_a) annotation(
    Line(points = {{10, 160}, {40, 160}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-220, -220}, {160, 180}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "plt", s = "dassl"));

end StirlingTypeAlpha_ex01;
