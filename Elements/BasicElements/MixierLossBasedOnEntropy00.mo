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
  // entropy change
  deltaS_sys= m_flow_1*fluid_1.R*log((1.0/fluid_3.d)/(1.0/fluid_1.d)) + m_flow_2*fluid_2.R*log((1.0/fluid_3.d)/(1.0/fluid_2.d));
  
  
  
end MixierLossBasedOnEntropy00;
