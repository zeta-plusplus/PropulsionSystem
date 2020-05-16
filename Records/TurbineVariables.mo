within PropulsionSystem.Records;

record TurbineVariables
  extends Modelica.Icons.Record;
  
  
  parameter Boolean fixed=false;
  parameter Boolean HideResult=false;
  
  Modelica.SIunits.Power pwr(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.Torque trq(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.Power pwr_inv(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.Torque trq_inv(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.AngularVelocity omega(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.Angle phi(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.MassFlowRate Wc_1(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nc_1(fixed=fixed) annotation(
    HideResult=false);
  Real PR(fixed=fixed) annotation(
    HideResult=false);
  Real eff(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.SpecificEnthalpy dht(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.SpecificEnthalpy dht_is(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.SpecificEnthalpy h_2is(fixed=fixed) annotation(
    HideResult=false);
  
  
end TurbineVariables;
