within PropulsionSystem.Elements.DetailedModels;

model AxCmpRotor_meanLine
  extends PropulsionSystem.Interfaces.ElementFrames.ElementFrame_2FluidPorts_2ShaftPorts;
  
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  
  
  /********************************************************
    Declaration
  ********************************************************/
  //********** Package **********
  //##### none #####
  
  
  //********** Type definitions, only valid in this class **********
  //##### none #####
  
  
  //********** Parameters **********
  parameter Modelica.SIunits.Angle xi_def(displayUnit="deg")= 30.0*Modelica.Constants.pi/180
    "angle of blade chord line"
    annotation(
    Dialog(group = "Geometry"));
    
  parameter Modelica.SIunits.Length rTip_1_def= 2.0
    "tip radius of blade, LE"
    annotation(
    Dialog(group = "Geometry"));
    
  parameter Modelica.SIunits.Length rHub_1_def= 0.5
    "tip radius of blade, LE"
    annotation(
    Dialog(group = "Geometry"));
  
  parameter Modelica.SIunits.Length rTip_2_def= 2.0
    "tip radius of blade, TE"
    annotation(
    Dialog(group = "Geometry"));
    
  parameter Modelica.SIunits.Length rHub_2_def= 0.5
    "tip radius of blade, TE"
    annotation(
    Dialog(group = "Geometry"));
  
  parameter Modelica.SIunits.Length lAxial_def= 0.2
    "axial length of blade"
    annotation(
    Dialog(group = "Geometry"));
  
  parameter Modelica.SIunits.Area Sblade_def= ((rTip_1_def-rHub_1_def) + (rTip_2_def-rHub_2_def))*lAxial_def*1/2
    "surface area of single blade"
    annotation(
    Dialog(group = "Geometry"));
  
  parameter Real numBlade_def=30
    "number of blades"
    annotation(
    Dialog(group = "Geometry"));
  
  
  //********** Initialization Parameters **********
  //--- fluidStat_1 ---
  parameter Modelica.SIunits.Pressure pStat_1_init(displayUnit="Pa")= p1_init "" annotation(
    Dialog(tab="Initialization", group="fluidStat_1"));
  parameter Modelica.SIunits.Temperature TStat_1_init(displayUnit="K")= T1_init "" annotation(
    Dialog(tab="Initialization", group="fluidStat_1"));
  parameter Modelica.SIunits.SpecificEnthalpy hStat_1_init(displayUnit="J/kg")= h1_init "" annotation(
    Dialog(tab="Initialization", group="fluidStat_1"));
  
  //--- fluidStat_2 ---
  parameter Modelica.SIunits.Pressure pStat_2_init(displayUnit="Pa")= p2_init "" annotation(
    Dialog(tab="Initialization", group="fluidStat_2"));
  parameter Modelica.SIunits.Temperature TStat_2_init(displayUnit="K")= T2_init "" annotation(
    Dialog(tab="Initialization", group="fluidStat_2"));
  parameter Modelica.SIunits.SpecificEnthalpy hStat_2_init(displayUnit="J/kg")= h2_init "" annotation(
    Dialog(tab="Initialization", group="fluidStat_2"));
  
  
  //********** Internal variables **********
  Modelica.SIunits.Length rMean "mean radius of blade";
  Modelica.SIunits.Length rTip_1 "tip radius, LE";
  Modelica.SIunits.Length rHub_1 "hub radius, LE";
  Modelica.SIunits.Length rTip_2 "tip radius, TE";
  Modelica.SIunits.Length rHub_2 "hub radius, TE";
  Modelica.SIunits.Length lAxial "axial length of blade";
  Modelica.SIunits.Length height_1 "blade height, LE";
  Modelica.SIunits.Length height_2 "blade height, TE";
  Modelica.SIunits.Length hBlade "blade height, avg";
  Modelica.SIunits.Area Sblade "surface area of single blade";
  
  Real AR "aspect ratio";
  Real BR_1 "boss ratio, leading";
  Real BR_2 "boss ratio, trailing edge";
  Real numBlade "num. of blades";
  
  Modelica.SIunits.Area AeffAx_1 "mech. area, flow cross section, axial, LE";
  Modelica.SIunits.Area AeffAbs_1 "mech. area, flow cross section, abs, LE";
  Modelica.SIunits.Area AeffAx_2 "mech. area, flow cross section, axial, TE";
  Modelica.SIunits.Area AeffAbs_2 "mech. area, flow cross section, abs, TE";
  
  Real MnAx_1 "mach, axial, LE";
  Real MnAbs_1 "mach, absolute, LE";
  Real MnRel_1 "mach, relative, LE";
  
  Real MnAx_2 "mach, axial, TE";
  Real MnAbs_2 "mach, absolute, TE";
  Real MnRel_2 "mach, relative, TE";
  
  Modelica.SIunits.Velocity c1 "abs-V, LE";
  Modelica.SIunits.Velocity cx1 "axial-V, LE";
  Modelica.SIunits.Velocity cTheta1 "tangential component, abs-V, LE";
  Modelica.SIunits.Velocity w1 "rel-V, LE";
  Modelica.SIunits.Velocity wTheta1 "tangential component, rel-V, LE";
  
  Modelica.SIunits.Velocity c2 "abs-V, TE";
  Modelica.SIunits.Velocity cx2 "axial-V, TE";
  Modelica.SIunits.Velocity cTheta2 "tangential component, abs-V, TE";
  Modelica.SIunits.Velocity w2 "rel-V, TE";
  Modelica.SIunits.Velocity wTheta2 "tangential component, rel-V, TE";
  
  Modelica.SIunits.Velocity Umean "tangential velocity, mean r";
  Modelica.SIunits.Velocity Vsound_1 "sound speed, LE";
  Modelica.SIunits.Velocity Vsound_2 "sound speed, TE";
    
  Modelica.SIunits.Angle alpha1 "flow angle, abs, LE";
  Modelica.SIunits.Angle beta1 "flow angle, rel, LE";
  Modelica.SIunits.Angle phi1 "angle btwn rel-V and disk plane, LE";
  Modelica.SIunits.Angle inci1 "incident angle(AoA for airfoil), LE";
  
  Modelica.SIunits.Angle alpha2 "flow angle, abs, TE";
  Modelica.SIunits.Angle beta2 "flow angle, rel, TE";
  Modelica.SIunits.Angle phi2 "angle btwn rel-V and disk plane, TE";
  
  Modelica.SIunits.Angle xi "angle of blade chord line";
  Modelica.SIunits.Angle epsiron2 "downwash angle, TE";
  
  Modelica.SIunits.MassFlowRate m_flow_single "m_flow, single blade";
  
  Real CL "lift coefficient";
  Real CD "drag coefficient";
  
  Modelica.SIunits.Force FthetaSingle "aero-force, tangential direction, single blade";
  Modelica.SIunits.Force FaxSingle "aero-force, axial direction, single blade";
  Modelica.SIunits.Force FliftSingle "lift, single blade";
  Modelica.SIunits.Force FdragSingle "drag, single blade";
  
  Modelica.SIunits.Force Ftheta "aero-force, tangential direction, total of blades";
  Modelica.SIunits.Force Fax "aero-force, axial direction, total of blades";
  Modelica.SIunits.Force Flift "lift, total of blades";
  Modelica.SIunits.Force Fdrag "drag, total of blades";
  
  Modelica.SIunits.Torque trqSingle "torque, by single blade";
  Modelica.SIunits.Power pwrSingle "power, by single blade";
  Modelica.SIunits.SpecificEnthalpy dht "rise in specific enthalpy across rotor";
  
  Medium.BaseProperties fluidStat_1
  (
    p.start= pStat_1_init,
    T.start= TStat_1_init,
    state.p.start= pStat_1_init,
    state.T.start= TStat_1_init,
    h.start= hStat_1_init
  )
    "static flow station, 1";
    
  Medium.BaseProperties fluidStat_2
  (
    p.start= pStat_2_init,
    T.start= TStat_2_init,
    state.p.start= pStat_2_init,
    state.T.start= TStat_2_init,
    h.start= hStat_2_init
  )
    "static flow station, 2";
  
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput u_flowAngle "incoming flow angle"annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_flowAngle "exiting flow angle" annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  //********** internal objects **********
  AircraftDynamics.Aerodynamics.BaseClasses.AirfoilSimple00 airfoilSimple001 annotation(
    Placement(visible = true, transformation(origin = {-10.25, 20.2}, extent = {{-49.75, -39.8}, {49.75, 39.8}}, rotation = 0)));
  
  
initial algorithm
  
algorithm
  //********** Geometries **********
  xi:= xi_def;
  rTip_1:= rTip_1_def;
  rHub_1:= rHub_1_def;
  rTip_2:= rTip_2_def;
  rHub_2:= rHub_2_def;
  lAxial:= lAxial_def;
  Sblade:= Sblade_def;
  numBlade:= numBlade_def;
  
  //********** interface **********
  alpha1:= u_flowAngle;
  m_flow_single:= port_1.m_flow/numBlade;
  y_flowAngle:= alpha2;
  
  //********** others **********
  Flift:= FliftSingle*numBlade;
  Fdrag:= FdragSingle*numBlade;
  Ftheta:= FthetaSingle*numBlade;
  Fax:= FaxSingle*numBlade;
  
initial equation
  //********** Geometries **********
  //xi.start= xi_def;
  
  
equation
  //********** interface **********
  connect(inci1, airfoilSimple001.signalBus1.alpha) annotation(
    Line);
  CL= airfoilSimple001.signalBus2.Cl;
  CD= airfoilSimple001.signalBus2.Cd;
  
  //********** Geometries **********
  rMean= (rTip_1 + rHub_1 + rTip_2 + rHub_2)/4.0;
  BR_1= rHub_1/rTip_1;
  BR_2= rHub_2/rTip_2;
  height_1= rTip_1 - rHub_1;
  height_2= rTip_2 - rHub_2;
  hBlade= (height_1+height_2)/2;
  AR= hBlade/lAxial;
  
  AeffAx_1= Modelica.Constants.pi*((rTip_1)^2.0 - (rHub_1)^2.0);
  AeffAx_2= Modelica.Constants.pi*((rTip_2)^2.0 - (rHub_2)^2.0);  
  AeffAx_1= AeffAbs_1*cos(alpha1);
  AeffAx_2= AeffAbs_2*cos(alpha2);
  
  //********** eqns describing physics **********
  //***** velocity triangle, LE *****
  cx1= cos(alpha1)*c1;
  (c1)^2.0= (cx1)^2.0 + (cTheta1)^2.0;
  wTheta1= Umean - cTheta1;
  (w1)^2.0= (cx1)^2.0 + (wTheta1)^2.0;
  cx1= w1*cos(beta1);
  beta1= xi+ inci1;
  phi1 + beta1= Modelica.Constants.pi/2.0;
  
  //***** velocity triangle, TE *****
  beta2 + epsiron2= beta1;
  cx2= w2*cos(beta2);
  (w2)^2.0= (cx2)^2.0 + (wTheta2)^2.0;
  cTheta2= Umean - wTheta2;
  (c2)^2.0= (cx2)^2.0 + (cTheta2)^2.0;
  cx2= c2*cos(alpha2);
  phi2 + beta2= Modelica.Constants.pi/2.0;
  
  //***** momentum conservation across rotor blade *****
  FliftSingle= CL*Sblade*1.0/2.0*fluidStat_1.d*(w1)^2.0;
  FdragSingle= CD*Sblade*1.0/2.0*fluidStat_1.d*(w1)^2.0;
  
  FliftSingle= m_flow_single*(w2*sin(epsiron2));
  FdragSingle= m_flow_single*(w2*cos(epsiron2)-w1);
  
  //***** forces *****
  FthetaSingle= FliftSingle*sin(phi1) + FdragSingle*cos(phi1);
  FaxSingle= FliftSingle*cos(phi1) - FdragSingle*sin(phi1);
  
  //***** flow station, LE (st.1) *****
  fluid_1.h= fluidStat_1.h + 1.0/2.0*(sign(c1)*abs(c1)^(2.0));
  fluidStat_1.h= Medium.isentropicEnthalpy(fluidStat_1.p, fluid_1.state);
  Vsound_1= Medium.velocityOfSound(fluidStat_1.state);
  port_1.m_flow= fluid_1.d*c1*AeffAbs_1;
  
  //***** flow station, TE (st.2) *****
  fluid_2.h= fluidStat_2.h + 1.0/2.0*(sign(c2)*abs(c2)^(2.0));
  fluidStat_2.h= Medium.isentropicEnthalpy(fluidStat_2.p, fluid_2.state);
  Vsound_2= Medium.velocityOfSound(fluidStat_2.state);
  port_1.m_flow= fluid_2.d*c2*AeffAbs_2;
  
  //***** mach numbers *****
  cx1= MnAx_1*Vsound_1;
  c1= MnAbs_1*Vsound_1;
  w1= MnRel_1*Vsound_1;
  cx2= MnAx_2*Vsound_2;
  c2= MnAbs_2*Vsound_2;
  w2= MnRel_2*Vsound_2;
  
  //***** performance *****
  dht= fluid_2.h - fluid_1.h;
  trqSingle= FthetaSingle*rMean;
  pwrSingle= trqSingle*omega;
  trq= trqSingle*numBlade;
  pwr= pwrSingle*numBlade;
  
  //-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0.0;
  fluid_2.Xi= fluid_1.Xi;
  
  //-- energy conservation --
  trq = flange_1.tau + flange_2.tau;
  pwr= -1.0*((port_1.m_flow * fluid_1.h) + (port_2.m_flow * fluid_2.h));
  der(phi)= omega;
  omega*trq= pwr;
  Nmech= Modelica.SIunits.Conversions.NonSIunits.to_rpm(omega);
  
  
annotation(
    Icon(graphics = {Rectangle(origin = {52, -2}, fillPattern = FillPattern.Solid, extent = {{-92, 6}, {-12, -2}}), Polygon(origin = {-1, 46}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-11, 54}, {-11, -26}, {11, -22}, {11, 48}, {-11, 54}}), Line(origin = {-39.7738, -9.94116}, points = {{0, 10}, {-60, 10}}, pattern = LinePattern.Dot, thickness = 1.5), Line(origin = {98.77, -10.2247}, points = {{0, 10}, {-60, 10}}, pattern = LinePattern.Dot, thickness = 1.5), Rectangle(origin = {-2, 10}, fillPattern = FillPattern.Solid, extent = {{-4, 12}, {6, -10}})}, coordinateSystem(initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");

end AxCmpRotor_meanLine;
