within PropulsionSystem.Elements.BasicElements;

model PropActDiskCharFixed01
  extends PropulsionSystem.BaseClasses.BasicElements.PropellerActuatorDiskBase00;
  /********************************************************
            imports
    ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  import epsiron= Modelica.Constants.small;
  import Streams= Modelica.Utilities.Streams;
  
  
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
  parameter Boolean use_u_effProp = false "get effProp from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  parameter Boolean use_u_Jdes = false "get Jdes from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  
  parameter Boolean use_u_Vinf_FnSaturation = false "get Vinf_FnSaturation from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  parameter Boolean use_u_Fn_FnSaturation = false "get Fn_FnSaturation from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  
  
  /* ---------------------------------------------
          parameters    
  --------------------------------------------- */
  parameter Real effProp_paramInput = 0.9 "propeller efficiency, valid only when use_u_effProp==false, value fixed through simulation" annotation(
    Dialog(group = "characteristics"));
  parameter Real Jdes_paramInput= 2.0 "advance ratio, design point, higher -> smaller diameter" annotation(
    Dialog(group = "characteristics"));
  
  parameter Modelica.SIunits.Velocity Vinf_FnSaturation_paramInput = 50 if switch_FnSaturation == switchThrustSaturation.byVinf "freestream speeed for thrust saturation, valid only when switch_FnSaturation==byVinf";
  parameter Modelica.SIunits.Force Fn_FnSaturation_paramInput = 10 * 1000 if switch_FnSaturation == switchThrustSaturation.byFn "saturation thrust, valid only when switch_FnSaturation==byFn";
  
  //********** Initialization Parameters **********
  //--- fluid_Amb, port_Amb ---
  parameter Modelica.SIunits.MassFlowRate m_flowAmb_init(displayUnit = "kg/s") = 1.0 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_amb"));
  parameter Modelica.SIunits.Pressure pAmb_init(displayUnit = "Pa") = 101.3 * 1000 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_amb"));
  parameter Modelica.SIunits.Temperature Tamb_init(displayUnit = "K") = 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_amb"));
  parameter Modelica.SIunits.SpecificEnthalpy hAmb_init(displayUnit = "J/kg") = Tamb_init*1.004 * 1000 * 288.15 "" annotation(
    Dialog(tab = "Initialization", group = "fluid_amb"));
  
  
  /* ---------------------------------------------
          Internal variables    
  --------------------------------------------- */
  Modelica.SIunits.Velocity Vinf_FnSaturation if switch_FnSaturation == switchThrustSaturation.byVinf "freestream speeed for thrust saturation";
  Modelica.SIunits.Force Fn_FnSaturation if switch_FnSaturation == switchThrustSaturation.byFn "saturation thrust";
  
  Real CT(start=0.12, min=Modelica.Constants.small) "thrust coefficient" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real CP(start=0.32, min=Modelica.Constants.small) "power coefficient" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  /**/
  Modelica.SIunits.Length diam(start=4.0, min=Modelica.Constants.small) "propeller diameter" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real J(start=1.4, min=Modelica.Constants.small) "advance ratio" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  
  /* ---------------------------------------------
      Internal objects
  --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  
  Medium.BaseProperties fluid_amb(
    p(start = pAmb_init, min=0.0+1.0e-10), 
    T(start = Tamb_init, min=0.0+1.0e-10), 
    state.p(start = pAmb_init, min=0.0+1.0e-10), 
    state.T(start = Tamb_init, min=0.0+1.0e-10), 
    h(start = hAmb_init, min=0.0+1.0e-10),
    d(start= pAmb_init/(278*Tamb_init), min=0.0+1.0e-10)
  ) "flow station of inlet";
  
  
  /* ---------------------------------------------
          Interface   
    --------------------------------------------- */
  Modelica.Fluid.Interfaces.FluidPort_a port_amb(
    redeclare package Medium = Medium, 
    m_flow(start = m_flowAmb_init, min= 0.0), 
    h_outflow(start = hAmb_init, min=0.0+1.0e-10), 
    p(start=pAmb_init, min=0.0+1.0e-10)
  ) ""  annotation(
    Placement(visible = true, transformation(origin = {-80, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  Modelica.Blocks.Interfaces.RealInput u_effProp if use_u_effProp annotation(
    Placement(visible = true, transformation(origin = {-40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_Vinf_FnSaturation(quantity = "Velocity", unit = "m/s", displayUnit = "m/s") if switch_FnSaturation == switchThrustSaturation.byVinf and use_u_Vinf_FnSaturation annotation(
    Placement(visible = true, transformation(origin = {40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_Fn_FnSaturation(quantity = "Force", unit = "N", displayUnit = "N") if switch_FnSaturation == switchThrustSaturation.byFn and use_u_Fn_FnSaturation annotation(
    Placement(visible = true, transformation(origin = {80, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_Jdes if use_u_Jdes annotation(
    Placement(visible = true, transformation(origin = {-80, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  
  //********************************************************************************
protected
  /* ---------------------------------------------
    Non-modifiable parameters
  --------------------------------------------- */
  parameter Modelica.SIunits.Length diamDes(fixed=false, start=2.0) "propeller diameter" annotation(
    HideResult=false);
  parameter Real CTdes(fixed=false, start=0.1) "design point thrust coefficient" annotation(
    HideResult=false);
  parameter Real CPdes(fixed=false, start=0.1) "design point thrust coefficient" annotation(
    HideResult=false);
  parameter Real Jdes(fixed=false, start= Jdes_paramInput) "design point advance ratio" annotation(
    HideResult=false);
  
  
//********************************************************************************
initial equation
  assert((Jdes<-1.0*Modelica.Constants.small) or (Modelica.Constants.small<Jdes), getInstanceName()+", Jdes="+String(Jdes), AssertionLevel.error);
  assert((J<-1.0*Modelica.Constants.small) or (Modelica.Constants.small<J), getInstanceName()+", J="+String(J), AssertionLevel.error);
  
  
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  if use_u_effProp == false then
    effPropDes = effProp_paramInput;
  elseif use_u_effProp == true then
    effPropDes = u_effProp;
  end if;
  //----------
  if use_u_Jdes==false then
    Jdes=Jdes_paramInput;
  elseif use_u_Jdes==true then
    Jdes= u_Jdes;
  end if;
  //----------
  
  CTdes= CT;
  CPdes= CP;
  diamDes=diam;
  
  
//********************************************************************************
algorithm
  // prevent Vinf=0.0 input
  if u_Vinf <= 0.0 then
    Vinf := 0.1;
  else
    Vinf := u_Vinf;
  end if;
  //--------------------
  
  if(printCmd==true)then
    Streams.print(getInstanceName());
    Streams.print("time= "+String(time));
    Streams.print("J= "+String(J));
    Streams.print("omega= "+String(omega));
    Streams.print("Nmech= "+String(Nmech));
    Streams.print("Nmech_rps= "+String(Nmech_rps));
  end if;
  
  
//********************************************************************************
equation
  assert((Jdes<-1.0*Modelica.Constants.small) or (Modelica.Constants.small<Jdes), getInstanceName()+", Jdes="+String(Jdes), AssertionLevel.warning);
  assert((J<-1.0*Modelica.Constants.small) or (Modelica.Constants.small<J), getInstanceName()+", J="+String(J), AssertionLevel.warning);
  
  /*
  when(-1.0*Modelica.Constants.small<J)and(J<Modelica.Constants.small)then
    reinit(J, J+Modelica.Constants.small);
  end when;
  */
  
  
  /* ---------------------------------------------
    Connections, interface <-> internal variables
  --------------------------------------------- */
  if use_u_effProp == false then
    effProp = effProp_paramInput;
  elseif use_u_effProp == true then
    effProp = u_effProp;
  end if;
  //--------------------
  if switch_FnSaturation == switchThrustSaturation.byVinf then
    if use_u_Vinf_FnSaturation == false then
      Vinf_FnSaturation = Vinf_FnSaturation_paramInput;
    elseif use_u_Vinf_FnSaturation == true then
      Vinf_FnSaturation = u_Vinf_FnSaturation;
    end if;
  elseif switch_FnSaturation == switchThrustSaturation.byFn then
    if use_u_Fn_FnSaturation == false then
      Fn_FnSaturation = Fn_FnSaturation_paramInput;
    elseif use_u_Fn_FnSaturation == true then
      Fn_FnSaturation = u_Fn_FnSaturation;
    end if;
  end if;
  //--------------------
  
  
  fluid_amb.p = port_amb.p;
  fluid_amb.h = actualStream(port_amb.h_outflow);
  fluid_amb.Xi = actualStream(port_amb.Xi_outflow);
  port_amb.h_outflow= fluid_amb.h;
  port_amb.Xi_outflow= fluid_amb.Xi;
  port_amb.m_flow=1.0;  // dummy, m_flow does not affect calculation
  
  
  /* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  if switch_FnSaturation == switchThrustSaturation.byVinf then
    if Vinf_FnSaturation < Vinf then
      pwrPropulsive = Fn * Vinf;
    else
      Fn = pwrPropulsive / Vinf_FnSaturation;
    end if;
  elseif switch_FnSaturation == switchThrustSaturation.byFn then
    Fn = min(Fn_FnSaturation, pwrPropulsive / Vinf);
  else
    if Vinf_FnSaturation < Vinf then
      pwrPropulsive = Fn * Vinf;
    else
      Fn = pwrPropulsive / Vinf_FnSaturation;
    end if;
  end if;
  //--------------------
  
  
  if noEvent(time<=environment.timeRemoveDesConstraint)then
    J= (effProp*CP)/CT;
    diam*(Jdes*NmechDes_rps)= Vinf;
  else
    J*(Nmech_rps*diam)= Vinf;
    diam= diamDes;
  end if;
  /**/
  
  CT= Fn/(fluid_amb.d*Nmech_rps^2.0*diam^4.0);
  CP= pwr/(fluid_amb.d*Nmech_rps^3.0*diam^5.0);
  
  
  
/********************************************************
  Graphics
********************************************************/
  
  annotation(
    defaultComponentName = "Prop",
    Icon(coordinateSystem(initialScale = 0.1)),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
  
end PropActDiskCharFixed01;
