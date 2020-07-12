within PropulsionSystem.Sources;

model NmechAtDesignPoint
  /* ---------------------------------------------
        parameters
  --------------------------------------------- */
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NmechDes_paramInput=3000.0 "mechanical rotation speed, rpm";
  
  
  //********** Initialization Parameters **********
  //--- flange_1 ---
  parameter Modelica.SIunits.Torque tau1_init=-1.0*tau2_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_1")
  );
  parameter Modelica.SIunits.Angle phi1_init=phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_1")
  );
  //--- flange_2 ---
  parameter Modelica.SIunits.Torque tau2_init=pwr_init/(Nmech_init*2.0*Modelica.Constants.pi/60.0) "" annotation(
    Dialog(tab = "Initialization", group = "flange_2")
  );
  parameter Modelica.SIunits.Angle phi2_init=phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_2")
  );
  
  //--- others ---
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech_init=NmechDes_paramInput "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Angle phi_init=0.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Power pwr_init=5.0*10.0^(5) "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  
  
  
  /* ---------------------------------------------
      Internal objects
  --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {50, 10}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.UnitConversions.To_rpm to_rpm1 annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = NmechDes_paramInput)  annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariableDesignPoint ConstraintDesPt annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  
  
  /* ---------------------------------------------
        Interface
  --------------------------------------------- */
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1(
    tau(start=tau1_init), phi(start=phi1_init)
  ) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_2(
    tau(start=tau2_init), phi(start=phi2_init)
  ) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  
//********************************************************************************
equation
  connect(ConstraintDesPt.u_variable, to_rpm1.y) annotation(
    Line(points = {{12, 30}, {20, 30}, {20, 30}, {18, 30}}, color = {0, 0, 127}));
  connect(const.y, ConstraintDesPt.u_targetValue) annotation(
    Line(points = {{-18, 30}, {-12, 30}, {-12, 30}, {-12, 30}}, color = {0, 0, 127}));
  connect(to_rpm1.u, speedSensor1.w) annotation(
    Line(points = {{42, 30}, {50, 30}, {50, 22}, {50, 22}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, flange_2) annotation(
    Line(points = {{50, 0}, {100, 0}}));
  connect(flange_1, speedSensor1.flange) annotation(
    Line(points = {{-100, 0}, {50, 0}}));
  
  
  annotation(
    defaultComponentName = "NmechDes",
    Documentation(info = "<html>
<p>
.
</p>

</html>"),
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(lineColor = {64, 64, 64}, fillColor = {250, 250, 250}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -10}, {-50, 10}}), Rectangle(lineColor = {64, 64, 64}, fillColor = {250, 250, 250}, fillPattern = FillPattern.HorizontalCylinder, extent = {{50, -10}, {100, 10}}), Line(points = {{-80, -25}, {-60, -25}}), Line(points = {{60, -25}, {80, -25}}), Line(points = {{-70, -25}, {-70, -70}}), Line(points = {{70, -25}, {70, -70}}), Line(points = {{-80, 25}, {-60, 25}}), Line(points = {{60, 25}, {80, 25}}), Line(points = {{-70, 45}, {-70, 25}}), Line(points = {{70, 45}, {70, 25}}), Line(points = {{-70, -70}, {70, -70}}), Rectangle(lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-50, -50}, {50, 50}}, radius = 10), Text(origin = {2, -26}, lineColor = {0, 0, 255}, extent = {{-102, 76}, {98, 96}}, textString = "%name"), Text(lineColor = {255, 0, 0}, lineThickness = 1,extent = {{-100, -100}, {100, -70}}, textString = "Des. Pt."), Rectangle(lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, extent = {{-50, -50}, {50, 50}}, radius = 10), Text(origin = {10, 126}, lineColor = {255, 0, 0}, lineThickness = 1, extent = {{-54, -106}, {34, -146}}, textString = "Nmech")}));
  
  
  
end NmechAtDesignPoint;
