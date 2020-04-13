within PropulsionSystem.Elements.BasicElements;

model IdealSpltCharFixed00
  extends PropulsionSystem.BaseClasses.BasicElements.IdealSplitterBase00;
  /********************************************************
                                imports
      ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  /********************************************************
              Declaration
      ********************************************************/
  parameter Boolean use_u_BPR = false "get BPR from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  
  
  /* ---------------------------------------------
                        parameters
      --------------------------------------------- */
  parameter Real BPR_paramInput = 10.0 "bypass ratio, valid only when use_u_BPR==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  
  /* ---------------------------------------------
                     Interface
      --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_BPR if use_u_BPR annotation(
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
  
  
  //********************************************************************************
initial equation
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  //--------------------
  if use_u_BPR == false then
    BPRdes = BPR_paramInput;
  elseif use_u_BPR == true then
    BPRdes = u_BPR;
  end if;
  //--------------------
  
  
equation
  /* ---------------------------------------------
    Connections, interface <-> internal variables   
  --------------------------------------------- */
//--------------------
  if use_u_BPR == false then
    BPR = BPR_paramInput;
  elseif use_u_BPR == true then
    BPR = u_BPR;
  end if;
//--------------------
  

/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Splt",
    Icon(graphics = {Line(origin = {79.9452, 50.0754}, points = {{-62, -46}, {-34, -12}, {-4, -12}}, thickness = 4, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 14)}, coordinateSystem(extent = {{-100, -60}, {100, 60}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end IdealSpltCharFixed00;
