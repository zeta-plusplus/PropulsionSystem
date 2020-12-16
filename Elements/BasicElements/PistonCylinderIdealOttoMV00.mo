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
            switch
        --------------------------------------------- */
  parameter Boolean allowFlowReversal= false
    "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)"
    annotation(
      Dialog(tab="Assumptions"), Evaluate=true);
  
  
  /* ---------------------------------------------
            parameters
        --------------------------------------------- */
  parameter Real CR_paramInput = 10.0 "compression ratio";
  parameter Modelica.SIunits.Volume VolDisp_paramInput = 100.0 * 10.0 ^ (-6.0) "displacement";
  parameter Modelica.SIunits.SpecificEnthalpy LHV_fuel_paramInput = 43.4 * 10.0 ^ 6.0 "lower heating value of fuel";
  //********** Initialization Parameters **********
  //--- port_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Pressure p1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.Temperature T1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit = "J/kg") = T1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_1"));
  //--- port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit = "kg/s") = -1.0 * m_flow1_init "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Pressure p2_init(displayUnit = "Pa") = 20 * 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.Temperature T2_init(displayUnit = "K") = 500 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit = "J/kg") = T2_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_2"));
  //--- fluidState_1 ---
  parameter Modelica.SIunits.Pressure p_state1_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_1"));
  parameter Modelica.SIunits.Temperature T_state1_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_1"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state1_init(displayUnit = "J/kg") = T_state1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_1"));
  //--- fluidState_2 ---
  parameter Modelica.SIunits.Pressure p_state2_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_2"));
  parameter Modelica.SIunits.Temperature T_state2_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_2"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state2_init(displayUnit = "J/kg") = T_state1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_2"));
  //--- fluidState_3 ---
  parameter Modelica.SIunits.Pressure p_state3_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_3"));
  parameter Modelica.SIunits.Temperature T_state3_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_3"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state3_init(displayUnit = "J/kg") = T_state1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_3"));
  //--- fluidState_4 ---
  parameter Modelica.SIunits.Pressure p_state4_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_4"));
  parameter Modelica.SIunits.Temperature T_state4_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_4"));
  parameter Modelica.SIunits.SpecificEnthalpy h_state4_init(displayUnit = "J/kg") = T_state1_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidState_4"));
  //--- flange_1 ---
  parameter Modelica.SIunits.Torque tau1_init = 0.1 "" annotation(
    Dialog(tab = "Initialization", group = "flange_1"));
  parameter Modelica.SIunits.Angle phi1_init = phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_1"));
  //--- flange_2 ---
  parameter Modelica.SIunits.Torque tau2_init = pwr_init / (Nmech_init * 2.0 * Modelica.Constants.pi / 60.0) "" annotation(
    Dialog(tab = "Initialization", group = "flange_2"));
  parameter Modelica.SIunits.Angle phi2_init = phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_2"));
  //--- others ---
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech_init = 3000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.Power pwr_init = -5.0 * 10.0 ^ 5 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.Torque trq_init = pwr_init / (Nmech_init * 2.0 * Modelica.Constants.pi / 60.0) "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.Angle phi_init = 0.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_state_1_init = 7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_state_2_init = 7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_state_3_init = 8000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  parameter Modelica.SIunits.SpecificEntropy s_state_4_init = 8000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others"));
  
  
  
  /* ---------------------------------------------
            Internal variables
  --------------------------------------------- */
  Modelica.SIunits.Power pwr(start = pwr_init) "power via shaft, positive if fluid generates power" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Power pwrOut(start = -1.0 * pwr_init) "power via shaft, positive if fluid generates power" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.AngularVelocity omega(start = Nmech_init * 2.0 * Modelica.Constants.pi / 60.0) "mechanical rotation speed, rad/sec" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Angle phi(start = phi_init) "mechanical rotation displacement, rad" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  Modelica.SIunits.Torque trq(start = trq_init) "trq via shaft" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Torque trqOut(start = -1.0 * trq_init) "trq via shaft" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  Modelica.SIunits.Volume VolDisp "displacement";
  Real CR "Compression Ratio";
  
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech(start = Nmech_init) "mechanical rotation speed, rpm" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  Modelica.SIunits.VolumeFlowRate V_flow "volume flow rate through piston-cylinder";
  Modelica.SIunits.MassFlowRate m_flow "mass flow rate through piston-cylinder";
  Modelica.SIunits.MassFlowRate m_flow_fuel "mass flow rate of fuel";
  Modelica.SIunits.Work WoutCycle "work output, single cycle";
  
  Modelica.SIunits.MassFlowRate m_flow_max(start=m_flow1_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.MassFlowRate m_flow_min(start=m_flow2_init) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
  /* ---------------------------------------------
            Internal objects
  --------------------------------------------- */
  PropulsionSystem.Subelements.OttoCycleIdeal00 OttoCycle(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-3.55271e-15, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  
  Modelica.Blocks.Interfaces.RealInput u_fracFuel annotation(
    Placement(visible = true, transformation(origin = {-120, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Fluid.Interfaces.FluidPort_a port_1(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow1_init, min=if (allowFlowReversal) then -Constants.inf else 0.0), 
    h_outflow(start = h1_init, min=0.0+1.0e-10), 
    p(start=p1_init, min=0.0+1.0e-10)
  ) annotation(
    Placement(visible = true, transformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Fluid.Interfaces.FluidPort_b port_2(
    redeclare package Medium = Medium, 
    m_flow(start = m_flow2_init, min=if (allowFlowReversal) then -Constants.inf else 0.0), 
    h_outflow(start = h2_init, min=0.0+1.0e-10), 
    p(start=p2_init, min=0.0+1.0e-10)
  ) annotation(
    Placement(visible = true, transformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1(
    tau(start=tau1_init), phi(start=phi1_init)
  ) "" annotation(
    Placement(visible = true, transformation(origin = {-100, -98}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_2(
    tau(start=tau2_init), phi(start=phi2_init)
  ) "" annotation(
    Placement(visible = true, transformation(origin = {100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_m_flow_fuel(quantity = "MassFlowRate", unit = "kg/s", displayUnit = "kg/s") annotation(
    Placement(visible = true, transformation(origin = {110, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {76, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  //******************************************************************************************
equation
  connect(u_fracFuel, OttoCycle.u_fracFuel) annotation(
    Line(points = {{-120, 30}, {-22, 30}}, color = {0, 0, 127}));
  /* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  //Nmech=1000;
  V_flow = 1.0 / 2.0 * VolDisp * Nmech * 1.0 / 60.0;
  m_flow = OttoCycle.fluidState_1.d * V_flow;
  m_flow_fuel= m_flow*u_fracFuel;
  //---
  OttoCycle.u_p_fluidState_1= port_1.p;
  OttoCycle.u_T_fluidState_1= Medium.temperature_phX(port_1.p, actualStream(port_1.h_outflow), actualStream(port_1.Xi_outflow));
  OttoCycle.u_Xi_fluidState_1[1:Medium.nXi]= actualStream(port_1.Xi_outflow);
  //---
  OttoCycle.y_p_fluidState_4= port_2.p;
  OttoCycle.y_h_fluidState_4 = actualStream(port_2.h_outflow);
  OttoCycle.y_Xi_fluidState_4[1:Medium.nXi] = actualStream(port_2.Xi_outflow);
  //---
  m_flow= port_1.m_flow;
  (-1.0)*m_flow= port_2.m_flow;
  port_1.C_outflow = inStream(port_2.C_outflow);
  port_2.C_outflow = inStream(port_1.C_outflow);
  //--- distinguish inlet side ---
  m_flow_max = max(port_1.m_flow, port_2.m_flow);
  m_flow_min= min(port_1.m_flow, port_2.m_flow);
  //---
  if (allowFlowReversal==false)then
    port_1.h_outflow = OttoCycle.fluidState_1.h;
    port_1.Xi_outflow= OttoCycle.fluidState_1.Xi;
  else
    if(m_flow_max == port_1.m_flow)then
      port_1.h_outflow = OttoCycle.fluidState_1.h;
      port_1.Xi_outflow= OttoCycle.fluidState_1.Xi;
    elseif(m_flow_max == port_2.m_flow)then
      OttoCycle.y_h_fluidState_4 = actualStream(port_2.h_outflow);
      OttoCycle.y_Xi_fluidState_4[1:Medium.nXi] = actualStream(port_2.Xi_outflow);
    else
      port_1.h_outflow = OttoCycle.fluidState_1.h;
      port_1.Xi_outflow= OttoCycle.fluidState_1.Xi;
    end if;
  end if;
  
  //-- shaft --
  flange_1.phi = phi;
  flange_2.phi = phi;
  
  //---
  OttoCycle.par_CR = CR_paramInput;
  OttoCycle.par_VolDisp = VolDisp;
  OttoCycle.par_LHV_fuel = LHV_fuel_paramInput;
  
  //---
  WoutCycle = OttoCycle.y_WoutCycle;
  y_m_flow_fuel=m_flow_fuel;
  
  /* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  //---
  CR= CR_paramInput;
  VolDisp= VolDisp_paramInput;
  pwr = 1.0 / 2.0 * (-1.0) * WoutCycle * Nmech * 1.0 / 60.0;
  pwrOut = -1.0 * pwr;
  
  der(phi) = omega;
  omega * trq = pwr;
  Nmech = omega * 60.0 / (2.0 * Modelica.Constants.pi);
  trqOut = -1.0 * trq;
  trq = flange_1.tau + flange_2.tau;
  
  
  annotation(
    defaultComponentName = "PistonCylinder",
    Icon(graphics = {Line(origin = {1.54, 1.67}, points = {{-90, -102}, {88, -102}}, thickness = 5), Line(origin = {0.39, -10.28}, points = {{-60, -40}, {-60, 60}, {-60, 100}, {60, 100}, {60, 60}, {60, -40}}, thickness = 1.5), Rectangle(origin = {-1, 41}, fillPattern = FillPattern.Solid, extent = {{-54, -1}, {56, -33}}), Line(origin = {13.78, -87.87}, points = {{-13.7819, 111.869}, {16.2181, 27.8688}, {-13.7819, -12.1312}}, thickness = 2), Line(origin = {-40, 89}, points = {{0, 9}, {0, -11}}, thickness = 0.75), Line(origin = {-45.6153, 104.79}, points = {{14, -27}, {-2, -27}}, thickness = 0.75), Line(origin = {39.3395, 91}, points = {{0, 9}, {0, -11}}, thickness = 0.75), Line(origin = {34.3847, 124.112}, points = {{14, -27}, {-2, -27}}, thickness = 0.75), Line(origin = {-61, 89.6778}, points = {{-39, 10}, {21, 10}, {21, -12}}, pattern = LinePattern.Dot, thickness = 1), Line(origin = {-51, 99.661}, points = {{151, 0}, {91, 0}, {91, -20}}, pattern = LinePattern.Dot, thickness = 1), Text(origin = {-29, 112}, extent = {{-51, 8}, {109, -6}}, textString = "%name")}, coordinateSystem(extent = {{-100, -120}, {100, 120}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
  experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.1),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
end PistonCylinderIdealOttoMV00;
