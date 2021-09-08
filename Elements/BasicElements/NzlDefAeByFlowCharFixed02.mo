within PropulsionSystem.Elements.BasicElements;

model NzlDefAeByFlowCharFixed02
  extends PropulsionSystem.BaseClasses.BasicElements.NozzleBase01;
  extends PropulsionSystem.BaseClasses.BasicElements.NozzleBaseDefDesPt01;
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
  parameter Boolean use_u_kAmechTh = false "multipulier on Amech" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  
  
  /* ---------------------------------------------
          parameters    
  --------------------------------------------- */
  parameter Real CdThDes_paramInput = 0.99 "discharge coefficient at throat, valid only when use_u_CdTh==false, value fixed through simulation" annotation(
    Dialog(group = "Characteristics"));
  parameter Real CvDes_paramInput = 0.99 "flow velocity coefficient, valid only when use_u_Cv==false, value fixed through simulation" annotation(
    Dialog(group = "Characteristics"));
  
  
  /* ---------------------------------------------
                    Internal variables
  --------------------------------------------- */
  Real kAmechTh;
  
  discrete Real auxVar "";
  
  /* ---------------------------------------------
      Internal objects
  --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  
  
  Modelica.Blocks.Interfaces.RealInput u_kAmechTh if use_u_kAmechTh "AmechTh input, valid only when switchDetermine_AmechTh==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {0, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {60, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  
  //********************************************************************************
initial algorithm
  
  //********************************************************************************
initial equation
  //kAmechTh=1.0;
  CdThDes = CdThDes_paramInput;
  CvDes = CvDes_paramInput;
  
  
  fluid_1_des.m_flow= port_1.m_flow;
  fluid_1_des.p= fluid_1.p;
  fluid_1_des.T= fluid_1.T;
  
  //--------------------
  AeThDes= AeTh;
  AmechThDes= AmechTh;
  
//********************************************************************************
equation
  //--------------------
  CdTh = CdThDes;
  Cv = CvDes; 
  //--------------------
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables   
  --------------------------------------------- */
  if use_u_kAmechTh == false then
    kAmechTh = 1.0;
  elseif use_u_kAmechTh == true then
    kAmechTh= u_kAmechTh;
  end if;
  //--------------------
  
  if(time<=environment.timeRemoveDesConstraint)then
    AmechTh=auxVar;
  else
    AmechTh = kAmechTh * AmechThDes;
  end if;
  
  //--------------------
  when(sample(environment.timeRemoveDesConstraint,1.0)and(environment.timeRemoveDesConstraint<time))then
    //if(switch_calcOnlyDes==false)then
    //===== mode: des. pt. -> off des. =====
      auxVar=1;
    //end if;
  end when;
  /**/
  
  
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
    Icon(graphics = {Line(origin = {60.16, 13.94}, points = {{0, 25}, {0, -53}}, thickness = 3), Line(origin = {60, -60}, points = {{0, 34}, {0, -36}})}, coordinateSystem(initialScale = 0.1)),
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
  __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian,newInst",
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end NzlDefAeByFlowCharFixed02;
