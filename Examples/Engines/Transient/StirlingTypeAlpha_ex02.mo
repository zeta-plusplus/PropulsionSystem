within PropulsionSystem.Examples.Engines.Transient;

model StirlingTypeAlpha_ex02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, m_flow_start = 1, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, momentumDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial) annotation(
    Placement(visible = true, transformation(origin = {-190, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume hotVolume(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.2 ^ 2, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.2 ^ 2, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-30, 80}, extent = {{-20, 20}, {20, -20}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume coldVolume(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.2 ^ 2, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.2 ^ 2, s(fixed = false), use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {160, 80}, extent = {{20, 20}, {-20, -20}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = engineAir, V = 0.1 * Modelica.Constants.pi / 4 * 0.1 ^ 2, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {40, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature coldHeatSource(T(displayUnit = "K") = 288.15) annotation(
    Placement(visible = true, transformation(origin = {290, 110}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 200) annotation(
    Placement(visible = true, transformation(origin = {-70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 200) annotation(
    Placement(visible = true, transformation(origin = {200, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {10, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {70, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature hotHeatSource annotation(
    Placement(visible = true, transformation(origin = {-200, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TH(duration = 5, height = 900, offset = 288.15 + 10, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-230, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false, animateWorld = false) annotation(
    Placement(visible = true, transformation(origin = {-210, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(cylinderDiameter = 0.05, cylinderLength = 0.05, n = {1, 0, 0}, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-100, -160}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder1(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-70, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox1(density = 2700, r = {0, 0.15, 0}) annotation(
    Placement(visible = true, transformation(origin = {-50, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder2(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {0, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox2(density = 2700, r = {0, -bodyBox1.r[2], 0}) annotation(
    Placement(visible = true, transformation(origin = {50, -140}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder3(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {70, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox3(density = 2700, r = {0, 0, -bodyBox1.r[2]}) annotation(
    Placement(visible = true, transformation(origin = {90, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder4(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {140, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox4(density = 2700, r = {0, 0, bodyBox1.r[2]}) annotation(
    Placement(visible = true, transformation(origin = {190, -140}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute(cylinderDiameter = 0.05, cylinderLength = 0.01, n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox5(density = 2700, r = {0, 0.3, 0}) annotation(
    Placement(visible = true, transformation(origin = {0, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(cylinderDiameter = revolute.cylinderDiameter, cylinderLength = revolute.cylinderLength, n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder5(density = 2700, diameter = 0.15, r = {0, 0.05, 0}) annotation(
    Placement(visible = true, transformation(origin = {0, -10}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(animation = true, boxWidthDirection = {0, -1, 0}, n = {0, -1, 0}, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(animation = false, r = {bodyCylinder1.r[1] + bodyCylinder8.r[1], 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute3(cylinderDiameter = revolute.cylinderDiameter, cylinderLength = revolute.cylinderLength, n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {140, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox6(density = 2700, r = {0, 0.2, 0.15}) annotation(
    Placement(visible = true, transformation(origin = {140, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute4(cylinderDiameter = 0.05, cylinderLength = 0.01, n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {140, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder6(density = 2700, diameter = 0.15, r = {0, bodyCylinder5.r[2], 0}) annotation(
    Placement(visible = true, transformation(origin = {140, -10}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2(animation = true, n = {0, -1, 0}, s(fixed = false, start = 0.04), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {140, 20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(animation = false, r = {bodyCylinder2.r[1] + bodyCylinder9.r[1] + bodyCylinder3.r[1] + bodyCylinder10.r[1], 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {130, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1000, w(fixed = true, start = 5)) annotation(
    Placement(visible = true, transformation(origin = {-140, -200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 10, w(fixed = false, start = 10)) annotation(
    Placement(visible = true, transformation(origin = {-240, -200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech(eff_paramInput = 0.95) annotation(
    Placement(visible = true, transformation(origin = {-170, -200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-210, -200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder7(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {210, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute5(cylinderDiameter = revolute.cylinderDiameter, cylinderLength = revolute.cylinderLength, n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {20, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute6(cylinderDiameter = revolute.cylinderDiameter, cylinderLength = revolute.cylinderLength, n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {160, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox11(density = 2700, r = {0, -bodyBox5.r[2], 0}) annotation(
    Placement(visible = true, transformation(origin = {20, -210}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox12(density = 2700, r = {0, -bodyBox6.r[2], -bodyBox6.r[3]}) annotation(
    Placement(visible = true, transformation(origin = {160, -210}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute7(cylinderDiameter = revolute.cylinderDiameter, cylinderLength = revolute.cylinderLength, n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {20, -240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute8(cylinderDiameter = revolute.cylinderDiameter, cylinderLength = revolute.cylinderLength, n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {160, -240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder11(density = 2700, diameter = 0.15, r = {0, -bodyCylinder5.r[2], 0}) annotation(
    Placement(visible = true, transformation(origin = {20, -270}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder12(density = 2700, diameter = 0.15, r = {0, -bodyCylinder5.r[2], 0}) annotation(
    Placement(visible = true, transformation(origin = {160, -270}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic3(animation = true, boxWidthDirection = {0, 1, 0}, n = {0, 1, 0}, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {20, -300}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic4(animation = true, n = {0, 1, 0}, s(fixed = false, start = 0.04), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {160, -300}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation7(animation = false, r = {bodyCylinder1.r[1] + bodyCylinder8.r[1] + bodyCylinder2.r[1], 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {10, -320}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation8(animation = false, r = {bodyCylinder9.r[1] + bodyCylinder3.r[1] + bodyCylinder10.r[1] + bodyCylinder4.r[1], 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {150, -320}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume hotVolume1(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.2 ^ 2, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.2 ^ 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-10, -360}, extent = {{20, 20}, {-20, -20}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {50, -390}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = engineAir, V = 0.1 * Modelica.Constants.pi / 4 * 0.1 ^ 2, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {80, -380}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {110, -390}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume coldVolume1(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.2 ^ 2, nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.2 ^ 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {180, -360}, extent = {{-20, 20}, {20, -20}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor4(G = 200) annotation(
    Placement(visible = true, transformation(origin = {218, -360}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor3(G = 200) annotation(
    Placement(visible = true, transformation(origin = {-60, -360}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(animation = false, r = {0, bodyBox5.r[2] + 0.25, 0}) annotation(
    Placement(visible = true, transformation(origin = {-130, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation2(animation = false, r = {0, -fixedTranslation1.r[2], 0}) annotation(
    Placement(visible = true, transformation(origin = {-120, -260}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder8(density = 2700, r = {0.05, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {-30, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder9(density = 2700, r = {0.05, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {30, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder10(density = 2700, r = {0.05, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {110, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder13(density = 2700, r = {0.05, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {170, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(hotVolume.flange, prismatic1.axis) annotation(
    Line(points = {{-30, 60}, {-30, 12}, {-6, 12}}, color = {0, 127, 0}));
  connect(thermalConductor1.port_b, hotVolume.heatPort) annotation(
    Line(points = {{-60, 80}, {-50, 80}}, color = {191, 0, 0}));
  connect(hotVolume.ports[1], pipe.port_a) annotation(
    Line(points = {{-30, 100}, {-30, 110}, {0, 110}}, color = {0, 127, 255}));
  connect(hotHeatSource.port, thermalConductor1.port_a) annotation(
    Line(points = {{-190, 80}, {-80, 80}}, color = {191, 0, 0}));
  connect(pipe.port_b, volume.ports[1]) annotation(
    Line(points = {{20, 110}, {40, 110}}, color = {0, 127, 255}));
  connect(volume.ports[2], pipe1.port_a) annotation(
    Line(points = {{40, 110}, {60, 110}}, color = {0, 127, 255}));
  connect(pipe1.port_b, coldVolume.ports[1]) annotation(
    Line(points = {{80, 110}, {160, 110}, {160, 100}}, color = {0, 127, 255}));
  connect(hotVolume1.flange, prismatic3.axis) annotation(
    Line(points = {{-10, -340}, {-10, -292}, {14, -292}}, color = {0, 127, 0}));
  connect(thermalConductor3.port_b, hotVolume1.heatPort) annotation(
    Line(points = {{-50, -360}, {-30, -360}}, color = {191, 0, 0}));
  connect(hotVolume1.ports[1], pipe2.port_a) annotation(
    Line(points = {{-10, -380}, {-10, -390}, {40, -390}}, color = {0, 127, 255}));
  connect(volume1.ports[2], pipe3.port_a) annotation(
    Line(points = {{80, -390}, {100, -390}}, color = {0, 127, 255}));
  connect(pipe2.port_b, volume1.ports[1]) annotation(
    Line(points = {{60, -390}, {80, -390}}, color = {0, 127, 255}));
  connect(pipe3.port_b, coldVolume1.ports[1]) annotation(
    Line(points = {{120, -390}, {180, -390}, {180, -380}}, color = {0, 127, 255}));
  connect(bodyCylinder4.frame_b, revolute6.frame_a) annotation(
    Line(points = {{150, -130}, {150, -130}, {150, -180}, {150, -180}}, color = {95, 95, 95}));
  connect(revolute6.frame_b, bodyBox12.frame_a) annotation(
    Line(points = {{170, -180}, {170, -180}, {170, -194}, {160, -194}, {160, -200}, {160, -200}}, color = {95, 95, 95}));
  connect(bodyBox12.frame_b, revolute8.frame_a) annotation(
    Line(points = {{160, -220}, {150, -220}, {150, -240}}, color = {95, 95, 95}));
  connect(revolute8.frame_b, bodyCylinder12.frame_a) annotation(
    Line(points = {{170, -240}, {170, -240}, {170, -260}, {160, -260}, {160, -260}}, color = {95, 95, 95}));
  connect(prismatic4.frame_b, bodyCylinder12.frame_b) annotation(
    Line(points = {{160, -290}, {160, -290}, {160, -280}, {160, -280}}, color = {95, 95, 95}));
  connect(fixedTranslation8.frame_b, prismatic4.frame_a) annotation(
    Line(points = {{160, -320}, {160, -310}}, color = {95, 95, 95}));
  connect(fixedTranslation7.frame_b, fixedTranslation8.frame_a) annotation(
    Line(points = {{20, -320}, {140, -320}}, color = {95, 95, 95}));
  connect(prismatic4.axis, coldVolume1.flange) annotation(
    Line(points = {{166, -292}, {180, -292}, {180, -340}}, color = {0, 127, 0}));
  connect(coldVolume1.heatPort, thermalConductor4.port_b) annotation(
    Line(points = {{200, -360}, {207, -360}}, color = {191, 0, 0}));
  connect(coldHeatSource.port, thermalConductor4.port_a) annotation(
    Line(points = {{290, 100}, {290, -360}, {228, -360}}, color = {191, 0, 0}));
  connect(bodyBox4.frame_b, bodyCylinder7.frame_a) annotation(
    Line(points = {{190, -150}, {190, -160}, {200, -160}}, color = {95, 95, 95}));
  connect(bodyCylinder13.frame_b, bodyBox4.frame_a) annotation(
    Line(points = {{180, -130}, {190, -130}, {190, -130}, {190, -130}}, color = {95, 95, 95}));
  connect(bodyCylinder4.frame_b, bodyCylinder13.frame_a) annotation(
    Line(points = {{150, -130}, {160, -130}, {160, -130}, {160, -130}}, color = {95, 95, 95}));
  connect(bodyCylinder10.frame_b, bodyCylinder4.frame_a) annotation(
    Line(points = {{120, -130}, {130, -130}, {130, -130}, {130, -130}}, color = {95, 95, 95}));
  connect(bodyBox3.frame_b, bodyCylinder10.frame_a) annotation(
    Line(points = {{90, -130}, {100, -130}, {100, -130}, {100, -130}}, color = {95, 95, 95}));
  connect(revolute4.frame_a, bodyCylinder4.frame_a) annotation(
    Line(points = {{130, -100}, {130, -100}, {130, -130}, {130, -130}}, color = {95, 95, 95}));
  connect(bodyBox6.frame_a, revolute4.frame_b) annotation(
    Line(points = {{140, -80}, {150, -80}, {150, -100}}, color = {95, 95, 95}));
  connect(revolute3.frame_a, bodyBox6.frame_b) annotation(
    Line(points = {{130, -40}, {130, -60}, {140, -60}}, color = {95, 95, 95}));
  connect(bodyCylinder6.frame_a, revolute3.frame_b) annotation(
    Line(points = {{140, -20}, {150, -20}, {150, -38}, {150, -38}, {150, -40}}, color = {95, 95, 95}));
  connect(prismatic2.frame_b, bodyCylinder6.frame_b) annotation(
    Line(points = {{140, 10}, {140, 0}}, color = {95, 95, 95}));
  connect(fixedTranslation4.frame_b, prismatic2.frame_a) annotation(
    Line(points = {{140, 40}, {140, 30}}, color = {95, 95, 95}));
  connect(coldVolume.flange, prismatic2.axis) annotation(
    Line(points = {{160, 60}, {160, 12}, {146, 12}}, color = {0, 127, 0}));
  connect(fixedTranslation3.frame_b, fixedTranslation4.frame_a) annotation(
    Line(points = {{0, 40}, {120, 40}}, color = {95, 95, 95}));
  connect(coldVolume.heatPort, thermalConductor2.port_b) annotation(
    Line(points = {{180, 80}, {190, 80}}, color = {191, 0, 0}));
  connect(thermalConductor2.port_a, coldHeatSource.port) annotation(
    Line(points = {{210, 80}, {290, 80}, {290, 100}}, color = {191, 0, 0}));
  connect(bodyCylinder3.frame_b, bodyBox3.frame_a) annotation(
    Line(points = {{80, -160}, {90, -160}, {90, -150}}, color = {95, 95, 95}));
  connect(bodyCylinder9.frame_b, bodyBox2.frame_a) annotation(
    Line(points = {{40, -130}, {50, -130}, {50, -130}, {50, -130}}, color = {95, 95, 95}));
  connect(bodyCylinder2.frame_b, bodyCylinder9.frame_a) annotation(
    Line(points = {{10, -130}, {20, -130}, {20, -130}, {20, -130}}, color = {95, 95, 95}));
  connect(bodyBox2.frame_b, bodyCylinder3.frame_a) annotation(
    Line(points = {{50, -150}, {50, -160}, {60, -160}}, color = {95, 95, 95}));
  connect(fixedTranslation7.frame_b, prismatic3.frame_a) annotation(
    Line(points = {{20, -320}, {20, -310}}, color = {95, 95, 95}));
  connect(fixedTranslation2.frame_b, fixedTranslation7.frame_a) annotation(
    Line(points = {{-120, -270}, {-120, -321}, {0, -321}, {0, -320}}, color = {95, 95, 95}));
  connect(fixedTranslation3.frame_b, prismatic1.frame_a) annotation(
    Line(points = {{0, 40}, {0, 30}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, fixedTranslation3.frame_a) annotation(
    Line(points = {{-130, -10}, {-130, 40}, {-20, 40}}, color = {95, 95, 95}));
  connect(bodyCylinder8.frame_b, bodyCylinder2.frame_a) annotation(
    Line(points = {{-20, -130}, {-10, -130}, {-10, -130}, {-10, -130}}, color = {95, 95, 95}));
  connect(bodyBox1.frame_b, bodyCylinder8.frame_a) annotation(
    Line(points = {{-50, -130}, {-40, -130}, {-40, -130}, {-40, -130}}, color = {95, 95, 95}));
  connect(bodyCylinder2.frame_a, revolute.frame_a) annotation(
    Line(points = {{-10, -130}, {-10, -130}, {-10, -100}, {-10, -100}}, color = {95, 95, 95}));
  connect(bodyBox5.frame_a, revolute.frame_b) annotation(
    Line(points = {{0, -80}, {10, -80}, {10, -100}}, color = {95, 95, 95}));
  connect(revolute2.frame_a, bodyBox5.frame_b) annotation(
    Line(points = {{-10, -40}, {-10, -60}, {0, -60}}, color = {95, 95, 95}));
  connect(bodyCylinder5.frame_a, revolute2.frame_b) annotation(
    Line(points = {{0, -20}, {10, -20}, {10, -40}}, color = {95, 95, 95}));
  connect(bodyCylinder5.frame_b, prismatic1.frame_b) annotation(
    Line(points = {{0, 0}, {0, 0}, {0, 10}, {0, 10}}, color = {95, 95, 95}));
  connect(prismatic3.frame_b, bodyCylinder11.frame_b) annotation(
    Line(points = {{20, -290}, {20, -290}, {20, -280}, {20, -280}}, color = {95, 95, 95}));
  connect(revolute7.frame_b, bodyCylinder11.frame_a) annotation(
    Line(points = {{30, -240}, {30, -240}, {30, -260}, {20, -260}, {20, -260}}, color = {95, 95, 95}));
  connect(bodyBox11.frame_b, revolute7.frame_a) annotation(
    Line(points = {{20, -220}, {10, -220}, {10, -240}}, color = {95, 95, 95}));
  connect(revolute5.frame_b, bodyBox11.frame_a) annotation(
    Line(points = {{30, -180}, {30, -180}, {30, -196}, {20, -196}, {20, -200}, {20, -200}}, color = {95, 95, 95}));
  connect(bodyCylinder2.frame_b, revolute5.frame_a) annotation(
    Line(points = {{10, -130}, {10, -180}}, color = {95, 95, 95}));
  connect(hotHeatSource.port, thermalConductor3.port_a) annotation(
    Line(points = {{-190, 80}, {-190, -360}, {-70, -360}}, color = {191, 0, 0}));
  connect(inertia2.flange_a, powerSensor1.flange_b) annotation(
    Line(points = {{-230, -200}, {-220, -200}, {-220, -200}, {-220, -200}}));
  connect(powerSensor1.flange_a, LossRotMech.flange_2) annotation(
    Line(points = {{-200, -200}, {-180, -200}, {-180, -200}, {-180, -200}}));
  connect(ramp_TH.y, hotHeatSource.T) annotation(
    Line(points = {{-219, 80}, {-212, 80}}, color = {0, 0, 127}));
  connect(world.frame_b, fixedTranslation1.frame_a) annotation(
    Line(points = {{-200, -160}, {-130, -160}, {-130, -30}}, color = {95, 95, 95}));
  connect(world.frame_b, fixedTranslation2.frame_a) annotation(
    Line(points = {{-200, -160}, {-120, -160}, {-120, -250}}, color = {95, 95, 95}));
  connect(LossRotMech.flange_1, inertia1.flange_b) annotation(
    Line(points = {{-160, -200}, {-150, -200}}));
  connect(inertia1.flange_a, revolute1.axis) annotation(
    Line(points = {{-130, -200}, {-100, -200}, {-100, -170}}));
  connect(world.frame_b, revolute1.frame_a) annotation(
    Line(points = {{-200, -160}, {-110, -160}}, color = {95, 95, 95}));
  connect(revolute1.frame_b, bodyCylinder1.frame_a) annotation(
    Line(points = {{-90, -160}, {-80, -160}}, color = {95, 95, 95}));
  connect(bodyCylinder1.frame_b, bodyBox1.frame_a) annotation(
    Line(points = {{-60, -160}, {-50, -160}, {-50, -150}}, color = {95, 95, 95}));
  annotation(
    Diagram(coordinateSystem(extent = {{-300, -480}, {300, 180}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.05),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end StirlingTypeAlpha_ex02;
