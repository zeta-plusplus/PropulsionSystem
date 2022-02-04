within PropulsionSystem.Examples.Functions.tests;

model TurbineFluidOperation00_ex01
  extends Modelica.Icons.Example;
  //****************************************
  import Units= Modelica.SIunits;
  //****************************************
  //package FunctionPackage= PropulsionSystem.Functions.TurbineFunctionPackage(redeclare package Medium=Medium);
  replaceable package Medium = Modelica.Media.Air.DryAirNasa constrainedby Modelica.Media.Interfaces.PartialMedium annotation (
    choicesAllMatching=true);
  
  parameter Real PR=2;
  parameter Real eff=0.8;
  parameter Units.Pressure p1=3*101.325;
  parameter Units.Temperature T1=200;
  parameter Medium.MassFraction Xi1[Medium.nX] = Medium.X_default;
  //-----
  Units.SpecificEnthalpy h1;
  //Medium.BaseProperties fluid_1;
  //Medium.BaseProperties fluid_2;
  
  function trbFluidOp= PropulsionSystem.Functions.TurbineFluidOperation00(redeclare package inFuncMedium=Medium);
  
equation
  h1= trbFluidOp(state_1= Medium.setState_pTX(p1, T1, Xi1));
  
end TurbineFluidOperation00_ex01;
