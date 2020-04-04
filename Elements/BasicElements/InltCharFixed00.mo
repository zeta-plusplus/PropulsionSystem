within PropulsionSystem.Elements.BasicElements;

model InltCharFixed00
  extends PropulsionSystem.BaseClasses.BasicElements.InletBase00;
  
  
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
  parameter Boolean use_u_effRam = false "get effRam from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  
  /* ---------------------------------------------
          parameters    
  --------------------------------------------- */
  parameter Real effRamDes_paramInput = 0.95 "ram pressure recovery factor, valid only when use_u_effRam==false, value fixed through simulation" annotation(
    Dialog(group = "Characteristics"));
  
  
  
  /* ---------------------------------------------
          Interface   
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_effRam 
    if use_u_effRam "effRam input, valid only when use_u_effRam==true" annotation(
    Placement(visible = true, transformation(origin = {-40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {0, -75}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  
  
algorithm
//##### none #####
equation
  
  /* ---------------------------------------------
    Connections, interface <-> internal variables   
  --------------------------------------------- */
  //--------------------
  if (use_u_effRam==false) then
    effRam = effRamDes_paramInput;
  elseif (use_u_effRam==true) then
    effRam = u_effRam;
  end if; 
  //--------------------
  
  effRamDes= effRam;
  
  
  
/********************************************************
  Graphics
********************************************************/
  
  
annotation(
    defaultComponentName = "Inlt",
    Documentation(info = "<html>
  <a href=modelica://PropulsionSystem/docs/Elements/BasicElements/InltCharFixed00.html> Document html page</a>
  
  <h4>example/demo models</h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.InltCharFixed00_ex01\"> PropulsionSystem.Examples.BasicElements.InltCharFixed00_ex01 </a> </li>
    </ul>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>
    
  <h4>classes from which this component extend </h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.BaseClasses.BasicElements.InletBase00\"> PropulsionSystem.BaseClasses.BasicElements.InletBase00 </a> </li>
    </ul>

</html>"),
    
    Icon(coordinateSystem(initialScale = 0.1)));
  
  
  
end InltCharFixed00;
