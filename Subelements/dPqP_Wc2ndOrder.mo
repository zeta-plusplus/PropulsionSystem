within PropulsionSystem.Subelements;

model dPqP_Wc2ndOrder
  extends PropulsionSystem.Interfaces.SubelementFrames.SubelementFrame;
  import Modelica.Constants;
  
  /********************************************************
   Declaration
  ********************************************************/
  //********** Package **********
  outer replaceable package Medium= Modelica.Media.Interfaces.PartialMedium;
  
  
  //********** Parameters **********
  //##### none #####
  
  
  //********** Internal variables **********
  Modelica.SIunits.MassFlowRate Wc;
  Real dPqP_internal;
  
  outer Real k_dPqP;
  outer Modelica.SIunits.MassFlowRate dm;
  outer Medium.BaseProperties fluid_I "flow station of inlet";
  
  constant Modelica.SIunits.Temperature Tstd= 288.15;
  constant Modelica.SIunits.AbsolutePressure pStd= 101.315*1000;
  
  
  //********** Interfaces **********
  //##### none #####
  
  
  //********** Initialization **********
  //##### none #####
  
  
//********** Protected objects **********
//##### none #####

algorithm
  //##### none #####
  
equation
  //********** Geometries **********
  //##### none #####
  
  
  //********** Connections, interface <-> internal variables **********
  //##### none #####
  
  //********** Eqns describing physics **********
  Wc= dm* sqrt(fluid_I.T/Tstd) / (fluid_I.p/pStd);
  dPqP_internal= k_dPqP* Wc^2.0;
  
  
/********************************************************
  Graphics
********************************************************/
  
  annotation(
    Diagram,
    Icon(coordinateSystem(initialScale = 0.1)));
  
end dPqP_Wc2ndOrder;
