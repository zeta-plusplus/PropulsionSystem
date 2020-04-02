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
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_dPqP = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine dPqP" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  
  
  /* ---------------------------------------------
          parameters
  --------------------------------------------- */
  parameter Real dPqPdes_paramInput = 0.01 "total pressure loss factor, valid only when switchDetermine_dPqP==param, value fixed through simulation" annotation(
    Dialog(group = "Characteristics"));
  
  
  /* ---------------------------------------------
          Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_dPqP 
    if switchDetermine_dPqP == 
      PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "dPqP input, valid only when switchDetermine_dPqP==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-40, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-60, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  
  
  
algorithm
//##### none #####
equation
  
  
  /* ---------------------------------------------
    Connections, interface <-> internal variables
  --------------------------------------------- */
  //--------------------
  if (switchDetermine_dPqP == PropulsionSystem.Types.switches.switchHowToDetVar.param) then
    dPqP = dPqPdes_paramInput;
  elseif (switchDetermine_dPqP == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) then
    dPqP = u_dPqP;
  end if;
  //--------------------
  
  dPqPdes=dPqP;
  dPdes=dP;
  
  
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
