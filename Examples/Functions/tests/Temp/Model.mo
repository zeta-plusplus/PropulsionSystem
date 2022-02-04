within PropulsionSystem.Examples.Functions.tests.Temp;

model Model
  replaceable package myMedium = Modelica.Media.Air.SimpleAir constrainedby Modelica.Media.Interfaces.PartialSimpleIdealGasMedium annotation(
     choicesAllMatching = true);
  function funMach = FunctionPackage.Mach(redeclare package funMedium = myMedium);
  Real Mach;
  parameter Modelica.SIunits.Temperature T = 293.15;
  parameter Modelica.SIunits.Pressure p = 101325;
protected
  Real TempTime = T + time;
equation
  Mach = funMach(state = myMedium.setState_pT(p, TempTime), velo = 300);
end Model;
