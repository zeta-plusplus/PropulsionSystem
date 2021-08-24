within PropulsionSystem.Subelements.Functions.Combustion;

function effCombDiesel00
  extends Modelica.Icons.Function;
  
  /* ************************************************************
  ref:
    https://x-engineer.org/automotive-engineering/internal-combustion-engines/performance/air-fuel-ratio-lambda-engine-performance/
  ************************************************************ */
  
  
  //********** declare inputs **********
  input Real fracAir;
  input Real fracFuel;
  //********** declare outputs **********
  output Real effComb;
  output Real lambda;
  output Real AFR;
  output Real AFRstoi;
  output Real flagValid;
protected
  //********** declare local variables **********
  Real LboundLambdaValid= 1.0;
  Real UboundLambdaValid= 2.0;
  Real AFRstoichiometric= 14.5;
algorithm
  AFR := fracAir / fracFuel;
  lambda := AFR / AFRstoichiometric;
  AFRstoi:=AFRstoichiometric;
  //----------
  if lambda < LboundLambdaValid then
    flagValid := 0.0;
  elseif UboundLambdaValid < lambda then
    flagValid := 0.0;
  else
    flagValid := 1.0;
  end if;
  //----------
  effComb := (-4.18) + 8.87 * lambda  -5.14 * lambda ^ 2.0 + lambda^3.0;
  //----------
  if effComb < 0.0 then
    effComb := 0.0;
  elseif 1.0 < effComb then
    effComb := 1.0;
  end if;
  
end effCombDiesel00;
