within PropulsionSystem.Examples.temp;

model StirlingTypeAlpha_temp
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
    Placement(visible = true, transformation(origin = {290, 150}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor1(G = 200) annotation(
    Placement(visible = true, transformation(origin = {-100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor2(G = 200) annotation(
    Placement(visible = true, transformation(origin = {120, 120}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {-30, 160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1) annotation(
    Placement(visible = true, transformation(origin = {50, 160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature hotHeatSource annotation(
    Placement(visible = true, transformation(origin = {-200, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TH(duration = 10, height = 900, offset = 288.15 + 10, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-230, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world(animateGravity = false) annotation(
    Placement(visible = true, transformation(origin = {-210, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder5(density = 2700, diameter = 0.15, r = {0, 0.1, 0}) annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(animation = true, boxWidthDirection = {0, -1, 0}, n = {0, -1, 0}, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation3(animation = false, r = {0.1 + 0.05, 0.4 + 0.5, 0}) annotation(
    Placement(visible = true, transformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute3(n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox6(density = 2700, r = {0, 0.16, 0.1}) annotation(
    Placement(visible = true, transformation(origin = {50, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute4(n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {50, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder6(density = 2700, diameter = 0.15, r = {0, 0.1, 0}) annotation(
    Placement(visible = true, transformation(origin = {50, 20}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2(animation = true, n = {0, -1, 0}, s(fixed = false, start = 0.04), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation4(animation = false, r = {0.1 + 2 * 0.05, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 100, w(fixed = true, start = 5)) annotation(
    Placement(visible = true, transformation(origin = {-80, -200}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 10, w(fixed = false, start = 10)) annotation(
    Placement(visible = true, transformation(origin = {10, -200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.LossRotMechCharFixed00 LossRotMech(eff_paramInput = 0.95) annotation(
    Placement(visible = true, transformation(origin = {-50, -200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {-20, -200}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder7(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {90, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox7(density = 2700, r = {0, -0.1, 0}) annotation(
    Placement(visible = true, transformation(origin = {110, -180}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder8(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {130, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox8(density = 2700, r = {0, 0.1, 0}) annotation(
    Placement(visible = true, transformation(origin = {150, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder9(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {170, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox9(density = 2700, r = {0,  0, 0.1}) annotation(
    Placement(visible = true, transformation(origin = {190, -180}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder10(density = 2700, r = {0.1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {210, -190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox10(density = 2700, r = {0,  0,-0.1}) annotation(
    Placement(visible = true, transformation(origin = {230, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation5(r = {0.05, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {130, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation6(r = {0.05, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {210, -210}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute5(n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {130, -240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.RevolutePlanarLoopConstraint revolute6(n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {210, -240}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox11(density = 2700, r = {0, -0.2, 0}) annotation(
    Placement(visible = true, transformation(origin = {130, -270}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox12(density = 2700, r = {0, -0.16, -0.1}) annotation(
    Placement(visible = true, transformation(origin = {210, -270}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute7(n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {130, -300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute8(n = {1, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {210, -300}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder11(density = 2700, diameter = 0.15, r = {0, -0.1, 0}) annotation(
    Placement(visible = true, transformation(origin = {130, -330}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.BodyCylinder bodyCylinder12(density = 2700, diameter = 0.15, r = {0, -0.1, 0}) annotation(
    Placement(visible = true, transformation(origin = {210, -330}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic3(animation = true, boxWidthDirection = {0, 1, 0}, n = {0, 1, 0}, useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {130, -360}, extent = {{10, 10}, {-10, -10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic4(animation = true, n = {0, 1, 0}, s(fixed = false, start = 0.04), useAxisFlange = true) annotation(
    Placement(visible = true, transformation(origin = {210, -360}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation7(animation = false, r = {0.1 * 5 + 0.05, -(0.4 + 0.5), 0}) annotation(
    Placement(visible = true, transformation(origin = {50, -380}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation8(animation = false, r = {0.1 + 2 * 0.05, 0, 0}) annotation(
    Placement(visible = true, transformation(origin = {170, -380}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume hotVolume1(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.2 ^ 2,nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.2 ^ 2, use_HeatTransfer = true, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {120, -420}, extent = {{20, 20}, {-20, -20}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {130, -464}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume1(redeclare package Medium = engineAir, V = 0.1 * Modelica.Constants.pi / 4 * 0.1 ^ 2, nPorts = 2, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {170, -454}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = engineAir, diameter = 0.05, length = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {210, -464}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.SweptVolume coldVolume1(redeclare package Medium = engineAir, clearance = 0.05 * Modelica.Constants.pi / 4 * 0.2 ^ 2,nPorts = 1, pistonCrossArea = Modelica.Constants.pi / 4 * 0.2 ^ 2, use_HeatTransfer = true, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {221, -420}, extent = {{-20, 20}, {20, -20}}, rotation = 180)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor4(G = 200) annotation(
    Placement(visible = true, transformation(origin = {260, -420}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor3(G = 200) annotation(
    Placement(visible = true, transformation(origin = {80, -420}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(hotHeatSource.port, thermalConductor3.port_a) annotation(
    Line(points = {{-190, 120}, {-190, 120}, {-190, -420}, {70, -420}, {70, -420}}, color = {191, 0, 0}));
  connect(thermalConductor3.port_b, hotVolume1.heatPort) annotation(
    Line(points = {{90, -420}, {98, -420}, {98, -420}, {100, -420}}, color = {191, 0, 0}));
  connect(world.frame_b, fixedTranslation7.frame_a) annotation(
    Line(points = {{-200, -160}, {-126, -160}, {-126, -380}, {40, -380}}, color = {95, 95, 95}));
  connect(world.frame_b, fixedTranslation3.frame_a) annotation(
    Line(points = {{-200, -160}, {-128, -160}, {-128, 70}, {-120, 70}}, color = {95, 95, 95}));
  connect(world.frame_b, revolute1.frame_a) annotation(
    Line(points = {{-200, -160}, {-110, -160}}, color = {95, 95, 95}));
  connect(hotHeatSource.port, thermalConductor1.port_a) annotation(
    Line(points = {{-190, 120}, {-110, 120}}, color = {191, 0, 0}));
  connect(ramp_TH.y, hotHeatSource.T) annotation(
    Line(points = {{-219, 120}, {-212, 120}}, color = {0, 0, 127}));
  connect(coldHeatSource.port, thermalConductor4.port_a) annotation(
    Line(points = {{290, 140}, {290, 140}, {290, -420}, {270, -420}, {270, -420}}, color = {191, 0, 0}));
  connect(thermalConductor2.port_a, coldHeatSource.port) annotation(
    Line(points = {{130, 120}, {290, 120}, {290, 140}}, color = {191, 0, 0}));
  connect(coldVolume1.heatPort, thermalConductor4.port_b) annotation(
    Line(points = {{242, -420}, {250, -420}, {250, -420}, {250, -420}}, color = {191, 0, 0}));
  connect(pipe3.port_b, coldVolume1.ports[1]) annotation(
    Line(points = {{220, -464}, {221, -464}, {221, -440}}, color = {0, 127, 255}));
  connect(prismatic4.axis, coldVolume1.flange) annotation(
    Line(points = {{216, -352}, {220, -352}, {220, -400}, {221, -400}}, color = {0, 127, 0}));
  connect(hotVolume1.ports[1], pipe2.port_a) annotation(
    Line(points = {{120, -440}, {120, -464}}, color = {0, 127, 255}));
  connect(hotVolume1.flange, prismatic3.axis) annotation(
    Line(points = {{120, -400}, {120, -352}, {124, -352}}, color = {0, 127, 0}));
  connect(coldVolume.heatPort, thermalConductor2.port_b) annotation(
    Line(points = {{100, 120}, {110, 120}}, color = {191, 0, 0}));
  connect(volume1.ports[2], pipe3.port_a) annotation(
    Line(points = {{170, -464}, {200, -464}, {200, -464}, {200, -464}}, color = {0, 127, 255}));
  connect(pipe2.port_b, volume1.ports[1]) annotation(
    Line(points = {{140, -464}, {168, -464}, {168, -464}, {170, -464}}, color = {0, 127, 255}));
  connect(fixedTranslation7.frame_b, fixedTranslation8.frame_a) annotation(
    Line(points = {{60, -380}, {160, -380}}, color = {95, 95, 95}));
  connect(fixedTranslation7.frame_b, prismatic3.frame_a) annotation(
    Line(points = {{60, -380}, {130, -380}, {130, -370}}, color = {95, 95, 95}));
  connect(fixedTranslation8.frame_b, prismatic4.frame_a) annotation(
    Line(points = {{180, -380}, {210, -380}, {210, -370}, {210, -370}}, color = {95, 95, 95}));
  connect(prismatic4.frame_b, bodyCylinder12.frame_b) annotation(
    Line(points = {{210, -350}, {210, -350}, {210, -340}, {210, -340}}, color = {95, 95, 95}));
  connect(prismatic3.frame_b, bodyCylinder11.frame_b) annotation(
    Line(points = {{130, -350}, {130, -350}, {130, -340}, {130, -340}}, color = {95, 95, 95}));
  connect(revolute8.frame_b, bodyCylinder12.frame_a) annotation(
    Line(points = {{220, -300}, {220, -300}, {220, -320}, {210, -320}, {210, -320}}, color = {95, 95, 95}));
  connect(revolute7.frame_b, bodyCylinder11.frame_a) annotation(
    Line(points = {{140, -300}, {140, -300}, {140, -320}, {130, -320}, {130, -320}}, color = {95, 95, 95}));
  connect(bodyBox12.frame_b, revolute8.frame_a) annotation(
    Line(points = {{210, -280}, {210, -280}, {210, -284}, {200, -284}, {200, -300}, {200, -300}}, color = {95, 95, 95}));
  connect(bodyBox11.frame_b, revolute7.frame_a) annotation(
    Line(points = {{130, -280}, {130, -280}, {130, -286}, {120, -286}, {120, -300}, {120, -300}}, color = {95, 95, 95}));
  connect(revolute6.frame_b, bodyBox12.frame_a) annotation(
    Line(points = {{220, -240}, {220, -240}, {220, -254}, {210, -254}, {210, -260}, {210, -260}}, color = {95, 95, 95}));
  connect(revolute5.frame_b, bodyBox11.frame_a) annotation(
    Line(points = {{140, -240}, {140, -240}, {140, -256}, {130, -256}, {130, -260}, {130, -260}}, color = {95, 95, 95}));
  connect(fixedTranslation6.frame_b, revolute6.frame_a) annotation(
    Line(points = {{220, -210}, {220, -210}, {220, -224}, {200, -224}, {200, -240}, {200, -240}}, color = {95, 95, 95}));
  connect(fixedTranslation5.frame_b, revolute5.frame_a) annotation(
    Line(points = {{140, -210}, {140, -210}, {140, -224}, {120, -224}, {120, -240}, {120, -240}}, color = {95, 95, 95}));
  connect(bodyBox9.frame_b, fixedTranslation6.frame_a) annotation(
    Line(points = {{190, -190}, {190, -190}, {190, -210}, {200, -210}, {200, -210}}, color = {95, 95, 95}));
  connect(bodyBox7.frame_b, fixedTranslation5.frame_a) annotation(
    Line(points = {{110, -190}, {110, -190}, {110, -210}, {120, -210}, {120, -210}}, color = {95, 95, 95}));
  connect(bodyCylinder10.frame_b, bodyBox10.frame_a) annotation(
    Line(points = {{220, -190}, {230, -190}, {230, -190}, {230, -190}}, color = {95, 95, 95}));
  connect(bodyBox9.frame_b, bodyCylinder10.frame_a) annotation(
    Line(points = {{190, -190}, {200, -190}, {200, -190}, {200, -190}}, color = {95, 95, 95}));
  connect(bodyCylinder9.frame_b, bodyBox9.frame_a) annotation(
    Line(points = {{180, -160}, {190, -160}, {190, -170}, {190, -170}}, color = {95, 95, 95}));
  connect(bodyCylinder8.frame_b, bodyBox8.frame_a) annotation(
    Line(points = {{140, -190}, {150, -190}, {150, -190}, {150, -190}}, color = {95, 95, 95}));
  connect(bodyBox7.frame_b, bodyCylinder8.frame_a) annotation(
    Line(points = {{110, -190}, {120, -190}, {120, -190}, {120, -190}}, color = {95, 95, 95}));
  connect(bodyBox4.frame_b, bodyCylinder7.frame_a) annotation(
    Line(points = {{70, -150}, {70, -150}, {70, -160}, {80, -160}, {80, -160}}, color = {95, 95, 95}));
  connect(bodyCylinder7.frame_b, bodyBox7.frame_a) annotation(
    Line(points = {{100, -160}, {110, -160}, {110, -170}, {110, -170}}, color = {95, 95, 95}));
  connect(bodyBox8.frame_b, bodyCylinder9.frame_a) annotation(
    Line(points = {{150, -170}, {150, -170}, {150, -158}, {160, -158}, {160, -160}}, color = {95, 95, 95}));
  connect(inertia1.flange_b, revolute1.axis) annotation(
    Line(points = {{-70, -200}, {-100, -200}, {-100, -170}}));
  connect(inertia1.flange_a, LossRotMech.flange_2) annotation(
    Line(points = {{-90, -200}, {-60, -200}}));
  connect(coldVolume.flange, prismatic2.axis) annotation(
    Line(points = {{80, 100}, {80, 42}, {56, 42}}, color = {0, 127, 0}));
  connect(pipe1.port_b, coldVolume.ports[1]) annotation(
    Line(points = {{60, 160}, {80, 160}, {80, 140}}, color = {0, 127, 255}));
  connect(hotVolume.ports[1], pipe.port_a) annotation(
    Line(points = {{-60, 140}, {-60, 160}, {-40, 160}}, color = {0, 127, 255}));
  connect(thermalConductor1.port_b, hotVolume.heatPort) annotation(
    Line(points = {{-90, 120}, {-80, 120}}, color = {191, 0, 0}));
  connect(hotVolume.flange, prismatic1.axis) annotation(
    Line(points = {{-60, 100}, {-60, 42}, {-36, 42}}, color = {0, 127, 0}));
  connect(bodyCylinder4.frame_b, bodyBox4.frame_a) annotation(
    Line(points = {{60, -130}, {70, -130}, {70, -130}, {70, -130}}, color = {95, 95, 95}));
  connect(powerSensor1.flange_a, inertia2.flange_b) annotation(
    Line(points = {{-10, -200}, {3.57625e-06, -200}, {3.57625e-06, -200}, {3.57625e-06, -200}}));
  connect(LossRotMech.flange_1, powerSensor1.flange_b) annotation(
    Line(points = {{-40, -200}, {-30, -200}, {-30, -200}, {-30, -200}}));
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
    Diagram(coordinateSystem(extent = {{-240, -480}, {300, 180}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end StirlingTypeAlpha_temp;
