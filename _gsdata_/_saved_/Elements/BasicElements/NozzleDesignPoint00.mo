within PropulsionSystem.Elements.BasicElements;

model NozzleDesignPoint00
  extends PropulsionSystem.BaseClasses.BasicElements.NozzleBase02;
  
  
  /********************************************************
          imports   
    ********************************************************/
  import units=Modelica.Units.SI;
  import unitsNonSI=Modelica.Units.NonSI;
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  
  /********************************************************
          Declaration   
    ********************************************************/
  /* ---------------------------------------------
          switches
    --------------------------------------------- */
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_m_flow_1= PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated "switch how to determine m_flow_1" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true); 
  
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_AmechTh= PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated "switch how to determine Amech of throat" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_Amech2= PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated "switch how to determine Amech after expand to ambient pressure" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_Cv= PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine Cv" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_CdTh = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine CdTh" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_Cd2 = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine Cd2" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated "switch how to determine PR" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  
  
  /* ---------------------------------------------
          parameters    
    --------------------------------------------- */
  inner parameter units.MassFlowRate m_flow_1_par=100.0  "mass flow, valid only when switchDetermine_m_flow_1==param, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  inner parameter units.Area AmechTh_par = 0.1 "Throat mechanical area, valid only when switchDetermine_AmechTh==param, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  inner parameter units.Area Amech2_par = 0.4 "Throat mechanical area, valid only when switchDetermine_AmechTh==param, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  inner parameter Real Cv_par = 1.0 "" annotation(
    Dialog(group = "Component characteristics"));
  
  inner parameter Real CdTh_par = 0.9 "" annotation(
    Dialog(group = "Component characteristics"));
  
  inner parameter Real Cd2_par = 0.9 "" annotation(
    Dialog(group = "Component characteristics"));
  
  inner parameter Real PR_par = 2.0 "" annotation(
    Dialog(group = "Component characteristics"));
  
  
  
  /* ---------------------------------------------
          Internal variables
      --------------------------------------------- */
  units.MassFlowRate m_flow_1_des;
  
  
  /* ---------------------------------------------
          Interface   
    --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_m_flow_1 if switchDetermine_m_flow_1 == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "m_flow_1 input, valid only when switchDetermine_m_flow_1==viaRealInput" annotation(
    Placement(transformation(origin = {-100, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {-120, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  Modelica.Blocks.Interfaces.RealInput u_AmechTh if switchDetermine_AmechTh == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "eff input, valid only when switchDetermine_eff==viaRealInput" annotation(
    Placement( transformation(origin = {-60, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {-20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  Modelica.Blocks.Interfaces.RealInput u_Amech2 if switchDetermine_AmechTh == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "eff input, valid only when switchDetermine_eff==viaRealInput" annotation(
    Placement( transformation(origin = {20, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {120, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  Modelica.Blocks.Interfaces.RealInput u_Cv if switchDetermine_Cv == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "PR input, valid only when switchDetermine_PR==viaRealInput" annotation(
    Placement( transformation(origin = {-20, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {130, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  
  Modelica.Blocks.Interfaces.RealInput u_CdTh if switchDetermine_CdTh == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "PR input, valid only when switchDetermine_PR==viaRealInput" annotation(
    Placement( transformation(origin = {-40, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {-40, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  Modelica.Blocks.Interfaces.RealInput u_Cd2 if switchDetermine_CdTh == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "PR input, valid only when switchDetermine_PR==viaRealInput" annotation(
    Placement( transformation(origin = {0, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {100, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    
  Modelica.Blocks.Interfaces.RealInput u_PR if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "PR input, valid only when switchDetermine_PR==viaRealInput" annotation(
    Placement( transformation(origin = {-80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {-80, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  
    
  //********************************************************************************
  
equation
  
  //--------------------
  if switchDetermine_m_flow_1 == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    m_flow_1_des = m_flow_1_par;
  elseif switchDetermine_m_flow_1 == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    m_flow_1_des = u_m_flow_1;
  end if;
  
  
  //--------------------
  if switchDetermine_AmechTh == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    AmechTh = AmechTh_par;
  elseif switchDetermine_AmechTh == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    AmechTh = u_AmechTh;
  end if;
  
  
  //--------------------
  if switchDetermine_Amech2 == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    Amech2 = Amech2_par;
  elseif switchDetermine_Amech2 == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    Amech2 = u_Amech2;
  end if;
  
  
  //--------------------
  if switchDetermine_Cv == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    CvDes = Cv_par;
  elseif switchDetermine_Cv == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    CvDes = u_Cv;
  end if;
  
  
  //--------------------
  if switchDetermine_CdTh == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    CdThDes = CdTh_par;
  elseif switchDetermine_Cv == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    CdThDes = u_CdTh;
  end if;
  
  
  //--------------------
  if switchDetermine_Cd2 == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    Cd2des = Cd2_par;
  elseif switchDetermine_Cv == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    Cd2des = u_Cd2;
  end if;
  
  
  //--------------------
  if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    PR = PR_par;
  elseif switchDetermine_Cv == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    PR = u_PR;
  end if;
  
  
  //--------------------
  port_1.m_flow= m_flow_1_des;
  Cv=CvDes;
  CdTh=CdThDes;
  Cd2= Cd2des;
  
  
  
  annotation(
    defaultComponentName = "Nzl"
    );
  
  
end NozzleDesignPoint00;