within PropulsionSystem.BaseClasses.BasicElements;

partial model TurbineBase00
  extends PropulsionSystem.Interfaces.ElementFrames.ElementFrame_2FluidPorts_2ShaftPorts;
  /********************************************************
        imports
      ********************************************************/
  import Modelica.Constants;
  import Modelica.Utilities.Streams;
  import PropulsionSystem.Types.switches;
  /********************************************************
               Declaration
    ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Type definitions, only valid in this class **********
  type switch_Turbine_Subelement = enumeration(NoSubelement "", curve_dhqT "", curve_PR "") annotation(
    Documentation(info = "<html>
    </html>"));
  //********** Parameters **********
  parameter Modelica.SIunits.MassFlowRate WcDes_1_def = 10.0 "" annotation(
    Dialog(group = "Characteristics"));
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NcDes_1_def = 3000.0 "" annotation(
    Dialog(group = "Characteristics"));
  //----- inner-connected parameters -----
  inner parameter Real effDes = 0.80 "" annotation(
    Dialog(group = "Characteristics"));
  inner parameter Real PRdes = 3.0 "" annotation(
    Dialog(group = "Characteristics"));
  //----- switches -----
  parameter switches.switch_defineDesValue switchDef_WcDes_1 = switches.switch_defineDesValue.calcByDesStates "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter switches.switch_defineDesValue switchDef_NcDes_1 = switches.switch_defineDesValue.calcByDesStates "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  //********** Internal variables **********
  Modelica.SIunits.MassFlowRate Wc_1(start = WcDes_1_def) "corrected mass flow rate";
  Real PR(start = 4.0) "pressure ratio";
  Real eff(start = 0.8) "adiabatic efficiency";
  Modelica.SIunits.SpecificEnthalpy dht_is "specific enthalpy change in isentropic compression";
  Modelica.SIunits.SpecificEnthalpy dht "specific enthalpy change in non-isentropic compression";
  Modelica.SIunits.SpecificEnthalpy h_2is "";
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nc_1(start = NcDes_1_def) "corrected rotation speed, rpm";
  //----- inner-connected variables -----
  inner Real NcqNcDes_1(start = 1.0) "";
  inner Modelica.SIunits.MassFlowRate WcDes_1(start = WcDes_1_def) "corrected mass flow rate";
  inner Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NcDes_1(start = NcDes_1_def);
  //----- outer-connected variables -----
  //##### none #####
  //----- inner-outer-connected variables -----
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  //********** Internal model **********
  //##### none #####
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
//--- NcDes_1---
  if switchDef_NcDes_1 == switches.switch_defineDesValue.directInput then
    NcDes_1 = NcDes_1_def;
  elseif switchDef_NcDes_1 == switches.switch_defineDesValue.calcByDesStates then
    NcDes_1 = NmechDes / sqrt(Tdes_1 / environment.Tstd);
  end if;
//--- Wc_1 ---
  if switchDef_WcDes_1 == switches.switch_defineDesValue.directInput then
    WcDes_1 = WcDes_1_def;
  elseif switchDef_WcDes_1 == switches.switch_defineDesValue.calcByDesStates then
    WcDes_1 = dmDes_1 * sqrt(Tdes_1 / environment.Tstd) / (pDes_1 / environment.pStd);
  end if;
//********** Eqns describing physics **********
  Wc_1 = port_1.m_flow * sqrt(fluid_1.T / environment.Tstd) / (fluid_1.p / environment.pStd);
  Nc_1 = Nmech / sqrt(fluid_1.T / environment.Tstd);
  NcqNcDes_1 = Nc_1 / NcDes_1;
//-- pressure --
  PR = fluid_1.p / fluid_2.p;
/*
  //-- enthalpy & entropy --
  h_Ois = Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  */
//h_2is= Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  dht_is = fluid_1.h - h_2is;
  eff = dht / dht_is;
  dht = fluid_1.h - fluid_2.h;
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
//-- energy conservation --
  trq = flange_1.tau + flange_2.tau;
  pwr = -1.0 * (port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h);
  der(phi) = omega;
  omega * trq = pwr;
  Nmech = Modelica.SIunits.Conversions.NonSIunits.to_rpm(omega);
algorithm
  assert(PR < 0.0, getInstanceName() + ", PR got less than 0" + ", fluid_1.p=" + String(fluid_1.p) + ", fluid_2.p=" + String(fluid_2.p), AssertionLevel.warning);
//--- isentropic expansion ---
  if 0.0 < fluid_2.p and 0.0 < fluid_1.state.p then
    h_2is := Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  elseif fluid_2.p < 0.0 and fluid_1.state.p < 0.0 then
    h_2is := Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  else
    h_2is := Medium.isentropicEnthalpy(-1.0 * fluid_2.p, fluid_1.state);
  end if;
/********************************************************
  Graphics
********************************************************/
  annotation(
    Icon(graphics = {Polygon(origin = {30, 0}, fillColor = {255, 157, 0}, fillPattern = FillPattern.Solid, points = {{-90, 0}, {-90, -20}, {30, -80}, {30, 80}, {-90, 20}, {-90, 0}}), Rectangle(origin = {84, 6}, fillPattern = FillPattern.Solid, extent = {{-24, 4}, {16, -16}}), Rectangle(origin = {-86, 6}, fillPattern = FillPattern.Solid, extent = {{-12, 4}, {26, -16}}), Text(origin = {-43, 95}, extent = {{-37, 5}, {123, -15}}, textString = "%name"), Rectangle(origin = {-57, 30}, fillColor = {165, 165, 165}, fillPattern = FillPattern.Solid, extent = {{-3, 52}, {1, -10}}), Rectangle(origin = {-99, 16}, fillColor = {165, 165, 165}, fillPattern = FillPattern.Solid, extent = {{-1, 66}, {43, 62}}), Rectangle(origin = {63, 16}, fillColor = {165, 165, 165}, fillPattern = FillPattern.Solid, extent = {{-3, 66}, {37, 62}}), Text(origin = {-37, 11}, extent = {{-23, 9}, {97, -31}}, textString = "Trb")}, coordinateSystem(initialScale = 0.1)),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end TurbineBase00;
