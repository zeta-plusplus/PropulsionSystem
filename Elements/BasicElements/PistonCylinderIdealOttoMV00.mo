within PropulsionSystem.Elements.BasicElements;

model PistonCylinderIdealOttoMV00
  /********************************************************
      imports
  ********************************************************/
  import Modelica.Constants;
  
  
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
  //--- port_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Temperature T1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = T1_init*1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 20*101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 500 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = T2_init*1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- fluidState_1 ---
  parameter Modelica.SIunits.Pressure p_state1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_1"));
  parameter Modelica.SIunits.Temperature T_state1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state1_init(displayUnit = "J/kg") = T_state1_init*1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_1"));
  //--- fluidState_2 ---
  parameter Modelica.SIunits.Pressure p_state2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_2"));
  parameter Modelica.SIunits.Temperature T_state2_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state2_init(displayUnit = "J/kg") = T_state1_init*1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_2"));
  //--- fluidState_3 ---
  parameter Modelica.SIunits.Pressure p_state3_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_3"));
  parameter Modelica.SIunits.Temperature T_state3_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_3"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state3_init(displayUnit = "J/kg") = T_state1_init*1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_3"));
  //--- fluidState_4 ---
  parameter Modelica.SIunits.Pressure p_state4_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_4"));
  parameter Modelica.SIunits.Temperature T_state4_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_4"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state4_init(displayUnit = "J/kg") = T_state1_init*1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_4"));
  //--- flange_1 ---
  parameter Modelica.SIunits.Torque tau1_init=0.1 "" annotation(
    Dialog(tab = "Initialization", group = "flange_1")
  );
  parameter Modelica.SIunits.Angle phi1_init=phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_1")
  );
  //--- flange_2 ---
  parameter Modelica.SIunits.Torque tau2_init=pwr_init/(Nmech_init*2.0*Modelica.Constants.pi/60.0) "" annotation(
    Dialog(tab = "Initialization", group = "flange_2")
  );
  parameter Modelica.SIunits.Angle phi2_init=phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_2")
  );
  //--- others ---
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech_init=3000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Power pwr_init=5.0*10.0^(5) "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Torque trq_init=pwr_init/(Nmech_init*2.0*Modelica.Constants.pi/60.0) "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  
  
  
  /* ---------------------------------------------
      Internal variables
  --------------------------------------------- */
  Modelica.SIunits.Power pwr(start=pwr_init) "power via shaft, positive if fluid generates power" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.Torque trq(start=trq_init) "trq via shaft" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  Modelica.SIunits.AngularVelocity omega(start=Nmech_init*2.0*Modelica.Constants.pi/60.0) "mechanical rotation speed, rad/sec" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.Angle phi(start=phi_init) "mechanical rotation displacement, rad" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech(start=Nmech_init) "mechanical rotation speed, rpm" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  Modelica.SIunits.Volume V_disp "displacement";
  Modelica.SIunits.Volume V_compressed "volume, fully compressed";
  Modelica.SIunits.Volume V_expanded "volume, fully expanded";
  
  Modelica.SIunits.VolumeFlowRate V_flow "volume flow rate through piston-cylinder";
  Modelica.SIunits.MassFlowRate m_flow "mass flow rate through piston-cylinder";
  
  Modelica.SIunits.Mass mass "";
  
  Real CR "Compression ratio";
  
  Modelica.SIunits.SpecificEnthalpy dht12(
    min=if(allowAbnormalOperation)then -Constants.inf else (0.0+1.0e-10)
  ) "specific enthalpy change in non-isentropic compression" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  Modelica.SIunits.SpecificEnthalpy dht34(
    min=if(allowAbnormalOperation)then -Constants.inf else (0.0+1.0e-10)
  ) "specific enthalpy change in non-isentropic compression" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
  /* ---------------------------------------------
      Internal objects
  --------------------------------------------- */
  Medium.BaseProperties fluidState_1(
    p(start = p_state1_init, min=0.0+1.0e-10), 
    T(start = T_state1_init, min=0.0+1.0e-10), 
    state.p(start = p_state1_init, min=0.0+1.0e-10), 
    state.T(start = T_state1_init, min=0.0+1.0e-10), 
    h(start = h_state1_init, min=0.0+1.0e-10)
  ) "fluid state 1";
  Medium.BaseProperties fluidState_2(
    p(start = p_state2_init, min=0.0+1.0e-10), 
    T(start = T_state2_init, min=0.0+1.0e-10), 
    state.p(start = p_state2_init, min=0.0+1.0e-10), 
    state.T(start = T_state2_init, min=0.0+1.0e-10), 
    h(start = h_state2_init, min=0.0+1.0e-10)
  ) "fluid state 2";
  Medium.BaseProperties fluidState_3(
    p(start = p_state3_init, min=0.0+1.0e-10), 
    T(start = T_state3_init, min=0.0+1.0e-10), 
    state.p(start = p_state3_init, min=0.0+1.0e-10), 
    state.T(start = T_state3_init, min=0.0+1.0e-10), 
    h(start = h_state3_init, min=0.0+1.0e-10)
  ) "fluid state 3";
  Medium.BaseProperties fluidState_4(
    p(start = p_state4_init, min=0.0+1.0e-10), 
    T(start = T_state4_init, min=0.0+1.0e-10), 
    state.p(start = p_state4_init, min=0.0+1.0e-10), 
    state.T(start = T_state4_init, min=0.0+1.0e-10), 
    h(start = h_state4_init, min=0.0+1.0e-10)
  ) "fluid state 4";
  
  
  
  /* ---------------------------------------------
      Interface
  --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_1(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow1_init, min=if (allowFlowReversal) then -Constants.inf else 0.0), 
    h_outflow(start = h1_init, min=0.0+1.0e-10), 
    p(start=p1_init, min=0.0+1.0e-10)
  ) "" annotation(
    Placement(visible = true, transformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_2(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow2_init, max=if allowFlowReversal then +Constants.inf else 0.0), 
    h_outflow(start = h2_init, min=0.0+1.0e-10), 
    p(start=p2_init, min=0.0+1.0e-10)
  ) "" annotation(
    Placement(visible = true, transformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1(
    tau(start=tau1_init), phi(start=phi1_init)
  ) "" annotation(
    Placement(visible = true, transformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_2(
    tau(start=tau2_init), phi(start=phi2_init)
  ) "" annotation(
    Placement(visible = true, transformation(origin = {100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

//******************************************************************************************
equation
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  //-- shaft --
  flange_1.phi = phi;
  flange_2.phi = phi;
  
  
  /* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  V_flow= 1.0/2.0*V_disp*Nmech*1.0/60.0;
  V_expanded= V_compressed + V_disp;
  CR= V_expanded/V_compressed;
  
  m_flow= fluidState_1.d*V_flow;
  mass= fluidState_1.d*V_expanded;
  
  //--- state1 <-> state2 ---
  fluidState_2.d= fluidState_1*CR;
  fluidState_2.h = Medium.isentropicEnthalpy(fluidState_2.p, fluidState_1.state);
  
  //--- state2 <-> state3 ---
  
  
  //--- state3 <-> state4 ---
  fluidState_3.d= fluidState_4*CR;
  
  //--- state4 <-> state1 ---
  
  
  
  trq = flange_1.tau + flange_2.tau;
  der(phi) = omega;
  omega * trq = pwr;
  Nmech = omega*60.0/(2.0*Modelica.Constants.pi);
  
  
  
annotation(
  defaultComponentName = "PistonCylinder",
  Icon(graphics = {Line(origin = {-2, 22}, points = {{-98, -102}, {102, -102}}, thickness = 6), Line(origin = {0, -0.23}, points = {{-60, -40}, {-60, 60}, {-60, 100}, {60, 100}, {60, 60}, {60, -40}}, thickness = 2), Rectangle(origin = {0, 15}, fillPattern = FillPattern.Solid, extent = {{-58, 7}, {58, -33}}), Line(origin = {13.78, -67.87}, points = {{-13.7819, 69.8688}, {32.2181, -40.1312}, {-13.7819, -12.1312}}, thickness = 3), Line(origin = {-40, 101}, points = {{0, 9}, {0, -11}}, thickness = 0.75), Line(origin = {-45.6153, 116.79}, points = {{12, -27}, {0, -27}}, thickness = 0.75), Line(origin = {40.3395, 101}, points = {{0, 9}, {0, -11}}, thickness = 0.75), Line(origin = {34.3847, 137.79}, points = {{12, -27}, {0, -27}}, thickness = 0.75), Line(origin = {-61, 110}, points = {{-39, 10}, {21, 10}, {21, -12}}, pattern = LinePattern.Dot, thickness = 1), Line(origin = {-51, 119.661}, points = {{151, 0}, {91, 0}, {91, -20}}, pattern = LinePattern.Dot, thickness = 1)}, coordinateSystem(extent = {{-100, -120}, {100, 120}})),
  __OpenModelica_commandLineOptions = "");

end PistonCylinderIdealOttoMV00;
