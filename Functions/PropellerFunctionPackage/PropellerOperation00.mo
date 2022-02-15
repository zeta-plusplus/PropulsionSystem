within PropulsionSystem.Functions.PropellerFunctionPackage;

function PropellerOperation00
  extends Modelica.Icons.Function;
  //****************************************
  import Units= Modelica.SIunits;
  //****************************************
  replaceable package inFuncMedium = Modelica.Media.Interfaces.PartialMedium(fixedX=false) annotation(
    choicesAllMatching = true);
  //----------
  input Real Nmech_rps;
  input Units.Velocity Vinf;
  input Real CT "thrust coefficient";
  input Real CP "power coefficient";
  input Units.Length diam;
  input inFuncMedium.ThermodynamicState state_amb;
  //----------
  output Real J;
  output Real effProp;
  output Units.Force Fn;
  output Units.Power pwrPropulsive;
  output Units.Power pwrMech;
  
algorithm
  J:= Vinf/(Nmech_rps*diam);
  effProp:= J*CT/CP;
  Fn:= CT*(inFuncMedium.density(state_amb)*(Nmech_rps^2.0*diam^2.0)*diam^2.0);
  pwrMech:= CP*(inFuncMedium.density(state_amb)*(Nmech_rps^2.0*diam^2.0)*diam^2.0*(Nmech_rps*diam));
  pwrPropulsive:= Fn*Vinf;
  
end PropellerOperation00;
