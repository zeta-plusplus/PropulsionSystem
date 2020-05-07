within PropulsionSystem.Elements.BasicElements;

model PropActDiskCharTable00
  extends PropulsionSystem.BaseClasses.BasicElements.PropellerActuatorDiskBase01;
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
  parameter Boolean use_u_s_CTaud = false "get s_CTaud from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  parameter Boolean use_u_a_CTaud = false "get a_CTaud from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  parameter Boolean use_u_s_CPaud = false "get s_CPaud from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  parameter Boolean use_u_a_CPaud = false "get a_CPaud from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  
  
  /* ---------------------------------------------
          parameters    
    --------------------------------------------- */
  parameter Modelica.SIunits.Length diam_paramInput=2.0 "propeller diameter" annotation(
    Dialog(group = "component sizing"));
  
  
  
  /* ---------------------------------------------
                  Internal variables
  --------------------------------------------- */
  Real s_CTaud;
  Real a_CTaud;
  Real s_CPaud;
  Real a_CPaud;
  
  
  
  
  /* ---------------------------------------------
                  Internal objects
  --------------------------------------------- */
  PropulsionSystem.Subelements.PropellerTable_CTCP_Jtheta00 PropTbl_CTCP_Jtheta annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.To_deg to_deg1 annotation(
    Placement(visible = true, transformation(origin = {-60, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  
  
  
  /* ---------------------------------------------
          Interface   
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_s_CTaud if use_u_s_CTaud annotation(
    Placement(visible = true, transformation(origin = {-60, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_a_CTaud if use_u_a_CTaud annotation(
    Placement(visible = true, transformation(origin = {-20, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_s_CPaud if use_u_s_CPaud annotation(
    Placement(visible = true, transformation(origin = {20, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_a_CPaud if use_u_a_CPaud annotation(
    Placement(visible = true, transformation(origin = {60, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  //********************************************************************************
protected
  
initial equation
  
algorithm
/* ---------------------------------------------
    interface
  --------------------------------------------- */
//-- scalers --
//--------------------
  if use_u_s_CTaud == false then
    s_CTaud := 1.0;
  elseif use_u_s_CTaud == true then
    s_CTaud := u_s_CTaud;
  end if;
//--------------------
  if use_u_s_CPaud == false then
    s_CPaud := 1.0;
  elseif use_u_s_CPaud == true then
    s_CPaud := u_s_CPaud;
  end if;
//-- adders --
//--------------------
  if use_u_a_CTaud == false then
    a_CTaud := 0.0;
  elseif use_u_a_CTaud == true then
    a_CTaud := u_a_CTaud;
  end if;
//--------------------
  if use_u_a_CPaud == false then
    a_CPaud := 0.0;
  elseif use_u_a_CPaud == true then
    a_CPaud := u_a_CPaud;
  end if;
equation
  connect(to_deg1.y, PropTbl_CTCP_Jtheta.u_theta) annotation(
    Line(points = {{-49, 26}, {-40, 26}}, color = {0, 0, 127}));
  to_deg1.u= theta;
  PropTbl_CTCP_Jtheta.u_J= J;
  diam= diam_paramInput;
  
  
  /* ---------------------------------------------
    component characteristics
  --------------------------------------------- */
  CT= PropTbl_CTCP_Jtheta.y_CT*s_CTaud + a_CTaud;
  CP= PropTbl_CTCP_Jtheta.y_CP*s_CPaud + a_CPaud;
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Prop",
    Icon(coordinateSystem(initialScale = 0.1)));
end PropActDiskCharTable00;
