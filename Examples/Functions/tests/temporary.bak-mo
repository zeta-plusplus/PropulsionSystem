within PropulsionSystem.Examples.Functions.tests;

model temporary
  replaceable package myMedium = Modelica.Media.Air.SimpleAir constrainedby Modelica.Media.Interfaces.PartialSimpleIdealGasMedium annotation(
     choicesAllMatching = true);
  function funMach = PropulsionSystem.Examples.Functions.tests.Temp.FunctionPackage.Mach(redeclare package funMedium = myMedium);
  Real Mach;
  parameter Modelica.SIunits.Temperature T = 293.15;
  parameter Modelica.SIunits.Pressure p = 101325;
protected
  Real TempTime = T + time;
equation
  Mach = funMach(state = myMedium.setState_pT(p, TempTime), velo = 300);
end temporary;
