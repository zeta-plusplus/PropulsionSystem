within PropulsionSystem.BaseClasses.BasicElements;

partial model NozzleBaseDefDesPt00
  /********************************************************
      Declaration
  ********************************************************/
  discrete PropulsionSystem.Records.ThermoFluidProperties fluid_1_des(
    fixed=false,
    HideResult=false,
    nX=Medium.nXi,
    nC=Medium.nC,
    m_flow(start=m_flow1_init),
    p(start=p1_init),
    T(start=T1_init),
    h(start=h1_init),
    s(start=s_fluid_1_init)
  ) annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  discrete PropulsionSystem.Records.ThermoFluidProperties fluid_2_des(
    fixed=false,
    HideResult=false,
    nX=Medium.nXi,
    nC=Medium.nC,
    m_flow(start=m_flow2_init),
    p(start=p2_init),
    T(start=T2_init),
    h(start=h2_init),
    s(start=s_fluid_2_init)
  ) annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  discrete Modelica.SIunits.Area AeThDes(start=AeTh_init) annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  discrete Modelica.SIunits.Area AmechThDes(start=AmechTh_init) annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
  
  
//******************************************************************************************
initial algorithm
  

//******************************************************************************************
initial equation
  
  //----------
  fluid_1_des.X[1:Medium.nXi]= fluid_1.Xi;
  fluid_1_des.C= actualStream(port_1.C_outflow);
  fluid_1_des.h= Medium.specificEnthalpy(Medium.setState_pTX(fluid_1_des.p, fluid_1_des.T, fluid_1_des.X[1:Medium.nXi]));
  fluid_1_des.s= Medium.specificEntropy(Medium.setState_pTX(fluid_1_des.p, fluid_1_des.T, fluid_1_des.X[1:Medium.nXi]));
  //----------
  fluid_2_des.m_flow= port_2.m_flow;
  fluid_2_des.p= fluid_2.p;
  fluid_2_des.T= fluid_2.T;
  fluid_2_des.X[1:Medium.nXi]= fluid_2.Xi;
  fluid_2_des.C= actualStream(port_2.C_outflow);
  fluid_2_des.h= Medium.specificEnthalpy(Medium.setState_pTX(fluid_2_des.p, fluid_2_des.T, fluid_2_des.X[1:Medium.nXi]));
  fluid_2_des.s= Medium.specificEntropy(Medium.setState_pTX(fluid_2_des.p, fluid_2_des.T, fluid_2_des.X[1:Medium.nXi]));
  //----------
  
//******************************************************************************************
equation
  
  when (time<=environment.timeRemoveDesConstraint)then
    
    //----------
    fluid_1_des.X[1:Medium.nXi]= fluid_1.Xi;
    fluid_1_des.C= actualStream(port_1.C_outflow);
    fluid_1_des.h= Medium.specificEnthalpy(Medium.setState_pTX(fluid_1_des.p, fluid_1_des.T, fluid_1_des.X[1:Medium.nXi]));
    fluid_1_des.s= Medium.specificEntropy(Medium.setState_pTX(fluid_1_des.p, fluid_1_des.T, fluid_1_des.X[1:Medium.nXi]));
    //----------
    fluid_2_des.m_flow= port_2.m_flow;
    fluid_2_des.p= fluid_2.p;
    fluid_2_des.T= fluid_2.T;
    fluid_2_des.X[1:Medium.nXi]= fluid_2.Xi;
    fluid_2_des.C= actualStream(port_2.C_outflow);
    fluid_2_des.h= Medium.specificEnthalpy(Medium.setState_pTX(fluid_2_des.p, fluid_2_des.T, fluid_2_des.X[1:Medium.nXi]));
    fluid_2_des.s= Medium.specificEntropy(Medium.setState_pTX(fluid_2_des.p, fluid_2_des.T, fluid_2_des.X[1:Medium.nXi]));
    //----------
    
  end when;
  
  
end NozzleBaseDefDesPt00;
