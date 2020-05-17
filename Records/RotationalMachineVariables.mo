within PropulsionSystem.Records;

record RotationalMachineVariables
  extends Modelica.Icons.Record;
  
  parameter Boolean fixed=false;
  parameter Boolean HideResult=false;
  
  Modelica.SIunits.Power pwr(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.AngularVelocity omega(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.Angle phi(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.Torque trq(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech(fixed=fixed) annotation(
    HideResult=false);
  
end RotationalMachineVariables;
