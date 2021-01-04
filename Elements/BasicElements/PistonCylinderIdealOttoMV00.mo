within PropulsionSystem.Elements.BasicElements;

model PistonCylinderIdealOttoMV00
  extends PropulsionSystem.BaseClasses.BasicElements.PistonCylinderBase00;
  /********************************************************
              imports
          ********************************************************/
  import Modelica.Constants;
  /********************************************************
              Declaration
          ********************************************************/
  /* ---------------------------------------------
                  parameters
              --------------------------------------------- */
  parameter Real CR_paramInput = 10.0 "compression ratio";
  parameter Modelica.SIunits.Volume VolDisp_paramInput = 100.0 * 10.0 ^ (-6.0) "displacement";
  parameter Modelica.SIunits.SpecificEnthalpy LHV_fuel_paramInput = 43.4 * 10.0 ^ 6.0 "lower heating value of fuel";
  //--- others ---
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
  Modelica.SIunits.MassFlowRate m_flow_fuel "mass flow rate of fuel";
  /* ---------------------------------------------
                  Internal objects
        --------------------------------------------- */
  PropulsionSystem.Subelements.OttoCycleIdeal00 OttoCycle(redeclare package Medium = Medium, switch_u_thermoState = PropulsionSystem.Types.switches.switch_input_ThermodynamicState.use_u_for_ThermodynamicState) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  /* ---------------------------------------------
                  Interface
        --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_fracFuel annotation(
    Placement(visible = true, transformation(origin = {-120, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-74, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_m_flow_fuel(quantity = "MassFlowRate", unit = "kg/s", displayUnit = "kg/s") annotation(
    Placement(visible = true, transformation(origin = {110, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //******************************************************************************************
equation
  connect(u_fracFuel, OttoCycle.u_fracFuel) annotation(
    Line(points = {{-120, 30}, {-70, 30}, {-70, 31}, {-24, 31}}, color = {0, 0, 127}));
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  m_flow_fuel = m_flow * u_fracFuel;
//---
  OttoCycle.u_p_fluidState_1 = fluid_1.p;
  OttoCycle.u_u_fluidState_1 = fluid_1.u;
  OttoCycle.u_Xi_fluidState_1[1:Medium.nXi] = fluid_1.Xi;
//---
  fluid_2.Xi = OttoCycle.y_Xi_fluidState_4;
  fluid_2.p = OttoCycle.y_p_fluidState_4;
  fluid_2.u = OttoCycle.y_u_fluidState_4;
//---
  OttoCycle.par_CR = CR_paramInput;
  OttoCycle.par_VolDisp = VolDisp;
  OttoCycle.par_LHV_fuel = LHV_fuel_paramInput;
//---
  WoutCycle = OttoCycle.y_WoutCycle;
  y_m_flow_fuel = m_flow_fuel;
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
//---
  CR = CR_paramInput;
  VolDisp = VolDisp_paramInput;
//---
  pwr_exp = 1.0 / 2.0 * OttoCycle.W_3_4 * Nmech * 1.0 / 60.0;
  pwr_cmp = 1.0 / 2.0 * OttoCycle.W_1_2 * Nmech * 1.0 / 60.0;
  Q_add = 1.0 / 2.0 * OttoCycle.y_Q_2_3 * Nmech * 1.0 / 60.0;
  Q_reject = 1.0 / 2.0 * OttoCycle.y_Q_4_1 * Nmech * 1.0 / 60.0;
  
  annotation(
    defaultComponentName = "PistonCylinder",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Icon(coordinateSystem(extent = {{-100, -120}, {100, 120}})));
end PistonCylinderIdealOttoMV00;
