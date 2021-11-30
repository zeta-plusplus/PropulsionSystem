within PropulsionSystem.Sources;

model FlightCondition2InletFluid00
  extends PropulsionSystem.Icons.Icon_FlightCondition2InletFluid00;
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
              switches
      --------------------------------------------- */
  parameter Boolean use_u_alt = false "get alt from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true));
  parameter Boolean use_u_MN = false "get MN from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true));
  parameter Boolean use_u_dTamb = false "get dTamb from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true));
  parameter Boolean use_u_X = false "get fluid composition from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true));
  parameter Boolean use_u_C = false "get fluid trace substance from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true));
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
  parameter Modelica.SIunits.Length alt_paramInput = 10000.0 "flight altitude, valid only when use_u_alt==false, value fixed through simulation" annotation();
  parameter Real MN_paramInput = 0.80 "flight mach number, valid only when use_u_MN==false, value fixed through simulation" annotation();
  parameter Modelica.SIunits.TemperatureDifference dTamb_paramInput = 0.0 "temperature diffrence from standard atmosphere, valid only when use_u_dTamb==false, value fixed through simulation" annotation();
  parameter Medium.MassFraction X_fluid_paramInput[Medium.nX] = Medium.X_default "fluid composition, valid only when use_u_X==false, value fixed through simulation" annotation();
  parameter Medium.ExtraProperty C_fluid_paramInput[Medium.nC](quantity = Medium.extraPropertiesNames) = fill(0, Medium.nC) "fluid trace substance, valid only when use_u_C==false, value fixed through simulation" annotation();
  //********** Initialization Parameters **********
  //--- fluid2Inlet ---
  parameter Modelica.SIunits.MassFlowRate m_flow2Inlet_init(displayUnit = "kg/s") = -1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid2Inlet"));
  parameter Modelica.SIunits.Pressure p2Inlet_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid2Inlet"));
  parameter Modelica.SIunits.Temperature T2Inlet_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid2Inlet"));
  parameter Modelica.SIunits.SpecificEnthalpy h2Inlet_init(displayUnit = "J/kg") = T2Inlet_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid2Inlet"));
  //--- fluidAmb ---
  parameter Modelica.SIunits.MassFlowRate m_flowAmb_init(displayUnit = "kg/s") = -1.0 * m_flow2Inlet_init "" annotation(
    Dialog(tab = "Initialization", group = "fluidAmb"));
  parameter Modelica.SIunits.Pressure pAmb_init(displayUnit = "Pa") = p2Inlet_init "" annotation(
    Dialog(tab = "Initialization", group = "fluidAmb"));
  parameter Modelica.SIunits.Temperature Tamb_init(displayUnit = "K") = T2Inlet_init "" annotation(
    Dialog(tab = "Initialization", group = "fluidAmb"));
  parameter Modelica.SIunits.SpecificEnthalpy hAmb_init(displayUnit = "J/kg") = Tamb_init * 1.004 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluidAmb"));
  //--- others ---
  parameter Modelica.SIunits.SpecificEntropy s_fluid_amb_init=6800.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.SpecificEntropy s_fluid_inlet_init=7000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  
  
  /* ---------------------------------------------
      Internal variables
  --------------------------------------------- */
  Modelica.SIunits.SpecificEntropy s_fluid_amb(start=s_fluid_amb_init) "specific entropy, fluid_1" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.SpecificEntropy s_fluid_inlet(start=s_fluid_inlet_init) "specific entropy, fluid_2" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
  /* ---------------------------------------------
          Internal objects
      --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  PropulsionSystem.Subelements.AltMN2pTh00 AltMN2pTh(redeclare package Medium = Medium, T2Inlet_init = T2Inlet_init, Tamb_init = Tamb_init, h2Inlet_init = h2Inlet_init, hAmb_init = hAmb_init, m_flow2Inlet_init = m_flow2Inlet_init, m_flowAmb_init = m_flowAmb_init, p2Inlet_init = p2Inlet_init, pAmb_init = pAmb_init) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT sourceFluidAmb(redeclare package Medium = Medium, nPorts = 1, use_C_in = true, use_T_in = true, use_X_in = true, use_p_in = true, medium.p(start = pAmb_init), medium.T(start = Tamb_init), medium.h(start = hAmb_init), T_in(start = Tamb_init, min = 1.0e-10), p_in(start = pAmb_init, min = 1.0e-10)) annotation(
    Placement(visible = true, transformation(origin = {60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT sourceFluid2Inlet(redeclare package Medium = Medium, nPorts = 1, use_C_in = true, use_T_in = true, use_X_in = true, use_p_in = true, medium.p(start = p2Inlet_init), medium.T(start = T2Inlet_init), medium.h(start = h2Inlet_init), T_in(start = T2Inlet_init, min = 1.0e-10), p_in(start = p2Inlet_init, min = 1.0e-10)) annotation(
    Placement(visible = true, transformation(origin = {70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /* ---------------------------------------------
              Interface
      --------------------------------------------- */
  input Modelica.Blocks.Interfaces.RealInput u_alt(quantity = "Length", unit = "m", displayUnit = "m") if use_u_alt "flight altitude, valid only when use_u_alt==true" annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_MN if use_u_MN "flight mach number, valid only when use_u_MN==true" annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_dTamb(quantity = "ThermodynamicTemperature", unit = "K", displayUnit = "K") if use_u_dTamb "temperature difference from standard atmospere, valid only when use_u_dTamb==true" annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_X_fluid[Medium.nX] if use_u_X "composition of fluid, valid only when use_u_X==true" annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_C_fluid[Medium.nC] if use_u_C "trace substance of fluid, valid only when use_u_C==true" annotation(
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_amb(redeclare package Medium = Medium, m_flow(start = m_flowAmb_init, min = if allowFlowReversal then -Constants.inf else 0.0), h_outflow(start = hAmb_init), p(start = pAmb_init)) "ambient p, exhaust h" annotation(
    Placement(visible = true, transformation(origin = {70, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_b port_inlet(redeclare package Medium = Medium, m_flow(start = m_flow2Inlet_init, max = if allowFlowReversal then +Constants.inf else 0.0), h_outflow(start = h2Inlet_init), p(start = p2Inlet_init)) annotation(
    Placement(visible = true, transformation(origin = {100, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_V_inf(quantity = "Velocity", unit = "m/s", displayUnit = "m/s") "[m/s], free stream velocity" annotation(
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(limitsAtInit = true, strict = true, uMax = Modelica.Constants.inf, uMin = 1.0e-10) annotation(
    Placement(visible = true, transformation(origin = {15, 58}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter2(limitsAtInit = true, strict = true, uMax = Modelica.Constants.inf, uMin = 1.0e-10) annotation(
    Placement(visible = true, transformation(origin = {5, 28}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter3(limitsAtInit = true, strict = true, uMax = Modelica.Constants.inf, uMin = 1.0e-10) annotation(
    Placement(visible = true, transformation(origin = {25, -2}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter4(limitsAtInit = true, strict = true, uMax = Modelica.Constants.inf, uMin = 1.0e-10) annotation(
    Placement(visible = true, transformation(origin = {5, -11}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
algorithm
//##### none #####
equation
  connect(AltMN2pTh.y_pTot, limiter3.u) annotation(
    Line(points = {{-16, 10}, {0, 10}, {0, -2}, {19, -2}}, color = {0, 0, 127}));
  connect(limiter3.y, sourceFluid2Inlet.p_in) annotation(
    Line(points = {{30.5, -2}, {58, -2}}, color = {0, 0, 127}));
  connect(AltMN2pTh.y_Ttot, limiter4.u) annotation(
    Line(points = {{-16, 2}, {-8, 2}, {-8, -11}, {-1, -11}}, color = {0, 0, 127}));
  connect(limiter4.y, sourceFluid2Inlet.T_in) annotation(
    Line(points = {{10.5, -11}, {39.5, -11}, {39.5, -6}, {58, -6}}, color = {0, 0, 127}));
  connect(limiter2.y, sourceFluidAmb.T_in) annotation(
    Line(points = {{10.5, 28}, {38, 28}, {38, 54}, {48, 54}}, color = {0, 0, 127}));
  connect(AltMN2pTh.y_Tamb, limiter2.u) annotation(
    Line(points = {{-16, 28}, {-1, 28}}, color = {0, 0, 127}));
  connect(AltMN2pTh.y_pAmb, limiter1.u) annotation(
    Line(points = {{-16, 38}, {-4, 38}, {-4, 58}, {9, 58}}, color = {0, 0, 127}));
  connect(limiter1.y, sourceFluidAmb.p_in) annotation(
    Line(points = {{21, 58}, {48, 58}}, color = {0, 0, 127}));
  connect(AltMN2pTh.y_V_inf, y_V_inf) annotation(
    Line(points = {{-17, -17}, {-10, -17}, {-10, -70}, {110, -70}}, color = {0, 0, 127}));
  connect(sourceFluid2Inlet.ports[1], port_inlet) annotation(
    Line(points = {{80, -10}, {100, -10}}, color = {0, 127, 255}));
  connect(sourceFluidAmb.ports[1], port_amb) annotation(
    Line(points = {{70, 50}, {70, 100}}, color = {0, 127, 255}));
  if printCmd == true then
    assert(sourceFluidAmb.medium.p <= 0.0, getInstanceName() + ", sourceFluidAmb.medium.p=" + String(sourceFluidAmb.medium.p), AssertionLevel.warning);
    assert(sourceFluid2Inlet.medium.p <= 0.0, getInstanceName() + ", sourceFluid2Inlet.medium.p=" + String(sourceFluid2Inlet.medium.p), AssertionLevel.warning);
  end if;
/* ---------------------------------------------
    Connections, interface <-> internal variables
  --------------------------------------------- */
//--------------------
  if use_u_alt == true then
    AltMN2pTh.u_alt = u_alt;
  elseif use_u_alt == false then
    AltMN2pTh.u_alt = alt_paramInput;
  end if;
//--------------------
  if use_u_MN == true then
    AltMN2pTh.u_MN = u_MN;
  elseif use_u_MN == false then
    AltMN2pTh.u_MN = MN_paramInput;
  end if;
//--------------------
  if use_u_dTamb == true then
    AltMN2pTh.u_dTamb = u_dTamb;
  elseif use_u_dTamb == false then
    AltMN2pTh.u_dTamb = dTamb_paramInput;
  end if;
//--------------------
  if use_u_X == true then
    AltMN2pTh.u_X = u_X_fluid;
    sourceFluidAmb.X_in = u_X_fluid;
    sourceFluid2Inlet.X_in = u_X_fluid;
  elseif use_u_X == false then
    AltMN2pTh.u_X = X_fluid_paramInput;
    sourceFluidAmb.X_in = X_fluid_paramInput;
    sourceFluid2Inlet.X_in = X_fluid_paramInput;
  end if;
//--------------------
  if use_u_C == true then
    sourceFluidAmb.C_in = u_C_fluid;
    sourceFluid2Inlet.C_in = u_C_fluid;
  elseif use_u_C == false then
    sourceFluidAmb.C_in = C_fluid_paramInput;
    sourceFluid2Inlet.C_in = C_fluid_paramInput;
  end if;
//--------------------
  s_fluid_amb = Medium.specificEntropy(AltMN2pTh.fluidAmb.state);
  s_fluid_inlet= Medium.specificEntropy(AltMN2pTh.fluidTot.state);
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Flt2Fluid",
    
    Documentation(info = "<html>
  <a href=modelica://PropulsionSystem/docs/Sources/FlightCondition2InletFluid00.html> Document html page</a>
  
  <h4>example/demo models</h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.FlightCondition2InletFluid00_ex01\"> PropulsionSystem.Examples.BasicElements.FlightCondition2InletFluid00_ex01 </a> </li>
    </ul>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>
    
  <h4>classes from which this component extend </h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.BaseClasses.BasicElements.FlightCondition2InletFluidBase00\"> PropulsionSystem.BaseClasses.BasicElements.FlightCondition2InletFluidBase00 </a> </li>
    </ul>

</html>"),
    Icon(coordinateSystem(initialScale = 0.1), graphics = {Text(origin = {4, 92}, extent = {{2, 3}, {36, -11}}, textString = "Amb"), Text(origin = {62, 4}, extent = {{-10, 3}, {36, -11}}, textString = "To ENG"), Rectangle(origin = {-74, 79}, extent = {{-26, 21}, {174, -179}}), Text(origin = {60, -74}, extent = {{2, 3}, {36, -11}}, textString = "V_inf")}));
end FlightCondition2InletFluid00;
