within PropulsionSystem.Functions.PropellerFunctionPackage;

function PropellerMechPower00
  extends Modelica.Icons.Function;
  //****************************************
  import Units= Modelica.SIunits;
  //****************************************
  input Units.AngularVelocity omega;
  input Units.Torque trq;
  //----------
  output Units.Power pwr;
  
algorithm
  pwr:= omega*trq;
  
end PropellerMechPower00;
