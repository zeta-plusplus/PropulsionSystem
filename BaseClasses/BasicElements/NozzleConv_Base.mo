within PropulsionSystem.BaseClasses.BasicElements;

partial model NozzleConv_Base
  extends PropulsionSystem.Interfaces.ElementFrames.ElementFrame_2FluidPorts;
  
  
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  
  
  /********************************************************
                 Declaration
  ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Type definitions, only valid in this class **********
  type switch_Nozzle_Subelement = enumeration(
                                NoSubelement "",
                                curve_PR ""
                                )
                                annotation(
    Documentation(info = "<html>
    </html>"));
  
  type switch_calcFg=enumeration(
                      FullyExpandedFlow "",
                      NozzleExitFlow ""
                      )
                      annotation(
    Documentation(info = "<html>
    </html>"));
  //********** Parameters **********
  //----- switches -----
  parameter switch_calcFg switchCalc_Fg
    =switch_calcFg.NozzleExitFlow
    ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  //********** Internal variables **********
  Medium.BaseProperties fluid_2Tot
  (
    p.start= p2Tot_init, T.start= T2Tot_init,
    state.p.start= p2Tot_init, state.T.start= T2Tot_init,
    h.start= h2Tot_init
  )
    "flow station of outlet, total";
    
  Modelica.SIunits.Velocity V_2(start = 10);
  Modelica.SIunits.Velocity V_2is(start = 10);
  Real PR(start = 2.0);
  Real CdTh(start = CdThDes);
  Real Cv(start = CvDes);
  Modelica.SIunits.SpecificEnthalpy h_2is "";
  Modelica.SIunits.Force Fg "";
  //-----
  //-throat-
  Modelica.SIunits.MassFlowRate dmTh(start=0.0);
  Modelica.SIunits.Area Amech_th;
  Modelica.SIunits.Area AeTh;
  Modelica.SIunits.Velocity V_th(start= 0.0);
  Real MNth;
  Medium.BaseProperties fluidStat_th
  (
    p.start= pStat_th_init, T.start= TStat_th_init,
    state.p.start= pStat_th_init, state.T.start= TStat_th_init,
    h.start= hStat_th_init
  )
    "static flow station of throat";
  
  Medium.BaseProperties fluid_th
  (
    p.start= p_th_init, T.start= T_th_init,
    state.p.start= p_th_init, state.T.start= T_th_init,
    h.start= h_th_init
  )
    "flow station of throat";
  //-----
  //--full expansion--
  Modelica.SIunits.Velocity V_th_fullExp(start=0.0);
  Medium.BaseProperties fluidStat_th_fullExp
  (
    p.start= pStat_th_fullExp_init, T.start= TStat_th_fullExp_init,
    state.p.start= pStat_th_fullExp_init, state.T.start= TStat_th_fullExp_init, 
    h.start= hStat_th_fullExp_init
  )
    "";
  //--choked states--
  Modelica.SIunits.Velocity V_th_choked(start=0.0);
  Medium.BaseProperties fluidStat_th_choked
  (
    p.start= pStat_th_choked_init, T.start= TStat_th_choked_init,
    state.p.start= pStat_th_choked_init, state.T.start= TStat_th_choked_init,
    h.start= hStat_th_choked_init
  )
    "";
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealOutput Fg_out annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {50, 2.9976e-15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********** Initialization Parameters **********
  //--- fluid_2Tot ---
  parameter Modelica.SIunits.Pressure p2Tot_init(displayUnit="Pa")= p1_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.Temperature T2Tot_init(displayUnit="K")= T1_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
    
  parameter Modelica.SIunits.SpecificEnthalpy h2Tot_init(displayUnit="J/kg")= h1_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  //--- fluidStat_th ---
  parameter Modelica.SIunits.Pressure pStat_th_init(displayUnit="Pa")= p2_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.Temperature TStat_th_init(displayUnit="K")= T2_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
    
  parameter Modelica.SIunits.SpecificEnthalpy hStat_th_init(displayUnit="J/kg")= h2_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  //--- fluidStat_th_fullExp ---
  parameter Modelica.SIunits.Pressure pStat_th_fullExp_init(displayUnit="Pa")= p2_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.Temperature TStat_th_fullExp_init(displayUnit="K")= T2_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
    
  parameter Modelica.SIunits.SpecificEnthalpy hStat_th_fullExp_init(displayUnit="J/kg")= h2_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  //--- fluidStat_th_choked ---
  parameter Modelica.SIunits.Pressure pStat_th_choked_init(displayUnit="Pa")= p2_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.Temperature TStat_th_choked_init(displayUnit="K")= T2_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
    
  parameter Modelica.SIunits.SpecificEnthalpy hStat_th_choked_init(displayUnit="J/kg")= h2_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  //--- fluid_th ---
  parameter Modelica.SIunits.Pressure p_th_init(displayUnit="Pa")= p1_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.Temperature T_th_init(displayUnit="K")= T1_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
    
  parameter Modelica.SIunits.SpecificEnthalpy h_th_init(displayUnit="J/kg")= h1_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  

equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
  Fg_out = Fg;
//********** Eqns describing physics **********
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
  
  fluid_2Tot.p = fluid_1.p;
  PR = fluid_1.p / fluid_2.p;
//-- full expansion --
  fluid_1.h = h_2is + sign(V_2is) * abs(V_2is) ^ 2.0 * (1.0 / 2.0);
  
  h_2is = Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  
  V_2 = Cv * V_2is;
  fluid_1.h = fluid_2.h + (sign(V_2)*abs(V_2)^2.0) / 2.0;
//-- energy conservation --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2Tot.h = 0;
//--- throat, p, T ---
  fluid_th.p = fluid_1.p;
  fluid_th.h= fluid_1.h;
//--- throat, static, p, T ---
  fluidStat_th_fullExp.p = fluid_2.p;
  fluidStat_th_choked.p= fluid_2.p;
/*
  //--- fully-expanded ---
  fluidStat_th_fullExp.h = Medium.isentropicEnthalpy(fluidStat_th_fullExp.p, fluid_1.state);
  */
//V_th_fullExp= sqrt( 2.0*(fluid_1.h - fluidStat_th_fullExp.h ) );
  fluid_1.h - fluidStat_th_fullExp.h = 1.0 / 2.0 * (sign(V_th_fullExp) * abs(V_th_fullExp) ^ 2.0);
//--- velocity if choked state ---
  V_th_choked = 1.0 * Medium.velocityOfSound(fluidStat_th_choked.state);
  fluidStat_th_choked.h= fluid_1.h - 1.0/2.0 * (sign(V_th_choked)*abs(V_th_choked)^(2.0));
//evaluate choked or not
  if V_th_fullExp >= V_th_choked then
//--- case of choked ---
    V_th = V_th_choked;
  else
//--- case of unchoked ---
    V_th = V_th_fullExp;
  end if;
//--- throat state ---
  MNth = V_th / Medium.velocityOfSound(fluidStat_th.state);
  fluidStat_th.h= fluid_1.h - 1.0/2.0 * (sign(V_th)*abs(V_th)^(2.0));
  
  
  fluidStat_th.h= Medium.isentropicEnthalpy(fluidStat_th.p, fluid_1.state);
  
  
  dmTh= fluid_th.d*V_th*AeTh;
  dmTh= abs(port_1.m_flow);
  AeTh= Amech_th*CdTh;
//-- performance characteristics --
  if switchCalc_Fg == switch_calcFg.FullyExpandedFlow then
    Fg = (-1) * port_2.m_flow * V_2;
  elseif switchCalc_Fg == switch_calcFg.NozzleExitFlow then
    Fg = Cv * V_th * dmTh + (fluidStat_th.p - fluid_2.p) * AeTh;
  end if;
//********** reinit invalid state variables **********
  
  when fluidStat_th_fullExp.p <= 0.0 then
    reinit(fluidStat_th_fullExp.p, -1.0 * fluidStat_th_fullExp.p);
  end when;
  
  when(fluidStat_th.p<=0.0)then
    reinit(fluidStat_th.p, -1.0*fluidStat_th.p);
  end when;
  
    
algorithm
  
  assert(fluid_1.h < fluidStat_th_fullExp.h, 
      "nozzle inverse flow condition, fluid_1.h < fluidStat_th_fullExp.h"+"\n"
      +", fluid_1.h="+String(fluid_1.h)+", fluidStat_th_fullExp.h="+String(fluidStat_th_fullExp.h),
      AssertionLevel.warning);
  
  /*
  //--- isentropic expansion ---
  if((0.0<=fluid_2.p)and(0.0<=fluid_1.state.p))then
    
    h_2is:= Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
    
  elseif((fluid_2.p<0.0)and(fluid_1.state.p<0.0))then
    
    h_2is:= Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
    
  else
    h_2is:= Medium.isentropicEnthalpy(-1.0*fluid_2.p, fluid_1.state);
  end if;
  */
//--- throat fully-expanded ---
  if((0.0<fluidStat_th_fullExp.p)and(0.0<fluid_1.state.p))then
    
    fluidStat_th_fullExp.h:= Medium.isentropicEnthalpy(fluidStat_th_fullExp.p, fluid_1.state);
    
  elseif((fluidStat_th_fullExp.p<0.0)and(fluid_1.state.p<0.0))then
    
    fluidStat_th_fullExp.h:= Medium.isentropicEnthalpy(fluidStat_th_fullExp.p, fluid_1.state);
    
  else
    fluidStat_th_fullExp.h:= Medium.isentropicEnthalpy(-1.0*fluidStat_th_fullExp.p, fluid_1.state);
  end if;
  
  /*
  //--- throat ---
  if((0.0<fluidStat_th.p)and(0.0<fluid_1.state.p))then
    
    fluidStat_th.h:= Medium.isentropicEnthalpy(fluidStat_th.p, fluid_1.state);
    
  elseif((fluidStat_th.p<0.0)and(fluid_1.state.p<0.0))then
    
    fluidStat_th.h:= Medium.isentropicEnthalpy(fluidStat_th.p, fluid_1.state);
    
  else
    fluidStat_th.h:= Medium.isentropicEnthalpy(-1.0*fluidStat_th.p, fluid_1.state);
  end if;
  */
  
  
initial equation
  port_1.m_flow=dmTh;
    
initial algorithm
//##### none #####
/********************************************************
  Graphics
********************************************************/
  annotation(
    Icon(graphics = {Polygon(origin = {0, 10}, fillColor = {255, 221, 96}, fillPattern = FillPattern.Solid, points = {{-80, 70}, {-80, -90}, {60, -50}, {60, 30}, {-80, 70}}), Text(origin = {-54, 108}, extent = {{-26, -8}, {134, -28}}, textString = "%name"), Rectangle(origin = {-94, 80}, fillColor = {112, 112, 112}, fillPattern = FillPattern.Solid, extent = {{-6, 2}, {14, -2}}), Text(origin = {88, 53}, extent = {{-16, 11}, {8, 1}}, textString = "*static"), Line(origin = {81.88, 37.0395}, points = {{-23, 2}, {17, 2}, {17, 42}}, pattern = LinePattern.Dot, thickness = 0.5), Text(origin = {-58, 22}, extent = {{-22, -2}, {78, -42}}, textString = "Nzl"),
    
    Rectangle(lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, lineThickness = 4, extent = {{-100, 100}, {100, -100}}), Line(points = {{-100, 100}, {100, -100}}, color = {255, 0, 0}, thickness = 4)}, 
    
    coordinateSystem(initialScale = 0.1)));

  
end NozzleConv_Base;
