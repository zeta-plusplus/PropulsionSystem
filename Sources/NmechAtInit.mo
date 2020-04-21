within PropulsionSystem.Sources;

model NmechAtInit
  /********************************************************
        imports
    ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  /********************************************************
        Declaration
    ********************************************************/
  /* ---------------------------------------------
        switches
  --------------------------------------------- */
  parameter Boolean use_u_Nmech_init = false "get Nmech_init from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  
  /* ---------------------------------------------
        parameters
    --------------------------------------------- */
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech_init_paramInput=9000 "mechanical rotation speed, rpm";
  
  
  /* ---------------------------------------------
        Internal variables    
    --------------------------------------------- */
  Modelica.SIunits.Angle phi "mechanical rotation displacement, rad";
  Modelica.SIunits.AngularVelocity omega "mechanical rotation speed, rad/sec";
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech "mechanical rotation speed, rpm";
  
  
  /* ---------------------------------------------
        Interface
    --------------------------------------------- */
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1 annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_2 annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
initial equation
  
  /*
  if(use_u_Nmech_init==false)then
    Nmech= Nmech_init_paramInput;
  elseif(use_u_Nmech_init==true)then
    Nmech= u_Nmech_init;
  end if;
  */
  
  Nmech= Nmech_init_paramInput;
//********************************************************************************
equation
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  phi = flange_1.phi;
  phi = flange_2.phi;
  flange_1.tau + flange_2.tau = 0.0;
  Nmech = Modelica.SIunits.Conversions.NonSIunits.to_rpm(omega);
  der(phi) = omega;
  annotation(
    defaultComponentName = "NmechAtInit",
    Documentation(info = "<html>
<p>
.
</p>

</html>"),
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(lineColor = {64, 64, 64}, fillColor = {250, 250, 250}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-100, -10}, {-50, 10}}), Rectangle(lineColor = {64, 64, 64}, fillColor = {250, 250, 250}, fillPattern = FillPattern.HorizontalCylinder, extent = {{50, -10}, {100, 10}}), Line(points = {{-80, -25}, {-60, -25}}), Line(points = {{60, -25}, {80, -25}}), Line(points = {{-70, -25}, {-70, -70}}), Line(points = {{70, -25}, {70, -70}}), Line(points = {{-80, 25}, {-60, 25}}), Line(points = {{60, 25}, {80, 25}}), Line(points = {{-70, 45}, {-70, 25}}), Line(points = {{70, 45}, {70, 25}}), Line(points = {{-70, -70}, {70, -70}}), Rectangle(lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-50, -50}, {50, 50}}, radius = 10), Text(origin = {2, -26}, lineColor = {0, 0, 255}, extent = {{-102, 76}, {98, 96}}, textString = "%name"), Text(lineColor = {255, 0, 0}, lineThickness = 1,extent = {{-100, -100}, {100, -70}}, textString = "At Init."), Rectangle(lineColor = {64, 64, 64}, fillColor = {255, 255, 255}, extent = {{-50, -50}, {50, 50}}, radius = 10), Text(origin = {10, 126}, lineColor = {255, 0, 0}, lineThickness = 1, extent = {{-54, -106}, {34, -146}}, textString = "Nmech")}));
end NmechAtInit;
