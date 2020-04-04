within PropulsionSystem.BaseClasses.BasicElements;

partial model CompressorBase00
  /********************************************************
      imports
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  
  
  /********************************************************
      Declaration
  ********************************************************/
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
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Temperature T1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = 1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  
  
  /* ---------------------------------------------
      Internal variables
  --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  
  Medium.BaseProperties fluid_1(p.start = p1_init, T.start = T1_init, state.p.start = p1_init, state.T.start = T1_init, h.start = h1_init) "flow station of inlet";
  Medium.BaseProperties fluid_2(p.start = p2_init, T.start = T2_init, state.p.start = p2_init, state.T.start = T2_init, h.start = h2_init) "flow station of outlet";
  
  Modelica.SIunits.SpecificEntropy s_fluid_1 "specific entropy, fluid_1";
  Modelica.SIunits.SpecificEntropy s_fluid_2 "specific entropy, fluid_2";
  
  Modelica.SIunits.Power pwr "power via shaft, positive if fluid generates power";
  Modelica.SIunits.Torque trq "trq via shaft";
  Modelica.SIunits.Power pwr_inv "power via shaft";
  Modelica.SIunits.Torque trq_inv "trq via shaft";
  
  Modelica.SIunits.AngularVelocity omega "mechanical rotation speed, rad/sec";
  Modelica.SIunits.Angle phi "mechanical rotation displacement, rad";
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech "mechanical rotation speed, rpm";
  
  Modelica.SIunits.MassFlowRate Wc_1 "corrected mass flow rate";
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nc_1 "corrected rotation speed, rpm";
  Real PR "pressure ratio";
  Real eff "adiabatic efficiency";
  Modelica.SIunits.SpecificEnthalpy dht_is "specific enthalpy change in isentropic compression";
  Modelica.SIunits.SpecificEnthalpy dht "specific enthalpy change in non-isentropic compression";
  Modelica.SIunits.SpecificEnthalpy h_2is "";
  
  Modelica.SIunits.MassFlowRate m_flow_max;
  Modelica.SIunits.MassFlowRate m_flow_min;
  //********** Design point variables **********
  Modelica.SIunits.MassFlowRate m_flow_des_1;
  Modelica.SIunits.Pressure pDes_1;
  Modelica.SIunits.Temperature Tdes_1;
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NmechDes "mechanical rotation speed, rpm";
  inner Modelica.SIunits.MassFlowRate WcDes_1 "corrected mass flow rate";
  inner Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NcDes_1;
  Real PRdes;
  Real effDes;
  //********** variables relative to design point **********
  inner Real NcqNcDes_1 "ratio of corrected rotational speed with respect to design pt. speed";
  Real NqNdes "ratio of mech. rotational speed with respect to design pt. speed";
  
  
  /* ---------------------------------------------
      Interface
  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1
  (
    redeclare package Medium = Medium, m_flow(start = m_flow1_init), h_outflow.start = h1_init
  ) "" annotation(
    Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2
  (
    redeclare package Medium = Medium, m_flow(start = m_flow2_init), h_outflow.start = h2_init
  ) "" annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1 "" annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-98, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_2 "" annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
algorithm
  assert(PR < 0.0, getInstanceName() + ", PR got less than 0" + ", fluid_1.p=" + String(fluid_1.p) + ", fluid_2.p=" + String(fluid_2.p), AssertionLevel.warning);
  
equation
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
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
  
  if(m_flow_max == port_1.m_flow)then
    port_1.h_outflow= fluid_1.h;
  elseif(m_flow_max == port_2.m_flow)then
    port_2.h_outflow= fluid_2.h;
  else
    port_1.h_outflow= fluid_1.h;
  end if;
//-- shaft --
  flange_1.phi = phi;
  flange_2.phi = phi;
  
  
  /* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  Wc_1 = port_1.m_flow * sqrt(fluid_1.T / environment.Tstd) / (fluid_1.p / environment.pStd);
  Nc_1 = Nmech / sqrt(fluid_1.T / environment.Tstd);
  
  PR = fluid_2.p / fluid_1.p;
  
  h_2is = Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  dht_is = h_2is - fluid_1.h;
  eff = dht_is / dht;
  dht = fluid_2.h - fluid_1.h;
  
  port_1.m_flow + port_2.m_flow = 0.0;
  fluid_2.Xi = fluid_1.Xi;
  
  trq = flange_1.tau + flange_2.tau;
  pwr = -1.0 * (port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h);
  der(phi) = omega;
  omega * trq = pwr;
  Nmech = Modelica.SIunits.Conversions.NonSIunits.to_rpm(omega);
  
  pwr_inv= -1*pwr;
  trq_inv= -1*trq;
  
  s_fluid_1= Medium.specificEntropy(fluid_1.state);
  s_fluid_2= Medium.specificEntropy(fluid_2.state);
//-- Design point variables --
  NcDes_1 = NmechDes / sqrt(Tdes_1 / environment.Tstd);
  WcDes_1 = m_flow_des_1 * sqrt(Tdes_1 / environment.Tstd) / (pDes_1 / environment.pStd);
//-- variables relative to design point --
  NqNdes = Nmech / NmechDes;
  NcqNcDes_1 = Nc_1 / NcDes_1;
  
  
/********************************************************
  Graphics
********************************************************/
  
  annotation(
    defaultComponentName="Cmp",
    Icon(graphics = {Polygon(origin = {2, 36}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, points = {{-62, -38}, {-62, -116}, {58, -56}, {58, -16}, {-62, 44}, {-62, -38}}), Rectangle(origin = {-89, 6}, fillPattern = FillPattern.Solid, extent = {{-11, 4}, {29, -16}}), Rectangle(origin = {83, 2}, fillPattern = FillPattern.Solid, extent = {{-23, 8}, {17, -12}}), Rectangle(origin = {63, 86}, rotation = 180, fillColor = {184, 184, 184}, fillPattern = FillPattern.Solid, extent = {{3, 66}, {7, 4}}), Rectangle(origin = {-94, 77}, rotation = 90, fillColor = {184, 184, 184}, fillPattern = FillPattern.Solid, extent = {{1, 6}, {5, -36}}), Rectangle(origin = {82, 75}, rotation = 90, fillColor = {184, 184, 184}, fillPattern = FillPattern.Solid, extent = {{3, 26}, {7, -18}}), Text(origin = {-54, 99}, fillPattern = FillPattern.Solid, extent = {{-26, 1}, {134, -19}}, textString = "%name"), Text(origin = {-52, 11}, fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-8, 9}, {112, -31}}, textString = "Cmp")}, coordinateSystem(initialScale = 0.1)),
  Documentation(info = "<html>
  <a href=modelica://PropulsionSystem/docs/BaseClasses/BasicElements/CompressorBase00.html> Document html page</a>
  
  <h4>example/demo models</h4>
    <p> -> none, because this class partial </p>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>
    
  <h4>classes which extends this component </h4>
    <ul>
    <li> <a href=modelica://PropulsionSystem.Elements.BasicElements.CompressorDesPt00> PropulsionSystem.Elements.BasicElements.CompressorDesPt00 </a> </li>
    </ul>
  

</html>"));
  
end CompressorBase00;
