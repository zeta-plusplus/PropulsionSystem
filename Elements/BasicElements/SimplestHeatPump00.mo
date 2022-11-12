within PropulsionSystem.Elements.BasicElements;

model SimplestHeatPump00
  extends PropulsionSystem.BaseClasses.BasicElements.SimplestHeatPumpBase00;
  //----------
  import units= Modelica.SIunits;
  //----------
  parameter PropulsionSystem.Types.switches.switchHeatPumpCoP switchCoP= PropulsionSystem.Types.switches.switchHeatPumpCoP.CoP_c "";
  //----------
  Modelica.Blocks.Interfaces.RealInput u_CoP annotation(
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-108, -80}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
equation
  if(switchCoP==PropulsionSystem.Types.switches.switchHeatPumpCoP.CoP_h)then
    CoP_h= min(u_CoP, CoP_h_max);
  else
    CoP_c= min(u_CoP, CoP_c_max);
  end if;
  
annotation(
    defaultComponentName = "HeatPump",
    Diagram,
    Icon(graphics = {Line(origin = {-30.79, -12.79}, points = {{-69.207, -67.207}, {-29.207, -67.207}, {64.793, 54.793}}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Text(origin = {-79, -64}, extent = {{-17, 8}, {17, -8}}, textString = "CoP")}));
end SimplestHeatPump00;
