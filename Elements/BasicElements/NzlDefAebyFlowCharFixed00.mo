within PropulsionSystem.Elements.BasicElements;

model NzlDefAeByFlowCharFixed00
  extends PropulsionSystem.BaseClasses.BasicElements.NozzleBase00(
    m_flow1_init=m_flow_1_des_paramInput
  );
  extends PropulsionSystem.BaseClasses.BasicElements.NozzleBaseDefDesPt00;
  
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
  parameter Boolean use_u_CdTh = false "get CdTh from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  parameter Boolean use_u_Cv = false "get Cv from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
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
  parameter Modelica.SIunits.MassFlowRate m_flow_1_des_paramInput = 1.0 "" annotation(
    Dialog(group = "Component sizing"));
  
  /* ---------------------------------------------
                Interface   
        --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_CdTh if use_u_CdTh "CdTh input, valid only when use_u_CdTh==true" annotation(
    Placement(visible = true, transformation(origin = {-80, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {-40, -79}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_Cv if use_u_Cv "Cv input, valid only when use_u_Cv==true" annotation(
    Placement(visible = true, transformation(origin = {-40, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {0, -67}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_kAmechTh if use_u_kAmechTh "AmechTh input, valid only when switchDetermine_AmechTh==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {0, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {60, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  
//********************************************************************************
initial algorithm
  
  fluid_1_des.m_flow:= m_flow_1_des_paramInput;
  
  
  
//********************************************************************************
initial equation
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  fluid_1_des.m_flow= m_flow_1_des_paramInput;
  fluid_1_des.p= fluid_1.p;
  fluid_1_des.T= fluid_1.T;
  //--------------------
  if (use_u_CdTh == false) then
    CdThDes= CdThDes_paramInput;
  elseif (use_u_Cv == true) then
    CdThDes= u_CdTh;
  end if;
  //--------------------
  if (use_u_Cv == false) then
    CvDes= CvDes_paramInput;
  elseif (use_u_Cv == true) then
    CvDes= u_Cv;
  end if;
  //--------------------
  PR= PRdes;
  m_flow_th= fluid_1_des.m_flow;
  
  
//********************************************************************************
algorithm
  
//********************************************************************************
equation
  
  when (time<=environment.timeRemoveDesConstraint)then
    /* ---------------------------------------------
    design point eqn
    --------------------------------------------- */
    fluid_1_des.m_flow= m_flow_1_des_paramInput;
    fluid_1_des.p= fluid_1.p;
    fluid_1_des.T= fluid_1.T;
    //--------------------
    if use_u_CdTh == false then
      CdThDes = CdThDes_paramInput;
    elseif use_u_Cv == true then
      CdThDes = u_CdTh;
    end if;
    //--------------------
    if use_u_Cv == false then
      CvDes = CvDes_paramInput;
    elseif use_u_Cv == true then
      CvDes = u_Cv;
    end if;
    //--------------------
    AeThDes= AeTh;
    AmechThDes= AmechTh;
  end when;
  
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables   
  --------------------------------------------- */
  //--------------------
  if use_u_CdTh == false then
    CdTh = CdThDes_paramInput;
  elseif use_u_Cv == true then
    CdTh = u_CdTh;
  end if;
  //--------------------
  if use_u_Cv == false then
    Cv = CvDes_paramInput;
  elseif use_u_Cv == true then
    Cv = u_Cv;
  end if;
  //--------------------
  if use_u_kAmechTh == false then
    AmechTh = AmechThDes;
  elseif use_u_kAmechTh == true then
    AmechTh = u_kAmechTh * AmechThDes;
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
  
  
end NzlDefAeByFlowCharFixed00;
