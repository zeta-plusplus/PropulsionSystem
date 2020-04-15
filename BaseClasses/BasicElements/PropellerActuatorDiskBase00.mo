within PropulsionSystem.BaseClasses.BasicElements;

partial model PropellerActuatorDiskBase00
  /********************************************************
            imports
    ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  /********************************************************
            Declaration
    ********************************************************/
  /* ---------------------------------------------
        Type definitions
          only valid in this class
    --------------------------------------------- */
  type switchThrustSaturation = enumeration(byVinf "determine saturation Fn by free stream speed value", byFn "determine saturation Fn by Thrust value");
  
  
  /* ---------------------------------------------
          switches
    --------------------------------------------- */
  parameter switchThrustSaturation switch_FnSaturation = switchThrustSaturation.byVinf "How to determine saturation of Fn" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  
  /* ---------------------------------------------
        Internal variables    
    --------------------------------------------- */
  Real effProp "propeller efficiency";
  Modelica.SIunits.Power pwr "power driving propeller";
  Modelica.SIunits.Power pwrPropulsive "propulsive power, defined by Fg*Vin";
  Modelica.SIunits.Torque trq "torque of drive shaft";
  Modelica.SIunits.AngularVelocity omega "mechanical rotation speed, rad/sec";
  Modelica.SIunits.Angle phi "mechanical rotation displacement, rad";
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech "mechanical rotation speed, rpm";
  Modelica.SIunits.Force Fn "thrust generated by propeller";
  Modelica.SIunits.Velocity Vinf "freestream speeed";
  Modelica.SIunits.Velocity Vinf_FnSaturation if switch_FnSaturation == switchThrustSaturation.byVinf "freestream speeed for thrust saturation";
  Modelica.SIunits.Force Fn_FnSaturation if switch_FnSaturation == switchThrustSaturation.byFn "saturation thrust";
  /* ---------------------------------------------
          Interface   
    --------------------------------------------- */
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_1 annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_Fn(quantity = "Force", unit = "N", displayUnit = "N") annotation(
    Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_Vinf(quantity = "Velocity", unit = "m/s", displayUnit = "m/s") "speed of freestream flow" annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
protected
  /* ---------------------------------------------
            Non-modifiable parameters
      --------------------------------------------- */
  parameter Real effPropDes(fixed = false) annotation(
    HideResult = false);

algorithm
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
// prevent Vinf=0.0 input
  if u_Vinf <= 0.0 then
    Vinf := 0.1;
  else
    Vinf := u_Vinf;
  end if;
equation
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  phi = flange_1.phi;
  trq = flange_1.tau;
  y_Fn = Fn;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  der(phi) = omega;
  Nmech = Modelica.SIunits.Conversions.NonSIunits.to_rpm(omega);
  pwr = trq * omega;
  pwrPropulsive = pwr * effProp;
  if switch_FnSaturation == switchThrustSaturation.byVinf then
    if Vinf_FnSaturation < Vinf then
      pwrPropulsive = Fn * Vinf;
    else
      Fn = pwrPropulsive / Vinf_FnSaturation;
    end if;
  elseif switch_FnSaturation == switchThrustSaturation.byFn then
    Fn = min(Fn_FnSaturation, pwrPropulsive / Vinf);
  else
    if Vinf_FnSaturation < Vinf then
      pwrPropulsive = Fn * Vinf;
    else
      Fn = pwrPropulsive / Vinf_FnSaturation;
    end if;
  end if;
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Prop",
    Icon(graphics = {Rectangle(origin = {-43, 8}, fillPattern = FillPattern.Solid, extent = {{-1, 0}, {143, -16}}), Polygon(origin = {-57, 0}, fillPattern = FillPattern.Solid, points = {{-18, 0}, {10, 14}, {10, -14}, {-18, 0}}), Text(origin = {-45, 124}, extent = {{-55, -4}, {145, -24}}, textString = "%name"), Polygon(origin = {-33, 44}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-12, -44}, {-8, 50}, {2, 56}, {10, -44}, {-12, -44}}), Polygon(origin = {-37, -44}, rotation = 180, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-12, -44}, {-8, 50}, {2, 56}, {8, -44}, {-12, -44}}), Ellipse(origin = {-33, 0}, extent = {{-47, 100}, {43, -100}}, endAngle = 360), Rectangle(origin = {-38, 1}, fillPattern = FillPattern.Solid, extent = {{-9, 13}, {15, -15}})}, coordinateSystem(initialScale = 0.1)));
end PropellerActuatorDiskBase00;
