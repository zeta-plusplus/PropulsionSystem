within PropulsionSystem.BaseClasses.BasicElements;

partial model CompressorBase02
  /********************************************************
          imports
      ********************************************************/
  import units=Modelica.Units.SI;
  import unitsNonSI=Modelica.Units.NonSI;
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  import Streams = Modelica.Utilities.Streams;
  
  
  /********************************************************
          Declaration
      ********************************************************/
  /* ---------------------------------------------
          Package
      --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  /* ---------------------------------------------
          switch
      --------------------------------------------- */
  parameter Boolean allowAbnormalOperation = false "= true to allow compressor to operate as 'turbine' where PR<=1, false to restrict 1<PR" annotation(
    Dialog(tab = "Assumptions"),
    Evaluate = true);
  parameter Boolean allowFlowReversal = false "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)" annotation(
    Dialog(tab = "Assumptions"),
    Evaluate = true);
  parameter Boolean printCmd = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(tab = "debug setting"));
  /* ---------------------------------------------
          parameters
      --------------------------------------------- */
  //********** Initialization Parameters **********
  //--- fluid_1, port_1 ---
  parameter units.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.Pressure p1_init(displayUnit = "Pa") = 101.3*1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.Temperature T1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter units.SpecificEnthalpy h1_init(displayUnit = "J/kg") = T1_init*1.004*1000*288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- fluid_2, port_2 ---
  parameter units.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0*m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter units.Pressure p2_init(displayUnit = "Pa") = 20*101.3*1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter units.Temperature T2_init(displayUnit = "K") = 500 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter units.SpecificEnthalpy h2_init(displayUnit = "J/kg") = T2_init*1.004*1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- flange_1 ---
  parameter units.Torque tau1_init = 0.1 "" annotation(
    Dialog(tab = "Initialization", group = "flange_1"));
  parameter units.Angle phi1_init = phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_1"));
  //--- flange_2 ---
  parameter units.Torque tau2_init = pwr_init/(Nmech_init*2.0*Modelica.Constants.pi/60.0) "" annotation(
    Dialog(tab = "Initialization", group = "flange_2"));
  parameter units.Angle phi2_init = phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_2"));
  //--- others ---
  parameter Real PR_init = p2_init/p1_init "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Real eff_init = 0.8 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter unitsNonSI.AngularVelocity_rpm Nmech_init = 3000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.MassFlowRate Wc_1_init = m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter unitsNonSI.AngularVelocity_rpm Nc_1_init = Nmech_init "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.SpecificEnthalpy dht_init = 490000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.SpecificEnthalpy dht_is_init = 390000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Power pwr_init = 5.0*10.0^5 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Torque trq_init = pwr_init/(Nmech_init*2.0*Modelica.Constants.pi/60.0) "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.Angle phi_init = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.SpecificEntropy s_fluid_1_init = 6800.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter units.SpecificEntropy s_fluid_2_init = 7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  
  /* ---------------------------------------------
          Internal variables
      --------------------------------------------- */
  units.Power pwr(start = pwr_init) "power via shaft, positive if fluid generates power" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Torque trq(start = trq_init) "trq via shaft" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Power pwr_inv(start = -1.0*pwr_init) "power via shaft" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Torque trq_inv(start = -1.0*trq_init) "trq via shaft" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.AngularVelocity omega(start = Nmech_init*2.0*Modelica.Constants.pi/60.0) "mechanical rotation speed, rad/sec" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.Angle phi(start = phi_init) "mechanical rotation displacement, rad" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  unitsNonSI.AngularVelocity_rpm Nmech(start = Nmech_init) "mechanical rotation speed, rpm" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate Wc_1(start = Wc_1_init) "corrected mass flow rate" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  unitsNonSI.AngularVelocity_rpm Nc_1(start = Nc_1_init) "corrected rotation speed, rpm" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real PR(start = PR_init, min = if allowAbnormalOperation then 0.0 else 1.0 + 1.0e-10) "pressure ratio" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real eff(start = eff_init, min = 0.0, max = 1.0) "adiabatic efficiency" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.SpecificEnthalpy dht_is(start = dht_is_init, min = if allowAbnormalOperation then -Constants.inf else 0.0 + 1.0e-10) "specific enthalpy change in isentropic compression" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.SpecificEnthalpy dht(start = dht_init, min = if allowAbnormalOperation then -Constants.inf else 0.0 + 1.0e-10) "specific enthalpy change in non-isentropic compression" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.SpecificEnthalpy h_2is(start = h1_init + dht_is_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate m_flow_max(start = m_flow1_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.MassFlowRate m_flow_min(start = m_flow2_init) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.SpecificEntropy s_fluid_1(start = s_fluid_1_init) "specific entropy, fluid_1" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  units.SpecificEntropy s_fluid_2(start = s_fluid_2_init) "specific entropy, fluid_2" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  //********** flags **********
  Integer flagEffVal "0:0<eff<1, 1:eff<=0, 2:1<=eff";
  
  /* ---------------------------------------------
          Internal objects
      --------------------------------------------- */
  outer EngineSimEnvironment environment;

  Medium.BaseProperties fluid_1(p(start = p1_init, min = 0.0 + 1.0e-10), T(start = T1_init, min = 0.0 + 1.0e-10), state.p(start = p1_init, min = 0.0 + 1.0e-10), state.T(start = T1_init, min = 0.0 + 1.0e-10), h(start = h1_init, min = 0.0 + 1.0e-10)) "flow station of inlet";
  Medium.BaseProperties fluid_2(p(start = p2_init, min = 0.0 + 1.0e-10), T(start = T2_init, min = 0.0 + 1.0e-10), state.p(start = p2_init, min = 0.0 + 1.0e-10), state.T(start = T2_init, min = 0.0 + 1.0e-10), h(start = h2_init, min = 0.0 + 1.0e-10)) "flow station of outlet";
  
  /* ---------------------------------------------
          Interface
      --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(redeclare package Medium = Medium, m_flow(start = m_flow1_init, min = if allowFlowReversal then -Constants.inf else 0.0), h_outflow(start = h1_init, min = 0.0 + 1.0e-10), p(start = p1_init, min = 0.0 + 1.0e-10)) "" annotation(
    Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-62, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(redeclare package Medium = Medium, m_flow(start = m_flow2_init, max = if allowFlowReversal then +Constants.inf else 0.0), h_outflow(start = h2_init, min = 0.0 + 1.0e-10), p(start = p2_init, min = 0.0 + 1.0e-10)) "" annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {58, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1(tau(start = tau1_init), phi(start = phi1_init)) "" annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_2(tau(start = tau2_init), phi(start = phi2_init)) "" annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /**/
  PropulsionSystem.Types.ElementBus infoBus1 annotation(
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  //******************************************************************************************
protected
//******************************************************************************************
initial algorithm
//******************************************************************************************
initial equation
//******************************************************************************************
algorithm
  if printCmd == true then
    assert(PR < 0.0, getInstanceName() + ", PR got less than 0" + ", fluid_1.p=" + String(fluid_1.p) + ", fluid_2.p=" + String(fluid_2.p), AssertionLevel.warning);
  end if;
//******************************************************************************************
equation
  if printCmd == true then
    assert(fluid_1.p <= 0.0, getInstanceName() + ", fluid_1.p=" + String(fluid_1.p), AssertionLevel.warning);
    assert(fluid_2.p <= 0.0, getInstanceName() + ", fluid_2.p=" + String(fluid_2.p), AssertionLevel.warning);
  end if;
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
  m_flow_min = min(port_1.m_flow, port_2.m_flow);
  if allowFlowReversal == false then
    port_1.h_outflow = fluid_1.h;
    port_1.Xi_outflow = fluid_1.Xi;
  else
    if m_flow_max == port_1.m_flow then
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
    elseif m_flow_max == port_2.m_flow then
      port_2.h_outflow = fluid_2.h;
      port_2.Xi_outflow = fluid_2.Xi;
    else
      port_1.h_outflow = fluid_1.h;
      port_1.Xi_outflow = fluid_1.Xi;
    end if;
  end if;
//-- shaft --
  flange_1.phi = phi;
  flange_2.phi = phi;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  Wc_1 = port_1.m_flow*sqrt(fluid_1.T/environment.Tstd)/(fluid_1.p/environment.pStd);
  Nc_1 = Nmech/sqrt(fluid_1.T/environment.Tstd);
  PR = fluid_2.p/fluid_1.p;
  h_2is = Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  dht_is = h_2is - fluid_1.h;
  dht = fluid_2.h - fluid_1.h;
  if 0 < dht then
    eff = dht_is/dht;
    if eff < 1 then
      flagEffVal = 0;
    else
      flagEffVal = 2;
    end if;
  else
    eff = 0.0;
    flagEffVal = 1;
  end if;
  port_1.m_flow + port_2.m_flow = 0.0;
  fluid_2.Xi = fluid_1.Xi;
  trq = flange_1.tau + flange_2.tau;
  pwr = -1.0*(port_1.m_flow*fluid_1.h + port_2.m_flow*fluid_2.h);
  omega*trq = pwr;
  Nmech = omega*60.0/(2.0*Modelica.Constants.pi);
  pwr_inv = -1*pwr;
  trq_inv = -1*trq;
  s_fluid_1 = Medium.specificEntropy(fluid_1.state);
  s_fluid_2 = Medium.specificEntropy(fluid_2.state);
  
  der(phi) = omega;
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Cmp",
    Icon(graphics = {Polygon(origin = {2, 36}, fillColor = {2, 154, 255}, fillPattern = FillPattern.HorizontalCylinder, points = {{-62, -38}, {-62, -116}, {58, -56}, {58, -16}, {-62, 44}, {-62, -38}}), Rectangle(origin = {-89, 6}, fillPattern = FillPattern.Solid, extent = {{-11, 4}, {29, -16}}), Rectangle(origin = {83, 2}, fillPattern = FillPattern.Solid, extent = {{-23, 8}, {17, -12}}), Rectangle(origin = {63, 86}, rotation = 180, fillColor = {184, 184, 184}, fillPattern = FillPattern.Solid, extent = {{3, 66}, {7, 4}}), Text(origin = {-68, 123}, extent = {{-32, 1}, {168, -19}}, textString = "%name")}, coordinateSystem(initialScale = 0.1, extent = {{-100, -100}, {100, 100}})),
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
end CompressorBase02;
