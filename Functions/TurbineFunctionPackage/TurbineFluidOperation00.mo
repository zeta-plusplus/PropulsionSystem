within PropulsionSystem.Functions.TurbineFunctionPackage;

function TurbineFluidOperation00
  extends Modelica.Icons.Function;
  //****************************************
  import Units= Modelica.SIunits;
  //****************************************
  replaceable package inFuncMedium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  //----------
  input inFuncMedium.ThermodynamicState state_1;
  input inFuncMedium.MassFraction Xi1[inFuncMedium.nX];
  input Units.MassFlowRate m_flow1;
  input Real PR;
  input Real eff;
  //----------
  output inFuncMedium.ThermodynamicState state_2;
  output inFuncMedium.ThermodynamicState state_2_is;
  output Units.Power pwr;
  //----------
  
//*******************************************************
protected
  Units.SpecificEnthalpy h1;
  Units.Pressure p2;
  Units.SpecificEnthalpy h2;
  Units.SpecificEnthalpy h2_is;
  /**/
//*******************************************************
algorithm
  h1:=inFuncMedium.specificEnthalpy(state_1);
  p2:= state_1.p/PR;
  h2_is:= inFuncMedium.isentropicEnthalpy(p2, state_1);
  h2:= h1 + eff*(h2_is - h1);
  //-----
  state_2:= inFuncMedium.setState_phX(p2, h2, Xi1);
  state_2_is:= inFuncMedium.setState_phX(p2, h2_is, Xi1);
  pwr:= (h2-h1)*m_flow1;
  /**/
end TurbineFluidOperation00;
