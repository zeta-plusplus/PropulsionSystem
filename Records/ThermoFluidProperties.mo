within PropulsionSystem.Records;

record ThermoFluidProperties
  extends Modelica.Icons.Record;
  
  /*--------------------------------------------------
    imports
  --------------------------------------------------*/
  import units= Modelica.Units.SI;
  
  /*--------------------------------------------------
    parameters
  --------------------------------------------------*/
  parameter Boolean fixed=false;
  parameter Boolean HideResult=false;
  
  parameter Integer nX;
  parameter Integer nC;
  
  /*--------------------------------------------------
    variables
  --------------------------------------------------*/
  units.MassFlowRate m_flow(fixed=fixed) annotation(
    HideResult=false);
  units.Pressure p(fixed=fixed) annotation(
    HideResult=false);
  units.Temperature T(fixed=fixed) annotation(
    HideResult=false);
  units.SpecificEnthalpy h(fixed=fixed) annotation(
    HideResult=false);
  units.MassFraction X[nX](each fixed=fixed) annotation(
    HideResult=false);
  Real C[nC](each fixed=fixed) annotation(
    HideResult=false);
  units.SpecificEntropy s(fixed=fixed) annotation(
    HideResult=false);
  
end ThermoFluidProperties;
