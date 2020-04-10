within PropulsionSystem.Elements.BasicElements;

model MotorGeneratorCharFixed00
  extends PropulsionSystem.BaseClasses.BasicElements.MotorGeneratorBase00;
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
  parameter Boolean use_u_pwr=true "get power extracted/supplied from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  
  
  /* ---------------------------------------------
          parameters
  --------------------------------------------- */
  parameter Real eff_paramInput=0.9 "motor/generator efficiency, valid only when use_u_eff==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  parameter Modelica.SIunits.Power pwr_paramInput=10*1000 "actual power extracted/ideal power supplied, valid only when use_u_pwr==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  
  /* ---------------------------------------------
           Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_pwr(quantity="Power", unit="W", displayUnit="W") if use_u_pwr "[W], actual power extracted(negative)/ideal power supplied(positive), valid only when use_u_pwr==true"  annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {111, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealInput u_eff if use_u_eff "[nond], efficiency, valid only when use_u_eff==true" annotation(
    Placement(visible = true, transformation(origin = {-80, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  
  
equation

  
  
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */  
  
  if (use_u_eff==false) then
    eff= eff_paramInput;
  elseif (use_u_eff==true) then
    eff= u_eff;
  end if;
  //--------------------
  if (use_u_pwr==false) then
    if(flange_1.tau>=0.0)then
      // generator operation
      pwr= -1.0*pwr_paramInput;
    else
      // motor operation
      pwrIdeal= -1.0*pwr_paramInput;
    end if;
  elseif(use_u_pwr==true)then
    if(flange_1.tau>=0.0)then
      // generator operation
      pwr= -1.0*u_pwr;
    else
      // motor operation
      pwrIdeal= -1.0*u_pwr;
    end if;
  end if;
  
  
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName="MotGene",
    Icon(coordinateSystem(initialScale = 0.1)));
    
end MotorGeneratorCharFixed00;
