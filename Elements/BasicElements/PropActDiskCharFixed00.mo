within PropulsionSystem.Elements.BasicElements;

model PropActDiskCharFixed00
  extends PropulsionSystem.BaseClasses.BasicElements.PropellerActuatorDiskBase00;
  /********************************************************
          imports
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  /********************************************************
          Declaration
  ********************************************************/
  
  
  
  /* ---------------------------------------------
        switches
  --------------------------------------------- */
  parameter Boolean use_u_effProp = false "get effProp from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  parameter Boolean use_u_Vinf_FnSaturation = false "get Vinf_FnSaturation from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  parameter Boolean use_u_Fn_FnSaturation = false "get Fn_FnSaturation from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  
  /* ---------------------------------------------
        parameters    
  --------------------------------------------- */
  parameter Real effProp_paramInput = 0.9 "propeller efficiency, valid only when use_u_effProp==false, value fixed through simulation" annotation(
    Dialog(group = "characteristics"));
  parameter Modelica.SIunits.Velocity Vinf_FnSaturation_paramInput=50 if(switch_FnSaturation==switchThrustSaturation.byVinf) "freestream speeed for thrust saturation, valid only when switch_FnSaturation==byVinf";
  parameter Modelica.SIunits.Force Fn_FnSaturation_paramInput=10*1000 if(switch_FnSaturation==switchThrustSaturation.byFn) "saturation thrust, valid only when switch_FnSaturation==byFn";
  
  
  
  
  
  /* ---------------------------------------------
        Interface   
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_effProp if use_u_effProp annotation(
    Placement(visible = true, transformation(origin = {-40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_Vinf_FnSaturation(quantity="Velocity", unit="m/s",displayUnit="m/s") if switch_FnSaturation==switchThrustSaturation.byVinf and use_u_Vinf_FnSaturation annotation(
    Placement(visible = true, transformation(origin = {40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_Fn_FnSaturation(quantity="Force", unit="N",displayUnit="N")  if switch_FnSaturation==switchThrustSaturation.byFn and use_u_Fn_FnSaturation annotation(
    Placement(visible = true, transformation(origin = {80, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  //********************************************************************************
  
protected
  /* ---------------------------------------------
          Non-modifiable parameters
    --------------------------------------------- */
  parameter Real effPropDes(fixed=false) annotation(
    HideResult=false);
  
  
initial equation
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  if(use_u_effProp==false)then
    effPropDes= effProp_paramInput;
  elseif(use_u_effProp==true)then
    effPropDes= u_effProp;
  end if;
  
  
  
algorithm
//##### NONE #####  
  
  
equation
  /* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */  
  if(use_u_effProp==false)then
    effProp= effProp_paramInput;
  elseif(use_u_effProp==true)then
    effProp= u_effProp;
  end if;
  //--------------------
  if(switch_FnSaturation==switchThrustSaturation.byVinf)then
    if(use_u_Vinf_FnSaturation==false)then
      Vinf_FnSaturation= Vinf_FnSaturation_paramInput;
    elseif(use_u_Vinf_FnSaturation==true)then
      Vinf_FnSaturation= u_Vinf_FnSaturation;
    end if;
  elseif(switch_FnSaturation==switchThrustSaturation.byFn)then
    if(use_u_Fn_FnSaturation==false)then
      Fn_FnSaturation= Fn_FnSaturation_paramInput;
    elseif(use_u_Fn_FnSaturation==true)then
      Fn_FnSaturation= u_Fn_FnSaturation;
    end if;
  end if;
  
  
  
  
  
  
  
  
/********************************************************
  Graphics
********************************************************/


  annotation(
    defaultComponentName="Prop",
    Icon(coordinateSystem(initialScale = 0.1)));


end PropActDiskCharFixed00;
