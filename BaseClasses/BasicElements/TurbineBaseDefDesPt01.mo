within PropulsionSystem.BaseClasses.BasicElements;

partial model TurbineBaseDefDesPt01
  
//******************************************************************************************
protected
  /********************************************************
        Declaration
  ********************************************************/
  parameter PropulsionSystem.Records.ThermoFluidProperties fluid_1_des(fixed = false, HideResult = false, nX = Medium.nXi, nC = Medium.nC) annotation(
    HideResult=false);
  parameter PropulsionSystem.Records.ThermoFluidProperties fluid_2_des(fixed = false, HideResult = false, nX = Medium.nXi, nC = Medium.nC) annotation(
    HideResult=false);
  parameter PropulsionSystem.Records.RotationalMachineVariables flange_1_des(fixed = false, HideResult = false) annotation(
    HideResult=false);
  parameter PropulsionSystem.Records.RotationalMachineVariables flange_2_des(fixed = false, HideResult = false) annotation(
    HideResult=false);
  parameter PropulsionSystem.Records.CompressorVariables variablesDes(fixed = false, HideResult = false) annotation(
    HideResult=false);
  
//******************************************************************************************
initial algorithm
//******************************************************************************************
initial equation
//----------
  fluid_1_des.X[1:Medium.nXi] = fluid_1.Xi;
  fluid_1_des.C = port_1.C_outflow;
  fluid_1_des.h = fluid_1.h;
  fluid_1_des.s = s_fluid_1;
//----------
  flange_1_des.trq = flange_1.tau;
  flange_1_des.phi = flange_1.phi;
  flange_2_des.trq = flange_2.tau;
  flange_2_des.phi = flange_2.phi;

//----------
  flange_1_des.omega = omega;
  flange_1_des.pwr = flange_1.tau * omega;
  flange_1_des.Nmech = Nmech;
  flange_2_des.omega = omega;
  flange_2_des.pwr = flange_2.tau * omega;
  flange_2_des.Nmech = Nmech;
  
//----------
  variablesDes.PR = PR;
  variablesDes.eff = eff;
  fluid_2_des.m_flow = port_2.m_flow;
  fluid_2_des.p = fluid_2.p;
  variablesDes.h_2is = h_2is;
  variablesDes.dht_is = dht_is;
  variablesDes.dht = dht;
  fluid_2_des.h = fluid_2.h;
  fluid_2_des.X[1:Medium.nXi] = fluid_2.Xi;
  fluid_2_des.C = port_1.C_outflow;
  fluid_2_des.T = fluid_2.T;
  fluid_2_des.s = s_fluid_2;
//----------
  variablesDes.pwr = pwr;
  variablesDes.Nmech = Nmech;
  variablesDes.omega = omega;
  variablesDes.trq = trq;
//----------
  variablesDes.Nc_1 = Nc_1;
  variablesDes.phi = phi;
  variablesDes.pwr_inv = pwr_inv;
  variablesDes.trq_inv = trq_inv;
  variablesDes.Wc_1 = Wc_1;
//----------
    
//******************************************************************************************
equation

end TurbineBaseDefDesPt01;
