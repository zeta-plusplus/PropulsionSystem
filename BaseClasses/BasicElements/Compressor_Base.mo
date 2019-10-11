within PropulsionSystem.BaseClasses.BasicElements;

partial model Compressor_Base
  extends PropulsionSystem.Interfaces.ElementFrames.ElementFrame_2FluidPorts_2ShaftPorts;
  
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  //********** Type definitions, only valid in this class **********
  type switch_Compressor_Subelement= enumeration
    (
      NoSubelement "",
      ellipticalCurve ""
    )
    annotation (
    Documentation(info=
    "<html>
    </html>"));
  
  
  //********** Parameters **********
  parameter Modelica.SIunits.MassFlowRate WcDes_1_def=10.0
    ""
    annotation(
    Dialog(group = "Characteristics"));
  
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NcDes_1_def= 3000.0
    ""
    annotation(
    Dialog(group = "Characteristics"));
  //----- switches -----
  parameter switches.switch_defineDesValue switchDef_NcDes_1
      =switches.switch_defineDesValue.calcByDesStates
   ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  
  parameter switches.switch_defineDesValue switchDef_WcDes_1
      =switches.switch_defineDesValue.calcByDesStates
   ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  
  
  //********** Internal variables **********
  Modelica.SIunits.MassFlowRate Wc_1(start= WcDes_1_def) "corrected mass flow rate";
  Real PR(start = PRdes) "pressure ratio";
  Real eff(start = effDes) "adiabatic efficiency";
  Modelica.SIunits.SpecificEnthalpy dht_is "specific enthalpy change in isentropic compression";
  Modelica.SIunits.SpecificEnthalpy dht "specific enthalpy change in non-isentropic compression";
  Modelica.SIunits.SpecificEnthalpy h_2is "";
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nc_1(start= NcDes_1_def) "corrected rotation speed, rpm";
  //----- inner-connected variables -----
  inner Real NcqNcDes_1(start=1.0) "";
  inner Modelica.SIunits.MassFlowRate WcDes_1(start= WcDes_1_def) "corrected mass flow rate";
  inner Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NcDes_1(start=NcDes_1_def);
  //----- inner-outer-connected variables -----
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  
  
algorithm
  assert(PR < 0.0, "PR of compressor element got less than 0",
      AssertionLevel.warning);
  
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
//--- NcDes_1---
  if (switchDef_NcDes_1 == switches.switch_defineDesValue.directInput) then
    NcDes_1 = NcDes_1_def;
  elseif (switchDef_NcDes_1 == switches.switch_defineDesValue.calcByDesStates) then
    NcDes_1 = NmechDes / sqrt(Tdes_1 / environment.Tstd);
  end if;
//--- WcDes_1 ---
  if (switchDef_WcDes_1 == switches.switch_defineDesValue.directInput) then
    WcDes_1 = WcDes_1_def;
  elseif (switchDef_WcDes_1 == switches.switch_defineDesValue.calcByDesStates) then
    WcDes_1 = dmDes_1 * sqrt(Tdes_1 / environment.Tstd) / (pDes_1 / environment.pStd);
  end if;
//********** Eqns describing physics **********
  Wc_1 = port_1.m_flow * sqrt(fluid_1.T / environment.Tstd) / (fluid_1.p / environment.pStd);
  
  Nc_1= Nmech/sqrt(fluid_1.T/environment.Tstd);
  NcqNcDes_1= Nc_1/NcDes_1;
  //-- pressure --
  PR = fluid_2.p / fluid_1.p;

  //-- enthalpy & entropy --
  h_2is = Medium.isentropicEnthalpy(fluid_2.p, fluid_1.state);
  
  dht_is= h_2is - fluid_1.h;
  eff= dht_is / dht;
  dht= fluid_2.h - fluid_1.h;
  
  //-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0.0;
  fluid_2.Xi= fluid_1.Xi;
  
  //-- energy conservation --
  trq = flange_1.tau + flange_2.tau;
  pwr= -1.0*((port_1.m_flow * fluid_1.h) + (port_2.m_flow * fluid_2.h));
  der(phi)= omega;
  omega*trq= pwr;
  Nmech= Modelica.SIunits.Conversions.NonSIunits.to_rpm(omega);
  
  
/********************************************************
  Graphics
********************************************************/

  annotation(
    Icon(graphics = {Polygon(origin = {2, 36}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, points = {{-62, -38}, {-62, -116}, {58, -56}, {58, -16}, {-62, 44}, {-62, -38}}), Rectangle(origin = {-89, 6}, fillPattern = FillPattern.Solid, extent = {{-11, 4}, {29, -16}}), Rectangle(origin = {83, 2}, fillPattern = FillPattern.Solid, extent = {{-23, 8}, {17, -12}}), Rectangle(origin = {63, 86}, rotation = 180, fillColor = {184, 184, 184}, fillPattern = FillPattern.Solid, extent = {{3, 66}, {7, 4}}), Rectangle(origin = {-94, 77}, rotation = 90, fillColor = {184, 184, 184}, fillPattern = FillPattern.Solid, extent = {{1, 6}, {5, -36}}), Rectangle(origin = {82, 75}, rotation = 90, fillColor = {184, 184, 184}, fillPattern = FillPattern.Solid, extent = {{3, 26}, {7, -18}}), Text(origin = {-40, 9}, lineColor = {255, 255, 255}, extent = {{-20, 1}, {100, -19}}, textString = "%name"),  Line(origin = {9.77, 19.5769}, points = {{-40, 0}, {20, 0}}, color = {255, 255, 255}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5)}, coordinateSystem(initialScale = 0.1)));


end Compressor_Base;