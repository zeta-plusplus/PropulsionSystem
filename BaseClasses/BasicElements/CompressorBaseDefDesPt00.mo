within PropulsionSystem.BaseClasses.BasicElements;

partial model CompressorBaseDefDesPt00
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
  
  discrete PropulsionSystem.Records.RotationalMachineVariables flange_1_des(
    fixed=false,
    HideResult=false
  ) annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  discrete PropulsionSystem.Records.RotationalMachineVariables flange_2_des(
    fixed=false,
    HideResult=false
  ) annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  discrete PropulsionSystem.Records.CompressorVariables variablesDes(
    fixed=false,
    HideResult=false
  ) annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
  
//******************************************************************************************
initial algorithm
  

//******************************************************************************************
initial equation
  /* ---------------------------------------------
    design point eqn
  --------------------------------------------- */
  //----------
  fluid_1_des.X[1:Medium.nXi]= fluid_1.Xi;
  fluid_1_des.C= port_1.C_outflow;
  fluid_1_des.h= fluid_1.h;
  fluid_1_des.s= s_fluid_1;
  //----------
  flange_1_des.trq= flange_1.tau;
  flange_1_des.phi= flange_1.phi;
  flange_2_des.trq= flange_2.tau;
  flange_2_des.phi= flange_2.phi;
  //----------
  flange_1_des.omega= omega;
  flange_1_des.pwr= flange_1.tau*omega;
  flange_1_des.Nmech= Nmech;
  flange_2_des.omega= omega;
  flange_2_des.pwr= flange_2.tau*omega;
  flange_2_des.Nmech= Nmech;
  //----------
  variablesDes.PR=PR;
  variablesDes.eff=eff;
  fluid_2_des.m_flow= port_2.m_flow;
  fluid_2_des.p= fluid_2.p;
  variablesDes.h_2is= h_2is;
  variablesDes.dht_is= dht_is;
  variablesDes.dht= dht;
  fluid_2_des.h= fluid_2.h;
  fluid_2_des.X[1:Medium.nXi]= fluid_2.Xi;
  fluid_2_des.C= port_2.C_outflow;
  fluid_2_des.T= fluid_2.T;
  fluid_2_des.s= s_fluid_2;
  //----------
  variablesDes.pwr= pwr;
  variablesDes.Nmech= NmechDes;
  variablesDes.omega= omega;
  variablesDes.trq= trq;
  Wc_1_des= port_1.m_flow * sqrt(fluid_1.T / environment.Tstd) / (fluid_1.p / environment.pStd);
  Nc_1_des= NmechDes / sqrt(fluid_1.T / environment.Tstd);
  //----------
  variablesDes.Nc_1= Nc_1;
  variablesDes.phi= phi;
  variablesDes.pwr_inv= pwr_inv;
  variablesDes.trq_inv= trq_inv;
  variablesDes.Wc_1= Wc_1;
  //----------
  
   
//******************************************************************************************
equation
  
  when (time<=environment.timeRemoveDesConstraint)then
    /* ---------------------------------------------
      design point eqn
    --------------------------------------------- */
    //----------
    fluid_1_des.X[1:Medium.nXi]= fluid_1.Xi;
    fluid_1_des.C= port_1.C_outflow;
    fluid_1_des.h= fluid_1.h;
    fluid_1_des.s= s_fluid_1;
    //----------
    flange_1_des.trq= flange_1.tau;
    flange_1_des.phi= flange_1.phi;
    flange_2_des.trq= flange_2.tau;
    flange_2_des.phi= flange_2.phi;
    //----------
    flange_1_des.omega= omega;
    flange_1_des.pwr= flange_1.tau*omega;
    flange_1_des.Nmech= Nmech;
    flange_2_des.omega= omega;
    flange_2_des.pwr= flange_2.tau*omega;
    flange_2_des.Nmech= Nmech;
    //----------
    variablesDes.PR=PRdes;
    variablesDes.eff=effDes;
    fluid_2_des.m_flow= port_2.m_flow;
    fluid_2_des.p= fluid_2.p;
    variablesDes.h_2is= h_2is;
    variablesDes.dht_is= dht_is;
    variablesDes.dht= dht;
    fluid_2_des.h= fluid_2.h;
    fluid_2_des.X[1:Medium.nXi]= fluid_2.Xi;
    fluid_2_des.C= port_2.C_outflow;
    fluid_2_des.T= fluid_2.T;
    fluid_2_des.s= s_fluid_2;
    //----------
    variablesDes.pwr= pwr;
    variablesDes.Nmech= NmechDes;
    variablesDes.omega= omega;
    variablesDes.trq= trq;
    //----------
    variablesDes.Nc_1= Nc_1;
    variablesDes.phi= phi;
    variablesDes.pwr_inv= pwr_inv;
    variablesDes.trq_inv= trq_inv;
    variablesDes.Wc_1= Wc_1;
    //----------
  end when;
  
  when {(time<=environment.timeRemoveDesConstraint)}then
    Wc_1_des = fluid_1_des.m_flow * sqrt(fluid_1_des.T / environment.Tstd) / (fluid_1_des.p / environment.pStd);
    Nc_1_des = NmechDes / sqrt(fluid_1_des.T / environment.Tstd);
  end when;
  
end CompressorBaseDefDesPt00;
