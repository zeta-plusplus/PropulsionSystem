within PropulsionSystem.Elements.BasicElements;

model EnginePerformance
  import Modelica.Constants;
  /********************************************************
     Declaration
    ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Parameters **********
  //##### none #####
  parameter Boolean use_FdScrub_in = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true));
  //********** Internal variables **********
  Modelica.SIunits.Force Fg;
  Modelica.SIunits.Force Fram;
  Modelica.SIunits.Force FdScrub;
  Modelica.SIunits.MassFlowRate dm_fuel;
  Modelica.SIunits.Force Fn(start = 1.0);
  Real TSFC "";
  Real TSFC_Bt "";
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput Fg_in annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput Fram_in annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput dm_fuel_in annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput FdScrub_in if use_FdScrub_in annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput Fn_out annotation(
    Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput TSFC_out annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput TSFC_Bt_out annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********** Initialization **********
  //##### none #####
  //********** Protected objects **********
  //##### none #####
  /********************************************************
      Model coding
    ********************************************************/
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
  if use_FdScrub_in == true then
    FdScrub = FdScrub_in;
  else
    FdScrub = 0.0;
  end if;
  Fg = Fg_in;
  Fram = Fram_in;
  dm_fuel = dm_fuel_in;
  Fn_out = Fn;
  TSFC_out = TSFC;
  TSFC_Bt_out = TSFC_Bt;
//********** Eqns describing physics **********
  Fn = Fg - Fram - FdScrub;
  TSFC = dm_fuel / Fn;
  TSFC_Bt = TSFC * 2.0;
/********************************************************
  Graphics
********************************************************/

  annotation(
    Diagram(coordinateSystem(initialScale = 0.1)),
  Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {-8, 4}, fillColor = {229, 229, 229}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-92, 96}, {108, -104}}), Text(origin = {-26, 8}, fillColor = {232, 232, 232}, extent = {{-74, 32}, {126, -48}}, textString = "Perf.")}));


end EnginePerformance;
