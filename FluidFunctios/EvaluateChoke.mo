within PropulsionSystem.FluidFunctios;

function EvaluateChoke
  //********** declare inputs **********
  //--- operational condition ---
  input ThermodynamicState state_I;
  input ThermodynamicState stateStat_I;
  
  
  //--- constant number inputs ---
  //##### none #####
  
  //********** declare outputs **********
  output ThermodynamicState stateStat_O;
  output Real MN_O;
  Modelica.SIunits.Velocity V_O;
protected
  //********** declare local objects **********
  Modelica.SIunits.SpecificEnthalpy hStat_O "";
  
algorithm
  //********** process **********
  
  stateStat_I.h:= Medium.isentropicEnthalpy(stateStat_I.p, state_I);
  V_O:= sqrt( 2.0*(state_I.h - stateStat_I.h ));
  MN_O:= V / Medium.velocityOfSound(stateStat_I);
  
  if(1.0<MN)then
    MN_O:= 1.0;
    V_O:= Medium.velocityOfSound(stateStat_I);
  end if;
  
  hStat_O.h:= fluid_I.h - 1.0/2.0*V_O^2.0;
  stateStat_O:=setState_phX(stateStat_I.p, hStat_O, stateStat_I.Xi);
  
end EvaluateChoke;
