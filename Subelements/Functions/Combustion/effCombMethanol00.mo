within PropulsionSystem.Subelements.Functions.Combustion;

function effCombMethanol00
  extends Modelica.Icons.Function;
  //********** declare inputs **********
  input Real fracAir;
  input Real fracFuel;
  //********** declare outputs **********
  output Real effComb;
  output Real lambda;
  output Real AFR;
  output Boolean flagValid;
protected
  //********** declare local variables **********
  Real LboundLambdaValid;
  Real UboundLambdaValid;
  Real AFRstoichiometric;
algorithm

end effCombMethanol00;
