within PropulsionSystem.Functions.PropellerFunctionPackage;

function PropellerPropulsivePower00
  extends Modelica.Icons.Function;
  //****************************************
  import Units= Modelica.SIunits;
  //****************************************
  input Units.Force Fn;
  input Units.Velocity Vinf;
  //----------
  output Units.Power pwr;
  
algorithm
  pwr:= Fn*Vinf;
  
end PropellerPropulsivePower00;
