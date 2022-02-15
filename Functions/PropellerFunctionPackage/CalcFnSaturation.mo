within PropulsionSystem.Functions.PropellerFunctionPackage;

function CalcFnSaturation
  extends Modelica.Icons.Function;
  //****************************************
  import Units= Modelica.SIunits;
  //****************************************
  input PropulsionSystem.Types.switches.switchPropellerThrustSaturation switchFnSaturation = PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byVinf;
  input Units.Velocity Vinf;
  input Units.Power pwrPropulsive;
  input Units.Velocity Vinf_FnSaturation=50;
  input Units.Force Fn_FnSaturation=1000;
  //-----
  output Units.Force Fn;
  
algorithm
  if switchFnSaturation == PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byVinf then
    if Vinf_FnSaturation < Vinf then
      Fn:= pwrPropulsive / Vinf ;
    else
      Fn := pwrPropulsive / Vinf_FnSaturation;
    end if;
  elseif switchFnSaturation == PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byFn then
    Fn := min(Fn_FnSaturation, pwrPropulsive / Vinf);
  else
    if Vinf_FnSaturation < Vinf then
      Fn:= pwrPropulsive / Vinf;
    else
      Fn:= pwrPropulsive / Vinf_FnSaturation;
    end if;
  end if;
  
end CalcFnSaturation;
