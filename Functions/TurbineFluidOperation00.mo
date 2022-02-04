within PropulsionSystem.Functions;

function TurbineFluidOperation00
  extends Modelica.Icons.Function;
  //****************************************
  import Units= Modelica.SIunits;
  //****************************************
  replaceable package inFuncMedium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  //----------
  //input Units.MassFlowRate m_flow1;
  input inFuncMedium.ThermodynamicState state_1;
  //input Medium.MassFraction Xi1[Medium.nX];
  //input Real PR;
  //input Real eff;
  //----------
  output Units.SpecificEnthalpy h1;
  //output Medium.ThermodynamicState state_2;
  //----------
  
//*******************************************************
protected
  /*Units.Pressure p2;
  Units.SpecificEnthalpy h2;
  Units.SpecificEnthalpy h2_is;
  Units.SpecificEnthalpy dht;
  Units.SpecificEnthalpy dht_is;
  */
//*******************************************************
algorithm
  h1:=inFuncMedium.specificEnthalpy(state_1);
  /*p2:= state_1.p*PR;
  h2_is:= Medium.isentropicEnthalpy(p2, state_1);
  dht_is:= h2_is - state_1.h;
  dht:= eff*dht_is;
  h2:= state_1.h + dht;
  //-----
  state_2:= Medium.setState_phX(p2, h2, Xi1);
  */
end TurbineFluidOperation00;
