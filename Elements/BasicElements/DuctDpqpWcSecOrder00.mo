within PropulsionSystem.Elements.BasicElements;

model DuctDpqpWcSecOrder00
  extends PropulsionSystem.BaseClasses.BasicElements.DuctBase00;
  /********************************************************
          imports   
  ********************************************************/
  import Modelica.Constants;
  
  
  /********************************************************
                       Declaration    
  ********************************************************/
  /* ---------------------------------------------
            switches    
  --------------------------------------------- */
  parameter Boolean use_u_dPqPdes = false "get dPqP from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  
  
  /* ---------------------------------------------
            parameters    
  --------------------------------------------- */
  parameter Real dPqPdes_paramInput = 0.05 "total pressure loss factor, valid only when use_u_dPqPdes==false, value fixed through simulation" annotation(
    Dialog(group = "Characteristics"));
  
  
  /* ---------------------------------------------
            Interface   
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_dPqP if use_u_dPqPdes "dPqPdes input, valid only when use_u_dPqPdes==true" annotation(
    Placement(visible = true, transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-80, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  
  //********************************************************************************
protected
  parameter Real kLoss(fixed=false) "" annotation(
    HideResult=false);
  
  
  //********************************************************************************
initial equation
  /* ---------------------------------------------
    Connections, interface <-> internal variables   
  --------------------------------------------- */
  //--------------------
  if use_u_dPqPdes == false then
    dPqPdes = dPqPdes_paramInput;
  elseif use_u_dPqPdes == true then
    dPqPdes = u_dPqPdes;
  end if;
  //--------------------
  
  
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  dPdes = dP;
  kLoss= dPqPdes/(Wc_1_des^2.0);
  
  
  //********************************************************************************
algorithm
  
  
  //********************************************************************************
equation
  
  //--------------------
  if noEvent(time<=environment.timeRemoveDesConstraint) then
    dPqP= dPqPdes;
  else
    dPqP= kLoss*Wc_1^2;
  end if;
  //--------------------
  
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Duct",
    Documentation(info = "<html>
  
  
</html>"),
    Icon(coordinateSystem(initialScale = 0.1))
  );
  
  
end DuctDpqpWcSecOrder00;
