within PropulsionSystem.BaseClasses.BasicElements;

partial model NozzleBaseDefDesPt01
  //******************************************************************************************
protected
  /********************************************************
        Declaration
  ********************************************************/
  parameter PropulsionSystem.Records.ThermoFluidProperties fluid_1_des(fixed = false, HideResult = false, nX = Medium.nXi, nC = Medium.nC) annotation(HideResult=false);
  parameter PropulsionSystem.Records.ThermoFluidProperties fluid_2_des(fixed = false, HideResult = false, nX = Medium.nXi, nC = Medium.nC) annotation(HideResult=false);
  parameter Modelica.SIunits.Area AeThDes(fixed=false) annotation(HideResult=false);
  parameter Modelica.SIunits.Area AmechThDes(fixed=false) annotation(HideResult=false);
  
//******************************************************************************************
initial algorithm
//******************************************************************************************
initial equation
  //----------
  fluid_1_des.X[1:Medium.nXi] = fluid_1.Xi;
  fluid_1_des.C = actualStream(port_1.C_outflow);
  fluid_1_des.h = Medium.specificEnthalpy(Medium.setState_pTX(fluid_1_des.p, fluid_1_des.T, fluid_1_des.X[1:Medium.nXi]));
  fluid_1_des.s = Medium.specificEntropy(Medium.setState_pTX(fluid_1_des.p, fluid_1_des.T, fluid_1_des.X[1:Medium.nXi]));
  //----------
  fluid_2_des.m_flow = port_2.m_flow;
  fluid_2_des.p = fluid_2.p;
  fluid_2_des.T = fluid_2.T;
  fluid_2_des.X[1:Medium.nXi] = fluid_2.Xi;
  fluid_2_des.C = actualStream(port_2.C_outflow);
  fluid_2_des.h = Medium.specificEnthalpy(Medium.setState_pTX(fluid_2_des.p, fluid_2_des.T, fluid_2_des.X[1:Medium.nXi]));
  fluid_2_des.s = Medium.specificEntropy(Medium.setState_pTX(fluid_2_des.p, fluid_2_des.T, fluid_2_des.X[1:Medium.nXi]));
  //----------
  //******************************************************************************************
equation
  //******************************************************************************************
end NozzleBaseDefDesPt01;
