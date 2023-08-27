within PropulsionSystem.Records;

record CompressorVariables
  extends Modelica.Icons.Record;
  
  /*--------------------------------------------------
    imports
  --------------------------------------------------*/
  import units=Modelica.Units.SI;
  import unitsNonSI=Modelica.Units.NonSI;
  
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
  units.Torque trq(fixed=fixed) annotation(
    HideResult=false);
  units.Power pwr_inv(fixed=fixed) annotation(
    HideResult=false);
  units.Torque trq_inv(fixed=fixed) annotation(
    HideResult=false);
  units.Angle phi(fixed=fixed) annotation(
    HideResult=false);
  units.AngularVelocity omega(fixed=fixed) annotation(
    HideResult=false);
  unitsNonSI.AngularVelocity_rpm Nmech(fixed=fixed) annotation(
    HideResult=false);
  units.MassFlowRate Wc_1(fixed=fixed) annotation(
    HideResult=false);
  unitsNonSI.AngularVelocity_rpm Nc_1(fixed=fixed) annotation(
    HideResult=false);
  Real PR(fixed=fixed) annotation(
    HideResult=false);
  Real eff(fixed=fixed) annotation(
    HideResult=false);
  units.SpecificEnthalpy dht(fixed=fixed) annotation(
    HideResult=false);
  units.SpecificEnthalpy dht_is(fixed=fixed) annotation(
    HideResult=false);
  units.SpecificEnthalpy h_2is(fixed=fixed) annotation(
    HideResult=false);
  
  
end CompressorVariables;
