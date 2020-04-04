within PropulsionSystem.Elements.BasicElements;

model NzlCharFixed00
  extends PropulsionSystem.BaseClasses.BasicElements.NozzleBase00;
  
  
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
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_AmechTh = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated "switch how to determine AmechTh" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter Boolean use_u_CdTh = false "get CdTh from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  parameter Boolean use_u_Cv = false "get Cv from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  
  /* ---------------------------------------------
          parameters    
  --------------------------------------------- */
  parameter Real CdThDes_paramInput = 0.99 "discharge coefficient at throat, valid only when use_u_CdTh==false, value fixed through simulation" annotation(
    Dialog(group = "Characteristics"));
  parameter Real CvDes_paramInput = 0.99 "flow velocity coefficient, valid only when use_u_Cv==false, value fixed through simulation" annotation(
    Dialog(group = "Characteristics"));
  parameter Modelica.SIunits.Area AmechTh_paramInput= 0.01 "Throat mechanical area, valid only when switchDetermine_AmechTh==param, value fixed through simulation" annotation(
    Dialog(group = "Geometry"));
  
  
  
  /* ---------------------------------------------
          Interface   
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_CdTh 
    if use_u_CdTh "CdTh input, valid only when use_u_CdTh==true" annotation(
    Placement(visible = true, transformation(origin = {-80, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {-40, -77}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  
  Modelica.Blocks.Interfaces.RealInput u_Cv 
    if use_u_Cv "Cv input, valid only when use_u_Cv==true" annotation(
    Placement(visible = true, transformation(origin = {-40, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {0, -65}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  
  Modelica.Blocks.Interfaces.RealInput u_AmechTh 
    if switchDetermine_AmechTh ==
      PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "AmechTh input, valid only when switchDetermine_AmechTh==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {0, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {60, -92}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  
  
algorithm
//##### none #####
equation
  
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables   
  --------------------------------------------- */
  //--------------------
  if (use_u_CdTh==false) then
    CdThDes = CdThDes_paramInput;
  elseif (use_u_Cv==true) then
    CdThDes = u_CdTh;
  end if; 
  //--------------------
  if (use_u_Cv==false) then
    CvDes = CvDes_paramInput;
  elseif (use_u_Cv==true) then
    CvDes = u_Cv;
  end if; 
  //--------------------
  if (switchDetermine_AmechTh == PropulsionSystem.Types.switches.switchHowToDetVar.param) then
    AmechTh = AmechTh_paramInput;
  elseif (switchDetermine_AmechTh == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) then
    AmechTh= u_AmechTh;
  end if; 
  //--------------------
  
  PR= PRdes;
  CdTh = CdThDes;
  Cv = CvDes;



/********************************************************
  Graphics
********************************************************/
  
annotation(
    defaultComponentName = "Nzl",
    Documentation(info = "<html>
  <a href=modelica://PropulsionSystem/docs/Elements/BasicElements/NzlCharFixed00.html> Document html page</a>
  
  <h4>example/demo models</h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.NzlCharFixed00_ex01\"> PropulsionSystem.Examples.BasicElements.NzlCharFixed00_ex01 </a> </li>
    </ul>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>
    
  <h4>classes from which this component extend </h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.BaseClasses.BasicElements.NozzleBase00\"> PropulsionSystem.BaseClasses.BasicElements.NozzleBase00 </a> </li>
    </ul>

</html>"),
    
    Icon(graphics = {Line(origin = {60.16, 13.94}, points = {{0, 25}, {0, -53}}, thickness = 3), Line(origin = {60, -60}, points = {{0, 34}, {0, -36}})}, coordinateSystem(initialScale = 0.1)));
    
    
    
end NzlCharFixed00;
