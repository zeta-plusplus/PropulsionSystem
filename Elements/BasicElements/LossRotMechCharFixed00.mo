within PropulsionSystem.Elements.BasicElements;

model LossRotMechCharFixed00
  extends PropulsionSystem.BaseClasses.BasicElements.LossRotationalMechanicsBase00;
  /********************************************************
                            imports
  ********************************************************/
  import Modelica.Constants;
  
  
  
  /********************************************************
         Declaration
  ********************************************************/
  /* ---------------------------------------------
            switch
  --------------------------------------------- */
  parameter Boolean use_u_eff=false "get eff from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  
  /* ---------------------------------------------
          parameters
  --------------------------------------------- */
  parameter Real eff_paramInput=0.98 "motor/generator efficiency, valid only when use_u_eff==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  
  
  /* ---------------------------------------------
           Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_eff if use_u_eff "[nond], efficiency, valid only when use_u_eff==true" annotation(
    Placement(visible = true, transformation(origin = {40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {40, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  
  
  //********************************************************************************
initial equation
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  if (use_u_eff==false) then
    effDes= eff_paramInput;
  elseif (use_u_eff==true) then
    effDes= u_eff;
  end if;
  
  
  
equation
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */  
  
  if (use_u_eff==false) then
    eff= eff_paramInput;
  elseif (use_u_eff==true) then
    eff= u_eff;
  end if;
  
  
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName="LossRotMech",
    Icon(coordinateSystem(initialScale = 0.1)));
    
end LossRotMechCharFixed00;
