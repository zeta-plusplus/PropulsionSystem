within PropulsionSystem.BaseClasses.BasicElements;

partial model PropellerActuatorDiskBase02
  /********************************************************
            imports
    ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  import Units= Modelica.SIunits;
  /********************************************************
            Declaration
    ********************************************************/
  /* ---------------------------------------------
      Package
  --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  
  
  /* ---------------------------------------------
      Switch
  --------------------------------------------- */
  parameter PropulsionSystem.Types.switches.switchPropellerThrustSaturation switchFnSaturation = PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byVinf annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter Boolean printCmd = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(tab = "debug setting"));
  
  
  /* ---------------------------------------------
          parameters    
    --------------------------------------------- */
  parameter Units.Velocity Vinf_FnSaturation_par = 50 if switchFnSaturation == PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byVinf "freestream speeed for thrust saturation, valid only when switch_FnSaturation==byVinf";
  parameter Units.Force Fn_FnSaturation_par = 10 * 1000 if switchFnSaturation == PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byFn "saturation thrust, valid only when switch_FnSaturation==byFn";
  
  
  
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
  //--- flange_1 ---
  parameter Modelica.SIunits.Torque tau1_init=pwr_init/(Nmech_init*2.0*Modelica.Constants.pi/60.0) "" annotation(
    Dialog(tab = "Initialization", group = "flange_1")
  );
  parameter Modelica.SIunits.Angle phi1_init=phi_init "" annotation(
    Dialog(tab = "Initialization", group = "flange_1")
  );
  //--- others ---
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech_init=2000.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Power pwr_init=5.0*10.0^(5) "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  parameter Modelica.SIunits.Angle phi_init=1.0 "" annotation(
    Dialog(tab = "Initialization", group = "others")
  );
  
  
  /* ---------------------------------------------
        Internal variables    
  --------------------------------------------- */
  Real J(start=1.4) "advance ratio" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real CT(start=0.12) "thrust coefficient" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real CP(start=0.32) "power coefficient" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real effProp "propeller efficiency";
  Real CTqCP "power coefficient" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  Modelica.SIunits.Length diam(start=2.0) "propeller diameter" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.Power pwr "power driving propeller";
  Modelica.SIunits.Power pwrPropulsive "propulsive power, defined by Fg*Vin";
  Modelica.SIunits.Torque trq "torque of drive shaft";
  Modelica.SIunits.AngularVelocity omega(start=Nmech_init*2.0*Modelica.Constants.pi/60.0) "mechanical rotation speed, rad/sec"  annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Modelica.SIunits.Angle phi "mechanical rotation displacement, rad";
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech "mechanical rotation speed, rpm";
  Real Nmech_rps(start=Nmech_init/60.0) "rev/s" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Force Fn "thrust generated by propeller";
  Modelica.SIunits.Velocity Vinf "freestream speeed";
  //-----
  Modelica.SIunits.Velocity Vinf_FnSaturation if switchFnSaturation == PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byVinf "freestream speeed for thrust saturation";
  Modelica.SIunits.Force Fn_FnSaturation if switchFnSaturation == PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byFn "saturation thrust";
  
  
  /* ---------------------------------------------
      Internal objects
  --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  
  Medium.BaseProperties fluid_amb(
    p(start = pAmb_init, min=0.0+1.0e-10), 
    T(start = Tamb_init, min=0.0+1.0e-10), 
    state.p(start = pAmb_init, min=0.0+1.0e-10), 
    state.T(start = Tamb_init, min=0.0+1.0e-10), 
    h(start = hAmb_init, min=0.0+1.0e-10)
  ) "flow station of inlet";
  
  
  /* ---------------------------------------------
          Declare function objects
  --------------------------------------------- */
  function propOp= PropulsionSystem.Functions.PropellerFunctionPackage.PropellerOperation00(redeclare package inFuncMedium=Medium);
  function powerMech= PropulsionSystem.Functions.PropellerFunctionPackage.PropellerMechPower00;
  function saturateFn= PropulsionSystem.Functions.PropellerFunctionPackage.CalcFnSaturation;
  
  
  /* ---------------------------------------------
          Interface   
    --------------------------------------------- */
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_1 annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_Fn(quantity = "Force", unit = "N", displayUnit = "N") annotation(
    Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_Vinf(quantity = "Velocity", unit = "m/s", displayUnit = "m/s") "speed of freestream flow" annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Interfaces.FluidPort_a port_amb(
    redeclare package Medium = Medium, 
    m_flow(start = m_flowAmb_init, min= 0.0), 
    h_outflow(start = hAmb_init, min=0.0+1.0e-10), 
    p(start=pAmb_init, min=0.0+1.0e-10)
  ) ""  annotation(
    Placement(visible = true, transformation(origin = {-80, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
protected
  parameter Real Jdes(fixed = false) "advance ratio" annotation(
    HideResult = false);
  parameter Real CTdes(fixed = false) "thrust coefficient" annotation(
    HideResult = false);
  parameter Real CPdes(fixed = false) "power coefficient" annotation(
    HideResult = false);
  parameter Real CTqCPdes(fixed = false) "" annotation(
    HideResult = false);
  parameter Real effPropDes(fixed = false) "propeller efficiency" annotation(
    HideResult = false);
  parameter Modelica.SIunits.Length diamDes(fixed = false) "propeller diameter" annotation(
    HideResult = false);
  /*
  parameter Units.Conversions.NonSIunits.AngularVelocity_rpm NmechDes "mechanical rotation speed, rpm";
  parameter Real NmechDes_rps(fixed = false) "" annotation(
    HideResult = false);
  */
  
//********************************************************************************
algorithm
  
//********************************************************************************
equation
/* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  Vinf= u_Vinf;
  phi = flange_1.phi;
  trq = flange_1.tau;
  y_Fn = Fn;
  
  fluid_amb.p = port_amb.p;
  fluid_amb.h = actualStream(port_amb.h_outflow);
  fluid_amb.Xi = actualStream(port_amb.Xi_outflow);
  port_amb.h_outflow= fluid_amb.h;
  port_amb.Xi_outflow= fluid_amb.Xi;
  port_amb.m_flow=1.0;  // dummy, m_flow does not affect calculation
  
  
/* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  der(phi) = omega;
  Nmech = omega*60.0/(2.0*Modelica.Constants.pi);
  Nmech_rps=Nmech/60.0;
  pwr= powerMech(omega=omega, trq=trq);
  
  if(switchFnSaturation== PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byVinf)then
    Fn= saturateFn(switchFnSaturation=switchFnSaturation, Vinf=Vinf, pwrPropulsive=pwrPropulsive, Vinf_FnSaturation=Vinf_FnSaturation);
  elseif(switchFnSaturation==PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byFn)then
    Fn= saturateFn(switchFnSaturation=switchFnSaturation, Vinf=Vinf, pwrPropulsive=pwrPropulsive, Fn_FnSaturation=Fn_FnSaturation);
  else
    Fn= saturateFn(switchFnSaturation=switchFnSaturation, Vinf=Vinf, pwrPropulsive=pwrPropulsive, Vinf_FnSaturation=Vinf_FnSaturation);
  end if;
  
  (J, effProp, CTqCP, Fn, pwrPropulsive, pwr)=propOp(Nmech_rps=Nmech_rps, Vinf=Vinf, CT=CT, CP=CP, diam=diam, state_amb=fluid_amb.state);
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Prop",
    Icon(graphics = {Rectangle(origin = {-43, 8}, fillPattern = FillPattern.Solid, extent = {{-1, 0}, {143, -16}}), Polygon(origin = {-57, 0}, fillPattern = FillPattern.Solid, points = {{-18, 0}, {10, 14}, {10, -14}, {-18, 0}}), Text(origin = {-45, 124}, extent = {{-55, -4}, {145, -24}}, textString = "%name"), Polygon(origin = {-33, 44}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-12, -44}, {-8, 50}, {2, 56}, {10, -44}, {-12, -44}}), Polygon(origin = {-37, -44}, rotation = 180, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-12, -44}, {-8, 50}, {2, 56}, {8, -44}, {-12, -44}}), Ellipse(origin = {-33, 0}, extent = {{-47, 100}, {43, -100}}, endAngle = 360), Rectangle(origin = {-38, 1}, fillPattern = FillPattern.Solid, extent = {{-9, 13}, {15, -15}})}, coordinateSystem(initialScale = 0.1)));
end PropellerActuatorDiskBase02;
