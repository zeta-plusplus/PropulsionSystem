within PropulsionSystem.Subelements;

block Combustion00
  extends PropulsionSystem.Icons.Icon_Combustion;
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
    Icon(graphics = {Text(origin = {7, -86}, extent = {{-107, 6}, {93, -14}}, textString = "%name")}));
  
  
  
end Combustion00;
