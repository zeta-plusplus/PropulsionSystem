within PropulsionSystem.Examples.Functions.tests;

package Temp
  model Model
    replaceable package myMedium = Modelica.Media.Air.SimpleAir constrainedby 
      Modelica.Media.Interfaces.PartialSimpleIdealGasMedium annotation (
      choicesAllMatching=true);

    function funMach = FunctionPackage.Mach(redeclare package funMedium=myMedium);

    Real Mach;
    parameter Modelica.SIunits.Temperature T=293.15;
    parameter Modelica.SIunits.Pressure p=101325;
  protected 
    Real TempTime = T + time;
  equation 
    Mach = funMach(state=myMedium.setState_pT(p,TempTime), velo=300);
  end Model;

  package FunctionPackage      function Mach
      replaceable package funMedium = Modelica.Media.Interfaces.PartialSimpleIdealGasMedium annotation (
      choicesAllMatching=true);
      input funMedium.ThermodynamicState state;
      input Modelica.SIunits.Velocity velo;
      output Real Mach;
    protected 
      Modelica.SIunits.Velocity souvel;
    algorithm 
      souvel := funMedium.velocityOfSound(state);
      Mach := velo/souvel;
    end Mach;

    function Mach_02
      replaceable package funMedium = Modelica.Media.Interfaces.PartialMedium annotation (
      choicesAllMatching=true);
      input funMedium.ThermodynamicState state;
      input Modelica.SIunits.Velocity velo;
      output Real Mach;
    protected 
      Modelica.SIunits.Velocity souvel;
    algorithm 
      souvel := funMedium.velocityOfSound(state);
      Mach := velo/souvel;

    end Mach_02;
  end FunctionPackage;
end Temp;
