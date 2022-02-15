within PropulsionSystem.Functions.PropellerFunctionPackage;

function NonDimVarRelation00
  extends Modelica.Icons.Function;
  //****************************************
  import Units= Modelica.SIunits;
  //****************************************
  //----------
  input Real CT;
  input Real CP;
  input Units.Length diam;
  input Real Nmech_rps;
  input Units.Velocity Vinf;
  //----------
  output Real J;
  output Real effProp;
  
//*******************************************************
protected
  
//*******************************************************
algorithm
  //-----
  if(0<abs(Nmech_rps*diam))then
    J:= Vinf/(Nmech_rps*diam);
  else
    J:= 0.0;
  end if;
  
  if(0<abs(CP))then
    effProp:= J*CT/CP;
  else
    effProp:= 0.0;
  end if;
  
end NonDimVarRelation00;
