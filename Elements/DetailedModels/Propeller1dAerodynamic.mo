within PropulsionSystem.Elements.DetailedModels;

model Propeller1dAerodynamic
  extends PropulsionSystem.Interfaces.ElementFrames.ElementFrame_1FluidPort_2ShaftPorts;
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
  //parameter Modelica.SIunits.Angle xi_def(displayUnit = "deg") = 30.0 * Modelica.Constants.pi / 180 "angle of blade chord line" annotation(
  //  Dialog(group = "Geometry"));
  parameter Modelica.SIunits.Length rTip_1_def = 1.0 "tip radius of blade, LE" annotation(
    Dialog(group = "Geometry"));
  parameter Modelica.SIunits.Length rHub_1_def = 0.2 "tip radius of blade, LE" annotation(
    Dialog(group = "Geometry"));
  parameter Modelica.SIunits.Length rTip_2_def = 1.0 "tip radius of blade, TE" annotation(
    Dialog(group = "Geometry"));
  parameter Modelica.SIunits.Length rHub_2_def = 0.2 "tip radius of blade, TE" annotation(
    Dialog(group = "Geometry"));
  parameter Modelica.SIunits.Length lAxial_def = 0.1 "axial length of blade" annotation(
    Dialog(group = "Geometry"));
  parameter Modelica.SIunits.Area Sblade_def = (rTip_1_def - rHub_1_def + rTip_2_def - rHub_2_def) * lAxial_def * 1 / 2 "surface area of single blade" annotation(
    Dialog(group = "Geometry"));
  parameter Real numBlade_def = 4 "number of blades" annotation(
    Dialog(group = "Geometry"));
  //--- inner-connected, to AirfoilSimple ---
  inner parameter Real ClmaxDes = 1.5 "" annotation(
    Dialog(group = "Characteristics, airfoil"));
  inner parameter Modelica.SIunits.Angle alpha4Cl0des(displayUnit="deg")
   = 0.0 "" annotation(
    Dialog(group = "Characteristics, airfoil"));
  inner parameter Modelica.SIunits.Angle alpha4ClmaxDes(displayUnit="deg")
   = 15.0 * Modelica.Constants.pi / 180 "" annotation(
    Dialog(group = "Characteristics, airfoil"));
  inner parameter Modelica.SIunits.Angle alpha4ClminDes(displayUnit="deg")
   = -15.0 * Modelica.Constants.pi / 180 "" annotation(
    Dialog(group = "Characteristics, airfoil"));
  inner parameter Real CdfDes = 0.01 "" annotation(
    Dialog(group = "Characteristics, airfoil"));
  inner parameter Real alpha_CdpMinDes(displayUnit="deg")
   = 0.0 * Modelica.Constants.pi / 180 "" annotation(
    Dialog(group = "Characteristics, airfoil"));
  inner parameter Real kCdpDes = 0.2 "" annotation(
    Dialog(group = "Characteristics, airfoil"));
  inner parameter Real pwrCdpDes = 4.0 "" annotation(
    Dialog(group = "Characteristics, airfoil"));
  
  //********** Internal variables **********
  Modelica.SIunits.Length rMean "mean radius of blade";
  Modelica.SIunits.Length rTip_1 "tip radius, LE";
  Modelica.SIunits.Length rHub_1 "hub radius, LE";
  Modelica.SIunits.Length rTip_2 "tip radius, TE";
  Modelica.SIunits.Length rHub_2 "hub radius, TE";
  Modelica.SIunits.Length diamDisk_1;
  Modelica.SIunits.Length diamDisk_2;
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
  Modelica.SIunits.Velocity c1 "abs-V, LE";
  Modelica.SIunits.Velocity cx1 "axial-V, LE";
  Modelica.SIunits.Velocity cTheta1 "tangential component, abs-V, LE";
  Modelica.SIunits.Velocity w1(start=100.0) "rel-V, LE";
  Modelica.SIunits.Velocity wTheta1 "tangential component, rel-V, LE";
  Modelica.SIunits.Velocity c2 "abs-V, TE";
  Modelica.SIunits.Velocity cx2 "axial-V, TE";
  Modelica.SIunits.Velocity cTheta2 "tangential component, abs-V, TE";
  Modelica.SIunits.Velocity w2(start=100.0) "rel-V, TE";
  Modelica.SIunits.Velocity wTheta2 "tangential component, rel-V, TE";
  Modelica.SIunits.Velocity Umean "tangential velocity, mean r";
  Modelica.SIunits.Angle alpha1 "flow angle, abs, LE";
  Modelica.SIunits.Angle beta1 "flow angle, rel, LE";
  Modelica.SIunits.Angle phi1 "angle btwn rel-V and disk plane, LE";
  Modelica.SIunits.Angle alpha2 "flow angle, abs, TE";
  Modelica.SIunits.Angle beta2 "flow angle, rel, TE";
  Modelica.SIunits.Angle phi2 "angle btwn rel-V and disk plane, TE";
  Modelica.SIunits.Angle inci1 "incident angle(AoA for airfoil), LE";
  Modelica.SIunits.Angle xi "angle of blade chord line";
  //Modelica.SIunits.Angle epsiron2 "downwash angle, TE";
  //Modelica.SIunits.MassFlowRate m_flow_single "m_flow, single blade";
  Modelica.SIunits.MassFlowRate m_flow "m_flow, entire disk";
  
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
  Modelica.SIunits.Power pwrPropulsive "power of propulsion, =thrust*flowSpeed";
  Real FliftqFdrag "lift/drag of mean line blade";
  Real FaxqFtheta "axial-force/tangential force";
  Real effPropeller "propeller efficiency, =pwrPropulsive/pwr";
  //Modelica.SIunits.SpecificEnthalpy dht "rise in specific enthalpy across rotor";
  Modelica.SIunits.SpecificEnthalpy h_2 "";
  
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput u_flowSpeed "" annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_flowAngle "incoming flow angle" annotation(
    Placement(visible = true, transformation(origin = {-120, 50}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_bladeAngle "0 deg: chord alines with center line, 90 deg: chord alines with disk plane" annotation(
    Placement(visible = true, transformation(origin = {-30, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {50, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));  
  Modelica.Blocks.Interfaces.RealOutput y_Fg "thrust by propeller" annotation(
    Placement(visible = true, transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  //********** internal objects **********
  AircraftDynamics.Aerodynamics.BaseClasses.AirfoilSimple00 airfoilSimple001 annotation(
    Placement(visible = true, transformation(origin = {-30.25, 40.2}, extent = {{-49.75, -39.8}, {49.75, 39.8}}, rotation = 0)));
    
initial algorithm
  // NONE
  
algorithm
  //********** Geometries, defined by parameter **********
  rTip_1 := rTip_1_def;
  rHub_1 := rHub_1_def;
  rTip_2 := rTip_2_def;
  rHub_2 := rHub_2_def;
  lAxial := lAxial_def;
  Sblade := Sblade_def;
  numBlade := numBlade_def;
  
  //********** interface, input **********
  alpha1 := u_flowAngle;
  xi := u_bladeAngle;
  c1:= u_flowSpeed;
  
  //***** temporary *****
  m_flow:=port_1.m_flow;
  
  //********** geometry **********
  rMean := (rTip_1 + rHub_1 + rTip_2 + rHub_2) / 4.0;
  BR_1:= rHub_1 / rTip_1;
  BR_2:= rHub_2 / rTip_2;
  height_1:= rTip_1 - rHub_1;
  height_2:= rTip_2 - rHub_2;
  hBlade:= (height_1 + height_2) / 2;
  AR:= 2*hBlade / lAxial;
  diamDisk_1:= 2*rTip_1;
  diamDisk_2:= 2*rTip_2;
  AeffAx_1 := Modelica.Constants.pi * (rTip_1 ^ 2.0 - rHub_1 ^ 2.0);
  AeffAbs_1:= AeffAx_1/cos(alpha1);
  
  
  //********** velocities **********
  Umean:= rMean*omega;
  cx1:= cos(alpha1)*c1;
  cTheta1:= sqrt(c1^2.0-cx1^2.0);
  wTheta1:= Umean-cTheta1;
  w1:= sqrt(cx1^2.0+wTheta1^2.0);
  beta1:= acos(cx1/w1);
  inci1:= beta1 - xi;
  phi1:= Modelica.Constants.pi/2.0-beta1;
  
  
  //********** Forces **********
  FliftSingle:= CL * Sblade * 1.0 / 2.0 * fluid_1.d * w1 ^ 2.0;
  FdragSingle:= CD * Sblade * 1.0 / 2.0 * fluid_1.d * w1 ^ 2.0;
  FthetaSingle:= FliftSingle * sin(phi1) + FdragSingle * cos(phi1);
  FaxSingle:= FliftSingle * cos(phi1) - FdragSingle * sin(phi1);
  
  Flift := FliftSingle * numBlade;
  Fdrag := FdragSingle * numBlade;
  Ftheta := FthetaSingle * numBlade;
  Fax := FaxSingle * numBlade;
  
  
  
  //********** velocities **********
  cx2:= Fax/m_flow + cx1;
  cTheta2:= Ftheta/m_flow + cTheta1;
  
  wTheta2:= Umean -cTheta2;
  w2:=sqrt(cx2^2.0+wTheta2^2.0);
  
  beta2:= atan(wTheta2/cx2);
  /*
  beta2:= acos(cx2/w2);
  if(Modelica.Constants.pi/2.0<beta2)then
    beta2:= beta2-Modelica.Constants.pi;
  end if;
  */
  c2:=sqrt(cx2^2.0+cTheta2^2.0);
  alpha2:= acos(cx2/c2);
  phi2:= Modelica.Constants.pi/2.0-beta2;
  
  //********** component characteristics, etc **********
  trqSingle := FthetaSingle * rMean;
  pwrSingle := trqSingle * omega;
  trq := trqSingle * numBlade;
  pwr := pwrSingle * numBlade;
  
  pwrPropulsive:= Fax*c1;
  Nmech := Modelica.SIunits.Conversions.NonSIunits.to_rpm(omega);
  FliftqFdrag:= Flift/Fdrag;
  FaxqFtheta:= Fax/Ftheta;
  effPropeller:= pwrPropulsive/pwr;
  
  //********** interface, output **********
  y_Fg := Fax;
  //y_flowAngle := alpha2;
  
initial equation
  // NONE
  
equation
  //********** interface **********
  connect(inci1, airfoilSimple001.signalBus1.alpha) annotation(
    Line);
  CL = airfoilSimple001.signalBus2.Cl;
  CD = airfoilSimple001.signalBus2.Cd;
  
  //m_flow_single= port_1.m_flow/numBlade;
  
  //***** momentum conservation across rotor blade *****
  //Fax= m_flow*(cx2-cx1);
  //Ftheta= m_flow*(cTheta2-cTheta1);
  //Flift= m_flow * (w2 * sin(epsiron2));
  //Fdrag= m_flow * (w2 * cos(epsiron2) - w1);
  
  //-- energy conservation --
  trq = flange_1.tau + flange_2.tau;
  pwr= omega * trq;
  der(phi) = omega;
  pwr= m_flow*(h_2-fluid_1.h);
    
  
  annotation(
    Icon(graphics = {Rectangle(origin = {40, -2}, fillPattern = FillPattern.Solid, extent = {{-66, 6}, {52, -2}}), Polygon(origin = {-13, 46}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-3, 54}, {-7, -42}, {13, -42}, {9, 54}, {-3, 54}}), Line(origin = {-39.7738, -9.94116}, points = {{26, 10}, {-60, 10}}, pattern = LinePattern.Dot, thickness = 1.5), Line(origin = {98.77, -10.2247}, points = {{0, 10}, {-104, 10}}, pattern = LinePattern.Dot, thickness = 1.5), Polygon(origin = {-13, -58}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-7, 54}, {-3, -42}, {9, -42}, {13, 54}, {-7, 54}}), Ellipse(origin = {-22, 20}, pattern = LinePattern.DashDot, lineThickness = 0.5, extent = {{-20, 80}, {36, -120}}, endAngle = 360), Line(origin = {45.8, 54.8}, points = {{4.1963, 45.1963}, {4.1963, -34.8037}, {-45.8036, -50.8037}}, pattern = LinePattern.Dash, thickness = 1.5), Text(origin = {-70, 92}, extent = {{-20, 8}, {20, -12}}, textString = "Amb"), Text(origin = {74, 97}, extent = {{-14, 3}, {16, -17}}, textString = "pitch")}, coordinateSystem(initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
  
  
end Propeller1dAerodynamic;
