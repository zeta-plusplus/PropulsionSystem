within PropulsionSystem.Records;

record RotationalMachineVariables
  extends Modelica.Icons.Record;
  
  /*--------------------------------------------------
    imports
  --------------------------------------------------*/
  import units= Modelica.Units.SI;
  import unitsNonSI= Modelica.Units.NonSI;
  
  /*--------------------------------------------------
    parameters
  --------------------------------------------------*/
  parameter Boolean fixed=false;
  parameter Boolean HideResult=false;
  
  
  /*--------------------------------------------------
    variables
  --------------------------------------------------*/
  units.Power pwr(fixed=fixed) annotation(
    HideResult=false);
  units.AngularVelocity omega(fixed=fixed) annotation(
    HideResult=false);
  units.Angle phi(fixed=fixed) annotation(
    HideResult=false);
  units.Torque trq(fixed=fixed) annotation(
    HideResult=false);
  unitsNonSI.AngularVelocity_rpm Nmech(fixed=fixed) annotation(
    HideResult=false);
  
end RotationalMachineVariables;
