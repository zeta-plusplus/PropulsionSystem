within PropulsionSystem.Examples.Functions.Examples;

model TurbineFluidOperation00_ex01
  extends Modelica.Icons.Example;
  //****************************************
  import Units= Modelica.SIunits;
  //****************************************
  package Medium = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00 annotation (
    choicesAllMatching=true);
  
  /*
  replaceable package Medium = Modelica.Media.Air.MoistAir constrainedby Modelica.Media.Interfaces.PartialMedium annotation (
    choicesAllMatching=true);
  
  replaceable package Medium = Modelica.Media.Air.DryAirNasa constrainedby Modelica.Media.Interfaces.PartialMedium annotation (
    choicesAllMatching=true);
  */
  
  //-----
  parameter Real PR=2;
  parameter Real eff=0.8;
  parameter Units.Pressure p1=3*101.325*1000;
  parameter Units.Temperature T1=1000;
  
  parameter Units.MassFlowRate m_flow=1;
  parameter Units.AngularVelocity omega=20;
  //-----
  Medium.BaseProperties fluid_1;
  Medium.BaseProperties fluid_2;
  Units.SpecificEnthalpy h_2is;
  Units.Power pwr;
  Units.Power pwrMech;
  Units.Torque trq;
  //-----
  Modelica.Fluid.Vessels.ClosedVolume volume(replaceable package Medium=Medium, T_start = T1, V = 0.01, X_start = {0.01, 0.79, 0.2}, p_start = p1, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {-60, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  //-----
  function trbFluidOp= PropulsionSystem.Functions.TurbineFunctionPackage.TurbineFluidOperation00(redeclare package inFuncMedium=Medium);
  function trbMechOp= PropulsionSystem.Functions.TurbineFunctionPackage.TurbineMechOperation00;
      inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
//************************************************************
equation
  fluid_1.p= volume.medium.p;
  fluid_1.T= volume.medium.T;
  fluid_1.X= volume.medium.X;
  (fluid_2.p, fluid_2.h, fluid_2.X, h_2is, pwr)
    = trbFluidOp(state_1= fluid_1.state, m_flow1=m_flow, PR=PR, eff=eff);
  pwrMech= trbMechOp(omega=omega, trq=trq); 
  pwrMech=pwr;
  
end TurbineFluidOperation00_ex01;
