within PropulsionSystem.Functions;

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
