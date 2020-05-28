within PropulsionSystem.Elements.BasicElements;

model NzlDefAeByFlowCharFixed01
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
  parameter Modelica.SIunits.Area AmechTh_paramInput= 0.0014 "Throat mechanical area, valid only when switchDetermine_AmechTh==param, value fixed through simulation" annotation(
    Dialog(group = "Geometry"));
  
  parameter Modelica.SIunits.Time timeRemoveDesConstraint = environment.timeRemoveDesConstraint annotation(
    Dialog(group = "Simulation setting"));
  
  /* ---------------------------------------------
                    Internal variables
  --------------------------------------------- */
  Boolean constrainDesPt(start=true) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
  
  /* ---------------------------------------------
      Internal objects
  --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  
  
  
  /* ---------------------------------------------
          Interface   
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_CdTh 
    if use_u_CdTh "CdTh input, valid only when use_u_CdTh==true" annotation(
    Placement(visible = true, transformation(origin = {-80, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {-40, -79}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  Modelica.Blocks.Interfaces.RealInput u_Cv 
    if use_u_Cv "Cv input, valid only when use_u_Cv==true" annotation(
    Placement(visible = true, transformation(origin = {-40, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {0, -67}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  Modelica.Blocks.Interfaces.RealInput u_AmechTh 
    if switchDetermine_AmechTh ==
      PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "AmechTh input, valid only when switchDetermine_AmechTh==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {0, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {60, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  

  //********************************************************************************
initial algorithm
  fluid_1_des.m_flow:= port_1.m_flow;
  fluid_1_des.p:= fluid_1.p;
  fluid_1_des.T:= fluid_1.T;
  //********************************************************************************
initial equation
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  PR= PRdes;
  
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
  AmechThDes= AmechTh;
algorithm
//##### none #####
equation
  if noEvent(time <= timeRemoveDesConstraint) then
    constrainDesPt=true;
  else
    constrainDesPt=false;
  end if;
  

  if noEvent(timeRemoveDesConstraint<time)then
    AmechTh=AmechThDes;
  end if;
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables   
  --------------------------------------------- */
  //--------------------
  if (use_u_CdTh==false) then
    CdTh = CdThDes_paramInput;
  elseif (use_u_Cv==true) then
    CdTh = u_CdTh;
  end if; 
  //--------------------
  if (use_u_Cv==false) then
    Cv = CvDes_paramInput;
  elseif (use_u_Cv==true) then
    Cv = u_Cv;
  end if; 
  //--------------------
  
  
  
  
  
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
end NzlDefAeByFlowCharFixed01;
