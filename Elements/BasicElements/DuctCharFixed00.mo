within PropulsionSystem.Elements.BasicElements;

model DuctCharFixed00
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
  parameter Boolean use_u_dPqP = false "get dPqP from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  
  /* ---------------------------------------------
          parameters    
  --------------------------------------------- */
  parameter Real dPqP_paramInput = 0.05 "total pressure loss factor, valid only when use_u_dPqP==false, value fixed through simulation" annotation(
    Dialog(group = "Characteristics"));
  
  
  /* ---------------------------------------------
          Interface   
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_dPqP 
    if use_u_dPqP "dPqP input, valid only when use_u_dPqP==true" annotation(
    Placement(visible = true, transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  //********************************************************************************
initial equation
/* ---------------------------------------------
    determine design point
  --------------------------------------------- */
/* ---------------------------------------------
    Connections, interface <-> internal variables   
  --------------------------------------------- */
//--------------------
  if use_u_dPqP == false then
    dPqPdes = dPqP_paramInput;
  elseif use_u_dPqP == true then
    dPqPdes = u_dPqP;
  end if;
//--------------------
  dPdes = dP;
algorithm
//##### none #####
equation
  
  
  /* ---------------------------------------------
    Connections, interface <-> internal variables   
  --------------------------------------------- */
//--------------------
  if (use_u_dPqP==false) then
    dPqP = dPqP_paramInput;
  elseif (use_u_dPqP==true) then
    dPqP = u_dPqP;
  end if; //--------------------
/********************************************************
  Graphics
********************************************************/  
annotation(
    defaultComponentName = "Duct",
    Documentation(info = "<html>
  <a href=modelica://PropulsionSystem/docs/Elements/BasicElements/DuctCharFixed00.html> Document html page</a>
  
  <h4>example/demo models</h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.DuctCharFixed00_ex01\"> PropulsionSystem.Examples.BasicElements.DuctCharFixed00_ex01 </a> </li>
    </ul>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>
    
  <h4>classes from which this component extend </h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.BaseClasses.BasicElements.DuctBase00\"> PropulsionSystem.BaseClasses.BasicElements.DuctBase00 </a> </li>
    </ul>

</html>"),
    
    Icon(coordinateSystem(initialScale = 0.1)));
  

  
  
end DuctCharFixed00;
