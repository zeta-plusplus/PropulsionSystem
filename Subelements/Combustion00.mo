within PropulsionSystem.Subelements;

block Combustion00
  
  /********************************************************
            imports   
  ********************************************************/
  import Modelica.Constants;
  
  
  
  /********************************************************
                   Declaration
  ********************************************************/
  /* ---------------------------------------------
        Internal variables    
  --------------------------------------------- */
  Modelica.SIunits.MassFlowRate m_flow_fuel;
  Modelica.SIunits.SpecificEnthalpy LHV_fuel;
  Real effComb;
  Modelica.SIunits.HeatFlowRate Qcomb;
  
  
  
  
  /* ---------------------------------------------
        Interface   
  --------------------------------------------- */
  input Modelica.Blocks.Interfaces.RealInput u_m_flow_fuel(quantity="MassFlowRate", unit="kg/s", displayUnit="kg/s") "[kg/s], mass flow rate of fuel" annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  input Modelica.Blocks.Interfaces.RealInput u_LHV_fuel(quantity="SpecificEnthalpy", unit="J/kg",displayUnit="J/kg") "[J/kg],  lower heating value of fuel" annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  input Modelica.Blocks.Interfaces.RealInput u_effComb "[nond], combustion efficiency" annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  output Modelica.Blocks.Interfaces.RealOutput y_m_flow_fuel(quantity="MassFlowRate", unit="kg/s", displayUnit="kg/s") "[kg/s], mass flow rate of fuel" annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_Qcomb(quantity="HeatFlowRate", unit="W", displayUnit="W") annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Types.SubelementBus subelementBus1 annotation(
    Placement(visible = true, transformation(origin = {80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
algorithm
  /* ---------------------------------------------
  Connections, interface <-> internal variables   
  --------------------------------------------- */
  m_flow_fuel:= u_m_flow_fuel;
  LHV_fuel:= u_LHV_fuel;
  effComb:= u_effComb;
  
  
  /* ---------------------------------------------
  Eqns describing physics   
  --------------------------------------------- */
  if(m_flow_fuel>0.0)then
    Qcomb:= m_flow_fuel * LHV_fuel * effComb;
  else
    Qcomb:= 0.0;
  end if;
  
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables   
  --------------------------------------------- */
  y_m_flow_fuel:= m_flow_fuel;
  y_Qcomb:= Qcomb;
    
  
  
/********************************************************
  Graphics
********************************************************/
  
  
  annotation(
    defaultComponentName = "Combustion",
    Icon(graphics = {Rectangle(origin = {1, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-101, 100}, {99, -100}}), Text(origin = {7, -86}, extent = {{-107, 6}, {93, -14}}, textString = "%name"), Polygon(origin = {-4, -9}, rotation = 90, lineColor = {184, 9, 55}, fillColor = {255, 11, 27}, fillPattern = FillPattern.Solid, lineThickness = 1.5, points = {{-68, -3}, {-64, 15}, {-54, 31}, {-38, 41}, {-14, 51}, {12, 51}, {38, 39}, {58, 25}, {76, 11}, {98, -11}, {64, 1}, {44, 5}, {28, 5}, {14, -1}, {0, -11}, {-10, -27}, {-22, -37}, {-40, -41}, {-56, -35}, {-66, -21}, {-68, -3}}), Polygon(origin = {-11, -33}, rotation = 90, lineColor = {217, 140, 7}, fillColor = {255, 183, 1}, fillPattern = FillPattern.Solid, points = {{-31, 3}, {-23, 11}, {-15, 15}, {-1, 19}, {11, 21}, {23, 19}, {37, 15}, {23, 11}, {7, 3}, {-1, -7}, {-5, -17}, {-15, -25}, {-27, -25}, {-35, -17}, {-37, -9}, {-31, 3}})}));
  
  
  
end Combustion00;
