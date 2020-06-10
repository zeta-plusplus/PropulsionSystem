within PropulsionSystem.BaseClasses.BasicElements;

partial model NozzleBase00
  /********************************************************
        imports
  ********************************************************/
  import Modelica.Constants;
  import Modelica.Utilities.Streams;
  import PropulsionSystem.Types.switches;
  
  /********************************************************
               Declaration
  ********************************************************/
  /* ---------------------------------------------
      Type definitions
        only valid in this class
  --------------------------------------------- */
  type switchDefineFg=enumeration(
                      FullyExpandedFlow "Fg:= m_flow*V2",
                      ThroatFlowAndPressure "Fg:= m_flow*V_th +A*(p_th - p2) "
                      );
  
  
  /* ---------------------------------------------
      switch
  --------------------------------------------- */
  parameter Boolean allowFlowReversal= false
    "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)"
    annotation(
      Dialog(tab="Assumptions"), Evaluate=true);
  parameter switchDefineFg switch_defineFg
    =switchDefineFg.FullyExpandedFlow
    "definition of Fg. influence on Cv definition"
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  
  parameter Boolean printCmd = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(tab = "debug setting"));
  
  
  /* ---------------------------------------------
      Package
  --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  
  
  
  
  
  /* ---------------------------------------------
      parameters
  --------------------------------------------- */
  //********** Initialization Parameters **********
  //--- fluid_1, port_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = PR_init*p2_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Temperature T1_init(displayUnit = "K") = 500 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = T1_init*1.004 * 1000  "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 300 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = T2_init* 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- others ---
  parameter Real PR_init=2.5 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Real Cv_init=0.99 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Real CdTh_init=0.99 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Real MNth_init=1.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Velocity V_2is_init=480.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Velocity V_2_init=Cv_init*V_2is_init "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Velocity V_th_choked_init=410.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Velocity V_th_fullExp_init=V_2_init "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Velocity V_th_init=V_th_choked_init "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.SpecificEnthalpy h_2is_init=h1_init-1.0/2.0*V_2is_init^2.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Force Fg_init=m_flow1_init*V_2_init "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Area AeTh_init=0.0014*m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Area AmechTh_init=AeTh_init/CdTh_init "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  
  parameter Modelica.SIunits.SpecificEntropy s_fluid_1_init=7100.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.SpecificEntropy s_fluid_2_init=7200.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  
  
  
  
  
  
  /* ---------------------------------------------
      Internal variables
  --------------------------------------------- */
  Modelica.SIunits.SpecificEntropy s_fluid_1(start=s_fluid_1_init) "specific entropy, fluid_1" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.SpecificEntropy s_fluid_2(start=s_fluid_2_init) "specific entropy, fluid_2" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.SpecificEntropy s_fluid_th(start=s_fluid_2_init) "specific entropy, fluid_th" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.SpecificEntropy s_fluid_2Tot(start=s_fluid_2_init) "specific entropy, fluid_2Tot" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  Modelica.SIunits.MassFlowRate m_flow_max(start=m_flow1_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.MassFlowRate m_flow_min(start=m_flow2_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  Modelica.SIunits.Velocity V_2(start=V_2_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.Velocity V_2is(start=V_2is_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real PR(
    start=PR_init,
    min=if (allowFlowReversal) then -Constants.inf else (0.0+1.0e-10)
  ) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real CdTh(start=CdTh_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real Cv(start=Cv_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.SpecificEnthalpy h_2is(start=h_2is_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.Force Fg(start=Fg_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  //-throat-
  Modelica.SIunits.MassFlowRate m_flow_th(
    start=m_flow1_init,
    min=if (allowFlowReversal) then -Constants.inf else (0.0+1.0e-10)
  ) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.Area AmechTh(start=AmechTh_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.Area AeTh(start=AeTh_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.Velocity V_th(
    start=V_th_init,
    min=if (allowFlowReversal) then -Constants.inf else (0.0+1.0e-10)
  ) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real MNth(start=MNth_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  //--full expansion--
  Modelica.SIunits.Velocity V_th_fullExp(
    start=V_th_fullExp_init,
    min=if (allowFlowReversal) then -Constants.inf else (0.0+1.0e-10)
  ) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  //--choked--
  Modelica.SIunits.Velocity V_th_choked(
    start=V_th_choked_init,
    min=if (allowFlowReversal) then -Constants.inf else (0.0+1.0e-10)
  ) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  //********** variables of design point **********
  discrete Real PRdes(start=PR_init) annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  discrete Real CdThDes(start=CdTh_init) annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  discrete Real CvDes(start=Cv_init) annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  discrete PropulsionSystem.Records.ThermoFluidProperties fluid_1_des(
    fixed=false,
    HideResult=false,
    nX=Medium.nX,
    nC=Medium.nC,
    m_flow(start=m_flow1_init),
    p(start=p1_init),
    T(start=T1_init),
    h(start=h1_init),
    s(start=s_fluid_1_init)
  ) annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
  /* ---------------------------------------------
      Internal objects
  --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  
  Medium.BaseProperties fluid_1(
    p(start = p1_init, min=0.0+1.0e-10), 
    T(start = T1_init, min=0.0+1.0e-10), 
    state.p(start = p1_init, min=0.0+1.0e-10), 
    state.T(start = T1_init, min=0.0+1.0e-10), 
    h(start = h1_init, min=0.0+1.0e-10)
  ) "flow station of inlet";
  Medium.BaseProperties fluid_2(
    p(start = p2_init, min=0.0+1.0e-10), 
    T(start = T2_init, min=0.0+1.0e-10), 
    state.p(start = p2_init, min=0.0+1.0e-10), 
    state.T(start = T2_init, min=0.0+1.0e-10), 
    h(start = h2_init, min=0.0+1.0e-10)
  ) "flow station of outlet (ambient)";
  Medium.BaseProperties fluid_2Tot(
    p(start = p1_init, min=0.0+1.0e-10), 
    T(start = T1_init, min=0.0+1.0e-10), 
    state.p(start = p1_init, min=0.0+1.0e-10), 
    state.T(start = T1_init, min=0.0+1.0e-10), 
    h(start = h1_init, min=0.0+1.0e-10)
  ) "flow station of outlet, total";
  Medium.BaseProperties fluidStat_th(
    p(start = p2_init, min=0.0+1.0e-10), 
    T(start = T2_init, min=0.0+1.0e-10), 
    state.p(start = p2_init, min=0.0+1.0e-10), 
    state.T(start = T2_init, min=0.0+1.0e-10), 
    h(start = h2_init, min=0.0+1.0e-10)
  ) "static flow station of throat";
  Medium.BaseProperties fluid_th(
    p(start = p1_init, min=0.0+1.0e-10), 
    T(start = T1_init, min=0.0+1.0e-10), 
    state.p(start = p1_init, min=0.0+1.0e-10), 
    state.T(start = T1_init, min=0.0+1.0e-10), 
    h(start = h1_init, min=0.0+1.0e-10)
  ) "flow station of throat";
  Medium.BaseProperties fluidStat_th_fullExp(
    p(start = p1_init, min=0.0+1.0e-10), 
    T(start = T1_init, min=0.0+1.0e-10), 
    state.p(start = p1_init, min=0.0+1.0e-10), 
    state.T(start = T1_init, min=0.0+1.0e-10), 
    h(start = h1_init, min=0.0+1.0e-10)
  ) "";
  Medium.BaseProperties fluidStat_th_choked(
    p(start = p1_init, min=0.0+1.0e-10), 
    T(start = T1_init, min=0.0+1.0e-10), 
    state.p(start = p1_init, min=0.0+1.0e-10), 
    state.T(start = T1_init, min=0.0+1.0e-10), 
    h(start = h1_init, min=0.0+1.0e-10)
  ) "";
  
  
  
  /* ---------------------------------------------
      Interface
  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow1_init, min=if (allowFlowReversal) then -Constants.inf else 0.0), 
    h_outflow(start = h1_init, min=0.0+1.0e-10), 
    p(start=p1_init, min=0.0+1.0e-10)
  ) "" annotation(
    Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow2_init, max=if allowFlowReversal then +Constants.inf else 0.0), 
    h_outflow(start = h2_init, min=0.0+1.0e-10), 
    p(start=p2_init, min=0.0+1.0e-10)
  ) "" annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Interfaces.RealOutput y_Fg(quantity="Force", unit="N",displayUnit="N") "[N], gross thrust by nozzle" annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 2.9976e-15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
protected
  /* ---------------------------------------------
          Non-modifiable parameters
  --------------------------------------------- */
  /*
  parameter Real PRdes(fixed=false, start=PR_init) annotation(
    HideResult=false);
  parameter Real CdThDes(fixed=false, start=CdTh_init) annotation(
    HideResult=false);
  parameter Real CvDes(fixed=false, start=Cv_init) annotation(
    HideResult=false);
  
  parameter PropulsionSystem.Records.ThermoFluidProperties fluid_1_des(
    fixed=false,
    HideResult=false,
    nX=Medium.nX,
    nC=Medium.nC
  );
  
  */
  
  parameter Modelica.SIunits.MassFlowRate m_flow_des_1(fixed=false, start=m_flow1_init) annotation(
    HideResult=false);
  parameter Modelica.SIunits.Pressure pDes_1(fixed=false, start=p1_init) annotation(
    HideResult=false);
  parameter Modelica.SIunits.Temperature Tdes_1(fixed=false, start=T1_init) annotation(
    HideResult=false);
  
  parameter Modelica.SIunits.Area AeThDes(fixed=false, start=AeTh_init) annotation(
    HideResult=false);
  parameter Modelica.SIunits.Area AmechThDes(fixed=false, start=AmechTh_init) annotation(
    HideResult=false);
  
  
  parameter PropulsionSystem.Records.ThermoFluidProperties fluid_2_des(
    fixed=false,
    HideResult=false,
    nX=Medium.nX,
    nC=Medium.nC
  );
  
  
initial equation
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  AeThDes= AmechTh*CdThDes;
  //----------
  fluid_1_des.X= fluid_1.Xi;
  fluid_1_des.C= actualStream(port_1.C_outflow);
  fluid_1_des.h= Medium.specificEnthalpy(Medium.setState_pTX(fluid_1_des.p, fluid_1_des.T, fluid_1_des.X));
  fluid_1_des.s= Medium.specificEntropy(Medium.setState_pTX(fluid_1_des.p, fluid_1_des.T, fluid_1_des.X));
  
  
algorithm
  if(printCmd==true)then
    assert(fluid_1.h < fluidStat_th_fullExp.h, getInstanceName()+", nozzle inverse flow condition, fluid_1.h < fluidStat_th_fullExp.h" + "\n" + ", fluid_1.h=" + String(fluid_1.h) + ", fluidStat_th_fullExp.h=" + String(fluidStat_th_fullExp.h), AssertionLevel.warning);
  end if;
  
equation
  
  if(printCmd==true)then
    assert(fluid_1.p <= 0.0, getInstanceName()+", fluid_1.p="+String(fluid_1.p), AssertionLevel.warning);
    assert(fluid_2.p <= 0.0, getInstanceName()+", fluid_2.p="+String(fluid_2.p), AssertionLevel.warning);
    assert(fluid_2Tot.p <= 0.0, getInstanceName()+", fluid_2Tot.p="+String(fluid_2Tot.p), AssertionLevel.warning);
    assert(fluidStat_th.p <= 0.0, getInstanceName()+", fluidStat_th.p="+String(fluidStat_th.p), AssertionLevel.warning);
    assert(fluid_th.p <= 0.0, getInstanceName()+", fluid_th.p="+String(fluid_th.p), AssertionLevel.warning);
    assert(fluidStat_th_fullExp.p <= 0.0, getInstanceName()+", fluidStat_th_fullExp.p="+String(fluidStat_th_fullExp.p), AssertionLevel.warning);
    assert(fluidStat_th_choked.p <= 0.0, getInstanceName()+", fluidStat_th_choked.p="+String(fluidStat_th_choked.p), AssertionLevel.warning);
  end if;
    
  /* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  y_Fg = Fg;
//-- fluidPort_1 --
  fluid_1.p = port_1.p;
  fluid_1.h = actualStream(port_1.h_outflow);
  fluid_1.Xi = actualStream(port_1.Xi_outflow);
//-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h = actualStream(port_2.h_outflow);
  fluid_2.Xi = actualStream(port_2.Xi_outflow);
// distinguish inlet side
  m_flow_max = max(port_1.m_flow, port_2.m_flow);
  m_flow_min= min(port_1.m_flow, port_2.m_flow);
  
  
  if(allowFlowReversal==false)then
    port_1.h_outflow= fluid_1.h;
    port_1.Xi_outflow= fluid_1.Xi;  
  else
    if(m_flow_max == port_1.m_flow)then
      port_1.h_outflow= fluid_1.h;
      port_1.Xi_outflow= fluid_1.Xi;
    elseif(m_flow_max == port_2.m_flow)then
      port_2.h_outflow= fluid_2.h;
      port_2.Xi_outflow= fluid_2.Xi;
    else
      port_1.h_outflow= fluid_1.h;
      port_1.Xi_outflow= fluid_1.Xi;
    end if;
  end if;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
    
    
  fluid_2Tot.Xi= fluid_1.Xi;
  fluidStat_th.Xi= fluid_1.Xi;
  fluid_th.Xi= fluid_1.Xi;
  fluidStat_th_fullExp.Xi= fluid_1.Xi;
  fluidStat_th_choked.Xi= fluid_1.Xi;
    
    
  fluid_2Tot.p = fluid_1.p;
//-- energy conservation --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2Tot.h = 0;
  
  PR = fluid_1.p / fluid_2.p;
//-- full expansion --
  fluid_1.h = h_2is + sign(V_2is) * abs(V_2is) ^ 2.0 * (1.0 / 2.0);
  h_2is = Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  V_2 = Cv * V_2is;
  fluid_1.h = fluid_2.h + sign(V_2) * abs(V_2) ^ 2.0 / 2.0;
//--- throat, p, T ---
  fluid_th.p = fluid_1.p;
  fluid_th.h = fluid_1.h;
//--- throat, static, p, T ---
  fluidStat_th_fullExp.p = fluid_2.p;
  fluidStat_th_choked.p = fluid_2.p;
//V_th_fullExp= sqrt( 2.0*(fluid_1.h - fluidStat_th_fullExp.h ) );
  fluid_1.h - fluidStat_th_fullExp.h = 1.0 / 2.0 * (sign(V_th_fullExp) * abs(V_th_fullExp) ^ 2.0);
//--- velocity if choked state ---
  V_th_choked = 1.0 * Medium.velocityOfSound(fluidStat_th_choked.state);
  fluidStat_th_choked.h = fluid_1.h - 1.0 / 2.0 * (sign(V_th_choked) * abs(V_th_choked) ^ 2.0);
//--- throat fully-expanded ---
  fluidStat_th_fullExp.h = Medium.isentropicEnthalpy(fluidStat_th_fullExp.p, fluid_1.state);
/*--------------------
  evaluate choked or not
  --------------------*/
  if V_th_fullExp >= V_th_choked then
    V_th = V_th_choked;
//case of choked
  else
    V_th = V_th_fullExp;
//case of unchoked
  end if;
//--- throat state ---
  MNth = V_th / Medium.velocityOfSound(fluidStat_th.state);
  fluidStat_th.h = fluid_1.h - 1.0 / 2.0 * (sign(V_th) * abs(V_th) ^ 2.0);
  fluidStat_th.h = Medium.isentropicEnthalpy(fluidStat_th.p, fluid_1.state);
  m_flow_th = fluid_th.d * V_th * AeTh;
  m_flow_th = port_1.m_flow;
  AeTh = AmechTh * CdTh;
  
  s_fluid_1= Medium.specificEntropy(fluid_1.state);
  s_fluid_2= Medium.specificEntropy(fluid_2.state);
  s_fluid_th= Medium.specificEntropy(fluid_th.state);
  s_fluid_2Tot= Medium.specificEntropy(fluid_2Tot.state);
  
  
  /*--------------------
  performance variables
  --------------------*/
  if (switch_defineFg == switchDefineFg.FullyExpandedFlow) then
    Fg = (-1) * port_2.m_flow * V_2;
  elseif (switch_defineFg == switchDefineFg.ThroatFlowAndPressure) then
    Fg = Cv*V_th*m_flow_th + (fluidStat_th.p - fluid_2.p) * AeTh;
  end if;
  
  when (time<=environment.timeRemoveDesConstraint)then
    /* ---------------------------------------------
    design point eqn
    --------------------------------------------- */
    PRdes= PR;
    //----------
    fluid_1_des.X= fluid_1.Xi;
    fluid_1_des.C= actualStream(port_1.C_outflow);
    fluid_1_des.h= Medium.specificEnthalpy(Medium.setState_pTX(fluid_1_des.p, fluid_1_des.T, fluid_1_des.X));
    fluid_1_des.s= Medium.specificEntropy(Medium.setState_pTX(fluid_1_des.p, fluid_1_des.T, fluid_1_des.X));
    //----------
    
  end when;
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    Icon(graphics = {Polygon(origin = {0, 10}, fillColor = {255, 250, 80}, fillPattern = FillPattern.HorizontalCylinder, points = {{-80, 70}, {-80, -90}, {60, -50}, {60, 30}, {-80, 70}}), Text(origin = {-74, 108}, extent = {{-26, -8}, {154, -28}}, textString = "%name"), Rectangle(origin = {-94, 80}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-6, 2}, {14, -2}}), Text(origin = {72, 77}, extent = {{-16, 1}, {20, -23}}, textString = "amb"), Line(origin = {81.88, 37.0395}, points = {{-23, 2}, {17, 2}, {17, 42}}, pattern = LinePattern.Dot, thickness = 0.5), Text(origin = {-58, 22}, extent = {{-22, -2}, {78, -42}}, textString = "Nzl")}, coordinateSystem(initialScale = 0.1)));
  
  
end NozzleBase00;
