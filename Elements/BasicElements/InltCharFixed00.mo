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
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_effRam = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine effRam" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  
  
  /* ---------------------------------------------
          parameters
  --------------------------------------------- */
  parameter Real effRamDes_paramInput = 0.95 "ram pressure recovery factor, valid only when switchDetermine_effRam==param, value fixed through simulation" annotation(
    Dialog(group = "Characteristics"));
  
  
  /* ---------------------------------------------
          Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_effRam 
    if switchDetermine_effRam == 
      PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "effRam input, valid only when switchDetermine_effRam==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {0, -75}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  
  
algorithm
//##### none #####
equation
  
  /* ---------------------------------------------
    Connections, interface <-> internal variables
  --------------------------------------------- */
  //--------------------
  if (switchDetermine_effRam == PropulsionSystem.Types.switches.switchHowToDetVar.param) then
    effRam = effRamDes_paramInput;
  elseif (switchDetermine_effRam == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) then
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
