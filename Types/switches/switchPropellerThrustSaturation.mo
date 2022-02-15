within PropulsionSystem.Types.switches;

type switchPropellerThrustSaturation = enumeration
(
  byVinf "determine saturation Fn by free stream speed value", 
  byFn "determine saturation Fn by Thrust value"
) 
annotation (Documentation(info=
"<html>

</html>"));
