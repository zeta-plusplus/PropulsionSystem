within PropulsionSystem.Records;

record ThermoFluidProperties01
  extends Modelica.Icons.Record;
  
  parameter Boolean fixed=false;
  parameter Boolean HideResult=false;
  
  parameter Integer nX;
  parameter Integer nC;
  
  parameter Modelica.SIunits.MassFlowRate m_flow(fixed=fixed) annotation(
    HideResult=false);
  parameter Modelica.SIunits.Pressure p(fixed=fixed) annotation(
    HideResult=false);
  parameter Modelica.SIunits.Temperature T(fixed=fixed) annotation(
    HideResult=false);
  parameter Modelica.SIunits.SpecificEnthalpy h(fixed=fixed) annotation(
    HideResult=false);
  parameter Modelica.SIunits.MassFraction X[nX](each fixed=fixed) annotation(
    HideResult=false);
  parameter Real C[nC](each fixed=fixed) annotation(
    HideResult=false);
  parameter Modelica.SIunits.SpecificEntropy s(fixed=fixed) annotation(
    HideResult=false);
  
end ThermoFluidProperties01;
