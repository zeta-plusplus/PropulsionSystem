within PropulsionSystem.Functions.TurbineFunctionPackage;

function TurbineMechOperation00
  extends Modelica.Icons.Function;
  //****************************************
  import Units= Modelica.SIunits;
  //****************************************
  input Units.AngularVelocity omega;
  input Units.Torque trq;
  //----------
  output Units.Power pwr;
  
//*******************************************************
algorithm
  pwr:= omega*trq;
  
end TurbineMechOperation00;
