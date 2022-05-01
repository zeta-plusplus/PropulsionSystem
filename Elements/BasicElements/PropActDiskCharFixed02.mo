within PropulsionSystem.Elements.BasicElements;

model PropActDiskCharFixed02
  extends PropulsionSystem.BaseClasses.BasicElements.PropellerActuatorDiskBase02;
  /********************************************************
            imports
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  import epsiron= Modelica.Constants.small;
  import Streams= Modelica.Utilities.Streams;
  import Units= Modelica.SIunits;
  
  
  /********************************************************
            Declaration
  ********************************************************/
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
  parameter Real effPropDes_par = 0.9 "propeller efficiency, valid only when use_u_effProp==false, value fixed through simulation" annotation(
    Dialog(group = "characteristics"));
  parameter Real Jdes_par= 1.4 "advance ratio, design point, higher -> smaller diameter" annotation(
    Dialog(group = "characteristics"));
  /**/
  //********** Initialization Parameters **********
  
  
  /* ---------------------------------------------
          Internal variables    
  --------------------------------------------- */
  //discrete Real auxVar1 "";
  //Real k_Jdes;
  //Real k_Jvar;
  //discrete Real auxVar2 "";
  
  
  /* ---------------------------------------------
      Internal objects
  --------------------------------------------- */
  
  
  /* ---------------------------------------------
          Declare function objects
  --------------------------------------------- */
  function rel_J_Jdes= PropulsionSystem.Functions.PropellerFunctionPackage.relate_J_Jdes00;
  
  
  /* ---------------------------------------------
          Interface   
    --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_effProp if use_u_effProp annotation(
    Placement(visible = true, transformation(origin = {-40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_Vinf_FnSaturation(quantity = "Velocity", unit = "m/s", displayUnit = "m/s") if switchFnSaturation == PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byVinf and use_u_Vinf_FnSaturation annotation(
    Placement(visible = true, transformation(origin = {40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_Fn_FnSaturation(quantity = "Force", unit = "N", displayUnit = "N") if switchFnSaturation == PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byFn and use_u_Fn_FnSaturation annotation(
    Placement(visible = true, transformation(origin = {80, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_Jdes if use_u_Jdes annotation(
    Placement(visible = true, transformation(origin = {-80, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  
  //********************************************************************************
protected
  
  
//********************************************************************************
initial equation
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  effProp=effPropDes;
  CTdes= CT;
  CPdes= CP;
  diamDes=diam;
  CTqCPdes=CTqCP;
  //--------------------
  if use_u_Jdes==false then
    Jdes=Jdes_par;
  elseif use_u_Jdes==true then
    Jdes= u_Jdes;
  end if;
  //--------------------
  //auxVar1=1;
  
  
//********************************************************************************
algorithm
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
  
  /* ---------------------------------------------
    Connections, interface <-> internal variables
  --------------------------------------------- */
  if use_u_effProp == false then
    effProp = effPropDes_par;
  elseif use_u_effProp == true then
    effProp = u_effProp;
  end if;
  //--------------------
  
  if switchFnSaturation == PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byVinf then
    if use_u_Vinf_FnSaturation == false then
      Vinf_FnSaturation = Vinf_FnSaturation_par;
    elseif use_u_Vinf_FnSaturation == true then
      Vinf_FnSaturation = u_Vinf_FnSaturation;
    end if;
  elseif switchFnSaturation == PropulsionSystem.Types.switches.switchPropellerThrustSaturation.byFn then
    if use_u_Fn_FnSaturation == false then
      Fn_FnSaturation = Fn_FnSaturation_par;
    elseif use_u_Fn_FnSaturation == true then
      Fn_FnSaturation = u_Fn_FnSaturation;
    end if;
  end if;
  //--------------------
  
  /* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  /*if (time<=environment.timeRemoveDesConstraint)then
    J=Jdes;
    //diam=auxVar;
    //CTqCP=auxVar2;
  else
    auxVar=1.0;
    //diam= diamDes;
    //auxVar=1.0;
    //CTqCP=CTqCPdes;
  end if;
  */
  /*
  J= rel_J_Jdes(
      t=time, tSwitch=environment.timeRemoveDesConstraint, Jdes=Jdes, auxVar=auxVar1
    );
  */
  
  diam=diamDes;
  
  //--------------------
  
  /*
  when(sample(environment.timeRemoveDesConstraint,1.0)and(environment.timeRemoveDesConstraint<time))then
    diam=diamDes;
    //auxVar2=1.0;
  end when;
  */
  
/********************************************************
  Graphics
********************************************************/
  
  annotation(
    defaultComponentName = "Prop",
    Icon(coordinateSystem(initialScale = 0.1)),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
end PropActDiskCharFixed02;
