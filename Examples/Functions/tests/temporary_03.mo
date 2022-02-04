within PropulsionSystem.Examples.Functions.tests;

model temporary_03
  replaceable package myMedium = Modelica.Media.Air.DryAirNasa constrainedby Modelica.Media.Interfaces.PartialMedium annotation(
     choicesAllMatching = true);
  function funMach = PropulsionSystem.Functions.Mach_02(redeclare package funMedium = myMedium);
  Real Mach;
  parameter Modelica.SIunits.Temperature T = 293.15;
  parameter Modelica.SIunits.Pressure p = 101325;
  parameter myMedium.MassFraction Xi1[myMedium.nX] = myMedium.X_default;
protected
  Real TempTime = T + time;
equation
  Mach = funMach(state = myMedium.setState_pTX(p, TempTime, Xi1), velo = 300);
end temporary_03;
