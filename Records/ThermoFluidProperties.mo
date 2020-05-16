within PropulsionSystem.Records;

record ThermoFluidProperties
  extends Modelica.Icons.Record;
  
  parameter Boolean fixed=false;
  parameter Boolean HideResult=false;
  
  parameter Integer nX;
  parameter Integer nC;
  
  Modelica.SIunits.MassFlowRate m_flow(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.Pressure p(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.Temperature T(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.SpecificEnthalpy h(fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.MassFraction X[nX](fixed=fixed) annotation(
    HideResult=false);
  Real C[nC](fixed=fixed) annotation(
    HideResult=false);
  Modelica.SIunits.SpecificEntropy s(fixed=fixed) annotation(
    HideResult=false);
  
end ThermoFluidProperties;
