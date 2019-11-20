within PropulsionSystem;

model Utilities
  extends Modelica.Icons.UtilitiesPackage;

  model SetIndependent
    //********** internal variables **********
    Real independent(start= independent_init);
    //********** initialization parameters **********
    parameter Real independent_init= 1.0
      ""
      annotation(Dialog(tab="Initialization"));
    
    
    Modelica.Blocks.Interfaces.RealOutput independent_out
      ""
      annotation(
      Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  equation
    
    independent= independent_out;
    
  /********************************************************
    Graphics
  ********************************************************/
  
    annotation(
      Icon(graphics = {Rectangle(origin = {0, -1}, fillColor = {225, 225, 225}, fillPattern = FillPattern.Solid, extent = {{-100, 101}, {100, -99}}), Text(origin = {-12, -95}, extent = {{-88, 15}, {112, -5}}, textString = "%name"), Text(origin = {-9, 22}, extent = {{-91, 18}, {109, -62}}, textString = "Free to Vary", fontSize = 26)}, coordinateSystem(initialScale = 0.1)));
  
  end SetIndependent;





  model SetDependent
    //********** Parameters **********
    parameter Real tgtVal
      ""
      annotation(
      Dialog(group = "Characteristics"));
    //----- switches -----
    parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_tgtVal
        =PropulsionSystem.Types.switches.switch_parameter_input.use_desValue
     ""
      annotation(
      Dialog(group = "switch"),
      choicesAllMatching= true,   
      Evaluate = true,
      HideResult = true
      );
    //********** Interfaces **********
    Modelica.Blocks.Interfaces.RealInput dependent_in
      annotation(
      Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
    Modelica.Blocks.Interfaces.RealInput tgtVal_in
      if (switchInput_tgtVal== PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)
      ""
      annotation(
      Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    
    
    
    
    
  equation
    
    if(switchInput_tgtVal ==PropulsionSystem.Types.switches.switch_parameter_input.use_desValue)then
      tgtVal= dependent_in;
    elseif (switchInput_tgtVal== PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)then
      tgtVal_in= dependent_in;
    end if;
    
    
  /********************************************************
    Graphics
  ********************************************************/
    
    annotation(
      Diagram,
      Icon(graphics = {Rectangle(fillColor = {39, 39, 39}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-3, -83}, lineColor = {255, 255, 255}, extent = {{-97, 3}, {103, -17}}, textString = "%name"), Text(origin = {-3, 37}, lineColor = {255, 255, 255}, extent = {{-97, 3}, {103, -57}}, textString = "Constraint", fontSize = 28), Text(origin = {-3, -43}, lineColor = {255, 255, 255}, extent = {{-97, 3}, {103, -17}}, textString = "%tgtVal"), Text(origin = {-3, -23}, lineColor = {255, 255, 255}, extent = {{-97, 3}, {103, -17}}, textString = "Tgt. val. =", horizontalAlignment = TextAlignment.Left)}, coordinateSystem(initialScale = 0.1)));
    
    
  end SetDependent;










  block SplitFlow_by_BPR
    //********** Parameters **********
    parameter Real BPRdes=10
      ""
      annotation(
      Dialog(group = "Characteristics"));
    //----- switches -----
    parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_BPR
        =PropulsionSystem.Types.switches.switch_parameter_input.use_desValue
     ""
      annotation(
      Dialog(group = "switch"),
      choicesAllMatching= true,   
      Evaluate = true,
      HideResult = true
      );
    
    
    Real BPR;
    //********** Interfaces **********
    Modelica.Blocks.Interfaces.RealInput flow_total annotation(
      Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput flow_secondary annotation(
      Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealOutput flow_primary annotation(
      Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Interfaces.RealInput BPR_in
      if (switchInput_BPR== PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)
      ""
      annotation(
      Placement(visible = true, transformation(origin = {-80, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-80, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    
    
  algorithm
    
    flow_secondary:= flow_total * BPR/(1.0+BPR);
    flow_primary:= flow_total * 1.0/(1.0+BPR);
    
  equation
    
    if (switchInput_BPR== PropulsionSystem.Types.switches.switch_parameter_input.use_desValue)then
      BPR=BPRdes;
    elseif (switchInput_BPR== PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)then
      BPR=BPR_in;
    end if;
//##### none #####
/********************************************************
    Graphics
  ********************************************************/
  annotation(
      Icon(graphics = {Rectangle(fillColor = {209, 209, 209}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {43, 41}, extent = {{-7, 14}, {57, -16}}, textString = "Sec.", fontSize = 25, horizontalAlignment = TextAlignment.Right), Text(origin = {41, -33}, extent = {{-5, 6}, {57, -16}}, textString = "Pri.", fontSize = 25, horizontalAlignment = TextAlignment.Right), Text(origin = {-93, 5}, extent = {{-7, 14}, {65, -24}}, textString = "Total", fontSize = 25, horizontalAlignment = TextAlignment.Right), Line(origin = {6, 27}, points = {{-30, -25}, {-6, -25}, {-6, 15}, {26, 15}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Line(origin = {17.09, -22.51}, points = {{-17, 25}, {-17, -17}, {15, -17}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Text(origin = {2, -83}, extent = {{-102, 13}, {98, -7}}, textString = "%name"), Text(origin = {2, 87}, extent = {{-102, 13}, {98, -7}}, textString = "BPR= %BPR")}));
  
  
  end SplitFlow_by_BPR;




























end Utilities;
