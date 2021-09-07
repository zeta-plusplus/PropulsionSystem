within PropulsionSystem.Sources;

model NmechAtDesignPoint01
  
  /* ---------------------------------------------
        switches
  --------------------------------------------- */
  parameter Boolean use_u_NmechDes = false "get NmechDes from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  /* ---------------------------------------------
          parameters
  --------------------------------------------- */
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NmechDes_paramInput = 3000.0 "mechanical rotation speed, rpm";
  //********** Initialization Parameters **********
  //--- flange_1 ---
  parameter Modelica.SIunits.Torque tau1_init = -1.0 * tau2_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_1"));
  parameter Modelica.SIunits.Angle phi1_init = phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_1"));
  //--- flange_2 ---
  parameter Modelica.SIunits.Torque tau2_init = pwr_init / (Nmech_init * 2.0 * Modelica.Constants.pi / 60.0) "" annotation(
    Dialog(tab = "Initialization", group = "flange_2"));
  parameter Modelica.SIunits.Angle phi2_init = phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_2"));
  //--- others ---
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech_init = NmechDes_paramInput "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.Angle phi_init = 0.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.Power pwr_init = 5.0 * 10.0 ^ 5 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  
  /* ---------------------------------------------
        Internal variables
  --------------------------------------------- */
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech(start = Nmech_init) "mechanical rotation speed, rpm" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  Modelica.SIunits.AngularVelocity omega(start = Nmech_init * 2.0 * Modelica.Constants.pi / 60.0) "mechanical rotation speed, rad/sec" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Angle phi(start = phi_init) "mechanical rotation displacement, rad" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  discrete Real auxVar[2];
  
  /* ---------------------------------------------
        Internal objects
  --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  /* ---------------------------------------------
          Interface
  --------------------------------------------- */
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1(tau(start = tau1_init), phi(start = phi1_init)) annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_2(tau(start = tau2_init), phi(start = phi2_init)) annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Interfaces.RealInput u_NmechDes if use_u_NmechDes==true annotation(
    Placement(visible = true, transformation(origin = {-60, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-60, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  //********************************************************************************
protected
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NmechDes(fixed=false) "mechanical rotation speed, design point value, rpm" annotation(HideResult=false);
  
  //********************************************************************************
initial equation
  if(use_u_NmechDes==true)then
    NmechDes= u_NmechDes;
    Nmech= u_NmechDes;
  else
    NmechDes= NmechDes_paramInput;
    Nmech= NmechDes_paramInput;
  end if;
  
  auxVar[1]=1;
  auxVar[2]=0;
  
  //********************************************************************************
equation
  if noEvent(time<=environment.timeRemoveDesConstraint) then
    auxVar[1]=1;
  else
    auxVar[1]=0;
  end if;
  
  Nmech=NmechDes*auxVar[1]+auxVar[2];
  
  flange_1.phi = phi;
  flange_2.phi = phi;
  flange_1.tau + flange_2.tau = 0.0;
  
  der(phi) = omega;
  Nmech = omega * 60.0 / (2.0 * Modelica.Constants.pi);
  
  annotation(
    defaultComponentName = "NmechDes",
    Documentation(info = "<html>
<p>
.
</p>

</html>"),
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(lineColor = {64, 64, 64}, fillColor = {250, 250, 250}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -10}, {-50, 10}}), Rectangle(lineColor = {64, 64, 64}, fillColor = {250, 250, 250}, fillPattern = FillPattern.HorizontalCylinder, extent = {{50, -10}, {100, 10}}), Line(points = {{-80, -25}, {-60, -25}}), Line(points = {{60, -25}, {80, -25}}), Line(points = {{-70, -25}, {-70, -70}}), Line(points = {{70, -25}, {70, -70}}), Line(points = {{-80, 25}, {-60, 25}}), Line(points = {{60, 25}, {80, 25}}), Line(points = {{-70, 45}, {-70, 25}}), Line(points = {{70, 45}, {70, 25}}), Line(points = {{-70, -70}, {70, -70}}), Rectangle(lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-50, -50}, {50, 50}}, radius = 10), Text(origin = {2, -26}, lineColor = {0, 0, 255}, extent = {{-102, 76}, {98, 96}}, textString = "%name"), Text(lineColor = {255, 0, 0}, lineThickness = 1, extent = {{-100, -100}, {100, -70}}, textString = "Des. Pt."), Rectangle(lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, extent = {{-50, -50}, {50, 50}}, radius = 10), Text(origin = {10, 126}, lineColor = {255, 0, 0}, lineThickness = 1, extent = {{-54, -106}, {34, -146}}, textString = "Nmech")}));
end NmechAtDesignPoint01;
