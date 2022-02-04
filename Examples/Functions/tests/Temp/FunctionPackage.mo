within PropulsionSystem.Examples.Functions.tests.Temp;

package FunctionPackage
  function Mach
    replaceable package funMedium = Modelica.Media.Interfaces.PartialSimpleIdealGasMedium annotation(
      choicesAllMatching = true);
    input funMedium.ThermodynamicState state;
    input Modelica.SIunits.Velocity velo;
    output Real Mach;
  protected
    Modelica.SIunits.Velocity souvel;
  algorithm
    souvel := funMedium.velocityOfSound(state);
    Mach := velo / souvel;
  end Mach;
end FunctionPackage;
