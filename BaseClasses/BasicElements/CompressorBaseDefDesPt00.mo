within PropulsionSystem.BaseClasses.BasicElements;

partial model CompressorBaseDefDesPt00
  extends PropulsionSystem.BaseClasses.BasicElements.CompressorBase00;
  /********************************************************
      Declaration
  ********************************************************/
  /* ---------------------------------------------
      Package
  --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  
  
  /* ---------------------------------------------
      Internal objects
  --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  
  
  
  discrete Modelica.SIunits.MassFlowRate Wc_1_des "corrected mass flow rate, fluid_1, design point" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
//******************************************************************************************
initial algorithm
  
  
//******************************************************************************************
equation
  
  
  when (time<=environment.timeRemoveDesConstraint)then
    /* ---------------------------------------------
    design point eqn
    --------------------------------------------- */
    
    
    
  end when;
  
  
end CompressorBaseDefDesPt00;
