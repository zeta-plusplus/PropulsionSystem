within PropulsionSystem.Examples.temp;

block CmpCharTbl00_temp01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  
  Modelica.Blocks.Sources.Constant const_NcDes(k = 3000) annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_NcTblDes(k = 1.1) annotation(
    Placement(visible = true, transformation(origin = {-40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_RlineTblDes(k = Modelica.Constants.pi / 4) annotation(
    Placement(visible = true, transformation(origin = {-10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Subelements.ScalerDesCmp_WcPReffNc00 ScalerDesCmp annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_WcDes(k = 100) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_PRdes(k = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_effDes(k = 0.85) annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.CompressorTable_WcPReff_NcRline00 CmpTbl_WcPReff_NcRline annotation(
    Placement(visible = true, transformation(origin = {140, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Subelements.SclCmp_WcPReff00 SclCmp annotation(
    Placement(visible = true, transformation(origin = {200, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_RlineTbl(k = Modelica.Constants.pi / 4) annotation(
    Placement(visible = true, transformation(origin = {30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Nc(k = 9000) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor compressor1(redeclare package Medium = engineAir, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)  annotation(
    Placement(visible = true, transformation(origin = {250, 130}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 100)  annotation(
    Placement(visible = true, transformation(origin = {170, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, nPorts = 1, use_T_in = true, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {330, 170}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {370, 190}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver1 annotation(
    Placement(visible = true, transformation(origin = {370, 170}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {330, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {300, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {360, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {90, 190}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver2 annotation(
    Placement(visible = true, transformation(origin = {390, 130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(from_rpm1.u, VarBySolver2.y_independent) annotation(
    Line(points = {{372, 130}, {380, 130}, {380, 130}, {380, 130}}, color = {0, 0, 127}));
  connect(compressor1.flange_2, powerSensor1.flange_b) annotation(
    Line(points = {{280, 130}, {290, 130}, {290, 130}, {290, 130}}));
  connect(speed1.w_ref, from_rpm1.y) annotation(
    Line(points = {{342, 130}, {350, 130}, {350, 130}, {348, 130}}, color = {0, 0, 127}));
  connect(powerSensor1.flange_a, speed1.flange) annotation(
    Line(points = {{310, 130}, {320, 130}}));
  connect(compressor1.port_2, boundary1.ports[1]) annotation(
    Line(points = {{280, 154}, {300, 154}, {300, 170}, {320, 170}}, color = {0, 127, 255}));
  connect(boundary.ports[1], compressor1.port_1) annotation(
    Line(points = {{180, 170}, {200, 170}, {200, 154}, {220, 154}}, color = {0, 127, 255}));
  connect(SclCmp.y_effScld, compressor1.eff_in) annotation(
    Line(points = {{222, -52}, {262, -52}, {262, 119}}, color = {0, 0, 127}));
  connect(SclCmp.y_PRscld, compressor1.PR_in) annotation(
    Line(points = {{222, -40}, {250, -40}, {250, 113}}, color = {0, 0, 127}));
  connect(SclCmp.y_WcScld, compressor1.Wc_1_in) annotation(
    Line(points = {{222, -28}, {238, -28}, {238, 107}}, color = {0, 0, 127}));
  connect(boundary1.T_in, VarBySolver1.y_independent) annotation(
    Line(points = {{342, 174}, {352, 174}, {352, 170}, {360, 170}, {360, 170}}, color = {0, 0, 127}));
  connect(boundary1.m_flow_in, VarBySolver.y_independent) annotation(
    Line(points = {{340, 178}, {350, 178}, {350, 190}, {358, 190}, {358, 190}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_eff, SclCmp.u_eff) annotation(
    Line(points = {{162, -52}, {178, -52}, {178, -52}, {178, -52}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_PR, SclCmp.u_PR) annotation(
    Line(points = {{162, -40}, {178, -40}, {178, -40}, {178, -40}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_Wc, SclCmp.u_Wc) annotation(
    Line(points = {{162, -28}, {178, -28}, {178, -28}, {178, -28}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_effDes, SclCmp.u_s_eff) annotation(
    Line(points = {{62, 4}, {212, 4}, {212, -18}, {212, -18}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_PRdes, SclCmp.u_s_PR) annotation(
    Line(points = {{62, 12}, {200, 12}, {200, -18}, {200, -18}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_WcDes, SclCmp.u_s_Wc) annotation(
    Line(points = {{62, 28}, {188, 28}, {188, -18}, {188, -18}}, color = {0, 0, 127}));
  connect(const_Nc.y, division1.u1) annotation(
    Line(points = {{42, -30}, {64, -30}, {64, -24}, {78, -24}, {78, -24}}, color = {0, 0, 127}));
  connect(const_RlineTbl.y, CmpTbl_WcPReff_NcRline.u_RlineTbl) annotation(
    Line(points = {{42, -60}, {102, -60}, {102, -48}, {118, -48}, {118, -48}}, color = {0, 0, 127}));
  connect(division1.y, CmpTbl_WcPReff_NcRline.u_NcTbl) annotation(
    Line(points = {{102, -30}, {108, -30}, {108, -32}, {118, -32}, {118, -32}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_NcDes, division1.u2) annotation(
    Line(points = {{62, 36}, {68, 36}, {68, -36}, {78, -36}, {78, -36}}, color = {0, 0, 127}));
  connect(const_effDes.y, ScalerDesCmp.u_effDes) annotation(
    Line(points = {{-79, -30}, {7, -30}, {7, 4}, {18, 4}}, color = {0, 0, 127}));
  connect(const_PRdes.y, ScalerDesCmp.u_PRdes) annotation(
    Line(points = {{-59, -10}, {-1, -10}, {-1, 12}, {18, 12}}, color = {0, 0, 127}));
  connect(const_WcDes.y, ScalerDesCmp.u_WcDes) annotation(
    Line(points = {{-39, 10}, {-7, 10}, {-7, 28}, {18, 28}}, color = {0, 0, 127}));
  connect(const_NcDes.y, ScalerDesCmp.u_NcDes) annotation(
    Line(points = {{-19, 30}, {-12, 30}, {-12, 36}, {18, 36}}, color = {0, 0, 127}));
  connect(const_NcTblDes.y, ScalerDesCmp.u_NcTblDes) annotation(
    Line(points = {{-40, 80}, {-40, 52}, {24, 52}, {24, 42}}, color = {0, 0, 127}));
  connect(const_RlineTblDes.y, ScalerDesCmp.u_RlineTblDes) annotation(
    Line(points = {{-10, 69}, {-10, 58}, {32, 58}, {32, 42}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Diagram(coordinateSystem(extent = {{-100, -100}, {400, 200}})),
    __OpenModelica_commandLineOptions = "");
end CmpCharTbl00_temp01;
