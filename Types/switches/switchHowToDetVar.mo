within PropulsionSystem.Types.switches;

type switchHowToDetVar= enumeration
(
  param "set by parameter",
  viaRealInput "set by RealInput port",
  asCalculated "calculated as a result of other constraints and eqns"
)
annotation (Documentation(info=
"<html>

</html>"));
