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
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_CdTh = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine CdTh" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_Cv = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine Cv" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_AmechTh = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated "switch how to determine AmechTh" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  
  /* ---------------------------------------------
          parameters
  --------------------------------------------- */
  parameter Real CdThDes_paramInput = 0.99 "discharge coefficient at throat, valid only when switchDetermine_CdTh==param, value fixed through simulation" annotation(
    Dialog(group = "Characteristics"));
  parameter Real CvDes_paramInput = 0.99 "flow velocity coefficient, valid only when switchDetermine_Cv==param, value fixed through simulation" annotation(
    Dialog(group = "Characteristics"));
  parameter Modelica.SIunits.Area AmechTh_paramInput= 0.01 "Throat mechanical area, valid only when switchDetermine_AmechTh==param, value fixed through simulation" annotation(
    Dialog(group = "Geometry"));
  
  /* ---------------------------------------------
          Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_CdTh 
    if switchDetermine_CdTh == 
      PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "CdTh input, valid only when switchDetermine_CdTh==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-80, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {-40, -77}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  
  Modelica.Blocks.Interfaces.RealInput u_Cv 
    if switchDetermine_Cv == 
      PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "Cv input, valid only when switchDetermine_Cv==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-40, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {0, -65}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  
  Modelica.Blocks.Interfaces.RealInput u_AmechTh 
    if switchDetermine_AmechTh ==
      PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "AmechTh input, valid only when switchDetermine_AmechTh==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {0, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {60, -93}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  
  
algorithm
//##### none #####
equation

//--------------------
  if (switchDetermine_CdTh == PropulsionSystem.Types.switches.switchHowToDetVar.param) then
    CdThDes = CdThDes_paramInput;
  elseif (switchDetermine_CdTh == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) then
    CdThDes = u_CdTh;
  end if;
//--------------------
  if (switchDetermine_Cv == PropulsionSystem.Types.switches.switchHowToDetVar.param) then
    CvDes = CvDes_paramInput;
  elseif (switchDetermine_Cv == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) then
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
    Icon(graphics = {Line(origin = {60.16, 13.94}, points = {{0, 25}, {0, -53}}, thickness = 5), Line(origin = {60, -60}, points = {{0, 34}, {0, -36}}, thickness = 1)}));
    
    
    
end NzlCharFixed00;
