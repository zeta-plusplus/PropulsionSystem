within PropulsionSystem.BaseClasses.BasicElements;

partial model PropellerActuatorDiskBase00
  /********************************************************
            imports
    ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  import Streams= Modelica.Utilities.Streams;
  
  /********************************************************
            Declaration
    ********************************************************/
 /* ---------------------------------------------
        Type definitions
          only valid in this class
    --------------------------------------------- */
  type switchThrustSaturation = enumeration(byVinf "determine saturation Fn by free stream speed value", byFn "determine saturation Fn by Thrust value");
  
  
  /* ---------------------------------------------
        switches
  --------------------------------------------- */
  parameter switchThrustSaturation switch_FnSaturation = switchThrustSaturation.byVinf "How to determine saturation of Fn" annotation(
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
  //********** Initialization Parameters **********
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
  Real effProp(start=0.8) "propeller efficiency" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Power pwr(start=pwr_init) "power driving propeller" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Power pwrPropulsive(start=pwr_init*0.8) "propulsive power, defined by Fg*Vin" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Torque trq(start=tau1_init) "torque of drive shaft" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.AngularVelocity omega(start=Nmech_init*2*Modelica.Constants.pi/60.0) "mechanical rotation speed, rad/sec" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Angle phi(start=phi_init) "mechanical rotation displacement, rad" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech(start=Nmech_init) "mechanical rotation speed, rpm" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real Nmech_rps(start=Nmech_init/60.0) "rev/s" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Force Fn(start=pwr_init*0.8/100) "thrust generated by propeller" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.Velocity Vinf(start=100) "freestream speeed" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  
  /* ---------------------------------------------
          Declare function objects
  --------------------------------------------- */
  function mechOp= PropulsionSystem.Functions.PropellerFunctionPackage.PropellerMechPower00;
  
  
  
  /* ---------------------------------------------
          Interface   
    --------------------------------------------- */
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_1 annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_Fn(quantity = "Force", unit = "N", displayUnit = "N") annotation(
    Placement(visible = true, transformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_Vinf(quantity = "Velocity", unit = "m/s", displayUnit = "m/s") "speed of freestream flow" annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  
  //********************************************************************************
protected
  /* ---------------------------------------------
            Non-modifiable parameters
  --------------------------------------------- */
  parameter Real effPropDes(fixed = false) annotation(
    HideResult = false);
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NmechDes(fixed=false, start= Nmech_init) "" annotation(
    HideResult=false);
  parameter Real NmechDes_rps(fixed=false, start=Nmech_init/60.0) "rev/s";
  
  
  
//********************************************************************************
initial equation
  if printCmd == true then
    Streams.print("initialization");
    Streams.print(getInstanceName());
    Streams.print("omega= "+String(omega));
    Streams.print("Nmech= "+String(Nmech));
  end if;
  
  assert( noEvent(Modelica.Constants.small<abs(omega)), getInstanceName()+", omega="+String(omega), AssertionLevel.error);
  assert( noEvent(Modelica.Constants.small<abs(Nmech)), getInstanceName()+", Nmech="+String(Nmech), AssertionLevel.error);
  assert( noEvent(Modelica.Constants.small<abs(Nmech_rps)), getInstanceName()+", Nmech_rps="+String(Nmech_rps), AssertionLevel.error);
  
  /*
  assert((omega<Modelica.Constants.small) or (Modelica.Constants.small<omega), getInstanceName()+", omega="+String(omega), AssertionLevel.error);
  assert((Nmech_rps<Modelica.Constants.small) or (Modelica.Constants.small<Nmech_rps), getInstanceName()+", Nmech_rps="+String(Nmech_rps), AssertionLevel.error);
  assert((Nmech<Modelica.Constants.small) or (Modelica.Constants.small<Nmech), getInstanceName()+", Nmech="+String(Nmech), AssertionLevel.error);
  */
  
  NmechDes=Nmech;
  NmechDes_rps= Nmech_rps;
  
  
//********************************************************************************
algorithm
  
  
//********************************************************************************
equation
  if printCmd == true then
    Streams.print(getInstanceName());
    Streams.print("omega= "+String(omega));
    Streams.print("Nmech= "+String(Nmech));
  end if;
  
  assert( noEvent(Modelica.Constants.small<abs(omega)), getInstanceName()+", omega="+String(omega), AssertionLevel.error);
  assert( noEvent(Modelica.Constants.small<abs(Nmech)), getInstanceName()+", Nmech="+String(Nmech), AssertionLevel.error);
  assert( noEvent(Modelica.Constants.small<abs(Nmech_rps)), getInstanceName()+", Nmech_rps="+String(Nmech_rps), AssertionLevel.error);
  
  
  when (noEvent(abs(omega)<Modelica.Constants.small)) then
    reinit(omega, Nmech_init * 2.0 * Modelica.Constants.pi / 60.0);
  end when;
  
  when (noEvent(abs(Nmech)<Modelica.Constants.small)) then
    reinit(Nmech, Nmech_init);
  end when;
  
  when (noEvent(abs(Nmech_rps)<Modelica.Constants.small)) then
    reinit(Nmech_rps, Nmech_init/60.0);
  end when;
  
  /*
  assert((omega<Modelica.Constants.small) or (Modelica.Constants.small<omega), getInstanceName()+", omega="+String(omega), AssertionLevel.warning);
  assert((Nmech_rps<Modelica.Constants.small) or (Modelica.Constants.small<Nmech_rps), getInstanceName()+", Nmech_rps="+String(Nmech_rps), AssertionLevel.warning);
  assert((Nmech<Modelica.Constants.small) or (Modelica.Constants.small<Nmech), getInstanceName()+", Nmech="+String(Nmech), AssertionLevel.warning);
  */
  /*
  when(-1.0*Modelica.Constants.small<Nmech)and(Nmech<Modelica.Constants.small)then
    reinit(Nmech, pre(Nmech)+Nmech_init);
  end when;
  
  when(-1.0*Modelica.Constants.small<Nmech_rps)and(Nmech_rps<Modelica.Constants.small)then
    reinit(Nmech_rps, pre(Nmech_rps)+Nmech_init/60.0);
  end when;
  
  when(-1.0*Modelica.Constants.small<omega)and(omega<Modelica.Constants.small)then
    reinit(omega, pre(omega)+Nmech_init*2.0*Modelica.Constants.pi/60);
  end when;
  */
  
  
  /* ---------------------------------------------
    Connections, interface <-> internal variables
  --------------------------------------------- */
  phi = flange_1.phi;
  trq = flange_1.tau;
  y_Fn = Fn;
  
  
  /* ---------------------------------------------
    Eqns describing physics
  --------------------------------------------- */
  der(phi) = omega;
  
  Nmech = omega*60.0/(2.0*Modelica.Constants.pi);
  Nmech_rps= Nmech/60.0;
  
  pwr= mechOp(omega=omega, trq=trq);
  pwrPropulsive = pwr * effProp;
  
  
  
/********************************************************
  Graphics
********************************************************/


  annotation(
    defaultComponentName = "Prop",
    Icon(graphics = {Rectangle(origin = {-43, 8}, fillPattern = FillPattern.Solid, extent = {{-1, 0}, {143, -16}}), Polygon(origin = {-57, 0}, fillPattern = FillPattern.Solid, points = {{-18, 0}, {10, 14}, {10, -14}, {-18, 0}}), Text(origin = {-45, 124}, extent = {{-55, -4}, {145, -24}}, textString = "%name"), Polygon(origin = {-33, 44}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-12, -44}, {-8, 50}, {2, 56}, {10, -44}, {-12, -44}}), Polygon(origin = {-37, -44}, rotation = 180, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-12, -44}, {-8, 50}, {2, 56}, {8, -44}, {-12, -44}}), Ellipse(origin = {-33, 0}, extent = {{-47, 100}, {43, -100}}, endAngle = 360), Rectangle(origin = {-38, 1}, fillPattern = FillPattern.Solid, extent = {{-9, 13}, {15, -15}})}, coordinateSystem(initialScale = 0.1)));
  
  
end PropellerActuatorDiskBase00;
