within PropulsionSystem.Elements.BasicElements;

model MixierLossBasedOnEntropy00
  extends PropulsionSystem.BaseClasses.BasicElements.NonidealMixerBase00;
  
  /********************************************************
              imports
  ********************************************************/
  import Modelica.Constants;
  import units= Modelica.SIunits;
  
  
  /********************************************************
              Declaration
  ********************************************************/
  /* ---------------------------------------------
              switch
  --------------------------------------------- */
  
  
  
  /* ---------------------------------------------
              parameters
  --------------------------------------------- */
  
  
  
  /* ---------------------------------------------
              Internal variables
  --------------------------------------------- */
  units.SpecificEntropy deltaS_sys "Entropy change, entire system" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  
  
  /* ---------------------------------------------
              Internal objects
  --------------------------------------------- */
  
  
  
  /* ---------------------------------------------
              Interface
  --------------------------------------------- */
  
  
  
  
  //********************************************************************************
equation
  /* ---------------------------------------------
    Eqns describing physics
  --------------------------------------------- */
  //----- mixing -----
  deltaS_sys= port_1.m_flow*fluid_1.R*log(n_fluid_3/n_fluid_1) + port_2.m_flow*fluid_2.R*log(n_fluid_3/n_fluid_2);
  
  s_fluid_3= ((s_fluid_1*port_1.m_flow + s_fluid_2*port_2.m_flow) + deltaS_sys)/(-1.0*port_3.m_flow);
  
  
  annotation(
    defaultComponentName = "Mixer"
    );
  
  
end MixierLossBasedOnEntropy00;
