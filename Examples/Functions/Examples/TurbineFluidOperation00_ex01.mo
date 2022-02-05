within PropulsionSystem.Examples.Functions.Examples;

model TurbineFluidOperation00_ex01
  extends Modelica.Icons.Example;
  //****************************************
  import Units= Modelica.SIunits;
  //****************************************
  replaceable package Medium = Modelica.Media.Air.DryAirNasa constrainedby Modelica.Media.Interfaces.PartialMedium annotation (
    choicesAllMatching=true);
  
  //-----
  parameter Real PR=2;
  parameter Real eff=0.8;
  parameter Units.Pressure p1=3*101.325*1000;
  parameter Units.Temperature T1=1000;
  parameter Medium.MassFraction Xi1[Medium.nX] = Medium.X_default;
  parameter Units.MassFlowRate m_flow=1;
  parameter Units.AngularVelocity omega=10;
  //-----
  Medium.BaseProperties fluid_1;
  Medium.BaseProperties fluid_2;
  Medium.BaseProperties fluid_2_is;
  Units.Power pwr;
  Units.Power pwrMech;
  Units.Torque trq;
  //-----
  function trbFluidOp= PropulsionSystem.Functions.TurbineFunctionPackage.TurbineFluidOperation00(redeclare package inFuncMedium=Medium);
  function trbMechOp= PropulsionSystem.Functions.TurbineFunctionPackage.TurbineMechOperation00;
//************************************************************
equation
  fluid_1.state=Medium.setState_pTX(p=p1,T=T1,X=Xi1);
  (fluid_2.state, fluid_2_is.state, pwr)
    = trbFluidOp(state_1= fluid_1.state, Xi1=Xi1, m_flow1=m_flow, PR=PR, eff=eff);
  pwrMech= trbMechOp(omega=omega, trq=trq);
  pwrMech=pwr;
  
end TurbineFluidOperation00_ex01;
