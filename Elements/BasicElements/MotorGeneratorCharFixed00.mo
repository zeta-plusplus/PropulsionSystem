within PropulsionSystem.Elements.BasicElements;

model MotorGeneratorCharFixed00
  /********************************************************
                            imports
  ********************************************************/
  import Modelica.Constants;
  
  
  
  /********************************************************
         Declaration
  ********************************************************/
  /* ---------------------------------------------
            switch
  --------------------------------------------- */
  parameter Boolean use_u_pwr=true "get power extracted/supplied from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  parameter Boolean use_u_eff=false "get eff from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  parameter Boolean use_HeatPort_1=false "use heat port" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  
  
  /* ---------------------------------------------
          parameters
  --------------------------------------------- */
  parameter Modelica.SIunits.Power pwr_paramInput=10*1000 "adiabatic efficiency, valid only when use_u_pwr==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  parameter Real eff_paramInput=0.9 "motor/generator efficiency, valid only when use_u_eff==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  
  
  /* ---------------------------------------------
          Internal variables    
  --------------------------------------------- */
  
  
  
  
  
  /* ---------------------------------------------
           Interface
  --------------------------------------------- */
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1 annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_pwr if use_u_pwr annotation(
    Placement(visible = true, transformation(origin = {120, 40}, extent = {{20, -20}, {-20, 20}}, rotation = 0), iconTransformation(origin = {107, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Interfaces.RealInput u_eff if use_u_eff annotation(
    Placement(visible = true, transformation(origin = {-80, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealOutput y_pwr annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {107, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a HeatPort_1 if use_HeatPort_1 annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  
  
  
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName="MotGene",
    Icon(graphics = {Rectangle(origin = {1, 1}, fillColor = {165, 165, 165}, fillPattern = FillPattern.Solid, extent = {{-101, 9}, {71, -11}}), Text(origin = {-45, 76}, extent = {{-35, 4}, {125, -16}}, textString = "%name"), Ellipse(origin = {-73, -4}, fillColor = {0, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 0.75, extent = {{-16, 64}, {18, -56}}, endAngle = 360), Rectangle(origin = {7, -1}, fillColor = {0, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-80, 61}, {78, -59}}), Ellipse(origin = {85, -4}, fillColor = {0, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, lineThickness = 0.75, extent = {{-16, 64}, {16, -56}}, endAngle = 360), Text(origin = {-39, 27}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-43, 3}, {133, -45}}, textString = "Motor/Gene.", fontSize = 40)}, coordinateSystem(initialScale = 0.1)));
    
end MotorGeneratorCharFixed00;
