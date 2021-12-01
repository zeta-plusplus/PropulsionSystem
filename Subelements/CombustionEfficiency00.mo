within PropulsionSystem.Subelements;

block CombustionEfficiency00
  extends PropulsionSystem.Icons.Icon_Combustion;
  /* ************************************************************
  ref:
    https://x-engineer.org/automotive-engineering/internal-combustion-engines/performance/air-fuel-ratio-lambda-engine-performance/
  ************************************************************ */
  
  /********************************************************
              imports   
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  import PropulsionSystem.Functions;
  import PropulsionSystem.Subelements.Functions.Combustion;
  
  
  /* ---------------------------------------------
        switches
  --------------------------------------------- */
  parameter PropulsionSystem.Types.switches.switch_fuel switchFuel = PropulsionSystem.Types.switches.switch_fuel.gasoline 
    "switch, fuel type"
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  
  /********************************************************
                   Declaration
  ********************************************************/
  /* ---------------------------------------------
        Internal variables    
  --------------------------------------------- */
  Real fracFuelStoi;
  Real fracAirStoi;
  Real fracTot "fracFuel + fracAir";
  Real effComb;
  Real lambda "equivalence air-fuel ratio";
  Real AFR;
  Real AFRstoi "AFR at stoichiometric air-fuel ratio";
  Real AFRsat "AFR with saturation";
  Real FAR;
  Real FARstoi "FAR at stoichiometric air-fuel ratio";
  Real FARsat "FAR with saturation";
  Real flagValid;
  
  /* ---------------------------------------------
        Functions    
  --------------------------------------------- */
  replaceable function efficiencyCharacteristic=
    Combustion.effCombGasoline00
      "Function to calculate efficiency"
    annotation(Dialog(group="Characteristics", enable=true),
               choicesAllMatching=true);
  
  
  /* ---------------------------------------------
        Interface   
  --------------------------------------------- */
  input Modelica.Blocks.Interfaces.RealInput u_fracAir annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_fracFuel annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_effComb annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_AFR annotation(
    Placement(visible = true, transformation(origin = {110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_lambda annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_fracFuelSat "fracFuel with saturation" annotation(
    Placement(visible = true, transformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  PropulsionSystem.Types.SubelementBus subelementBus1 annotation(
    Placement(visible = true, transformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //**************************************************************************************************************
equation
  /* ---------------------------------------------
  Connections, interface <-> internal variables   
  --------------------------------------------- */
  y_effComb= effComb;
  y_lambda= lambda;
  y_AFR= AFR;
  
  if(1.0<=lambda)then
    y_fracFuelSat= u_fracFuel;
    FARsat= FAR;
    AFRsat= AFR;
  else
    y_fracFuelSat= fracFuelStoi;
    FARsat= FARstoi;
    AFRsat= AFRstoi;
  end if;
  
  
  /* ---------------------------------------------
  Eqns describing physics   
  --------------------------------------------- */
  fracTot= u_fracAir + u_fracFuel;
  FAR= 1.0/AFR;
  
  fracTot= fracAirStoi+ fracFuelStoi;
  AFRstoi= (fracAirStoi/fracFuelStoi);
  FARstoi= 1.0/AFRstoi;
  
  if(switchFuel==switches.switch_fuel.gasoline)then
    (effComb, lambda, AFR, AFRstoi, flagValid)= Combustion.effCombGasoline00(fracAir= u_fracAir, fracFuel= u_fracFuel);
  elseif(switchFuel==switches.switch_fuel.diesel)then
    (effComb, lambda, AFR, AFRstoi, flagValid)= Combustion.effCombDiesel00(fracAir= u_fracAir, fracFuel= u_fracFuel);
  elseif(switchFuel==switches.switch_fuel.kerosene)then
    (effComb, lambda, AFR, AFRstoi, flagValid)= Combustion.effCombKerosene00(fracAir= u_fracAir, fracFuel= u_fracFuel);
  elseif(switchFuel==switches.switch_fuel.hydrogen)then
    (effComb, lambda, AFR, AFRstoi, flagValid)= Combustion.effCombHydrogen00(fracAir= u_fracAir, fracFuel= u_fracFuel);
  elseif(switchFuel==switches.switch_fuel.methanol)then
    (effComb, lambda, AFR, AFRstoi, flagValid)= Combustion.effCombMethanol00(fracAir= u_fracAir, fracFuel= u_fracFuel);
  elseif(switchFuel==switches.switch_fuel.ethanol)then
    (effComb, lambda, AFR, AFRstoi, flagValid)= Combustion.effCombEthanol00(fracAir= u_fracAir, fracFuel= u_fracFuel);
  elseif(switchFuel==switches.switch_fuel.userDefined)then
    (effComb, lambda, AFR, AFRstoi, flagValid)= Combustion.efficiencyCharacteristic(fracAir= u_fracAir, fracFuel= u_fracFuel);
  else
    (effComb, lambda, AFR, AFRstoi, flagValid)= Combustion.effCombGasoline00(fracAir= u_fracAir, fracFuel= u_fracFuel);
  end if;
  
  
  /********************************************************
    Graphics
  ********************************************************/
  
  annotation(
    defaultComponentName = "calcEffComb",
    Diagram(coordinateSystem(initialScale = 0.1)),
  Icon(graphics = {Text(origin = {1, -88}, extent = {{-101, 10}, {99, -10}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
  experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.06),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
end CombustionEfficiency00;
