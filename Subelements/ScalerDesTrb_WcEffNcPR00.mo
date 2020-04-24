within PropulsionSystem.Subelements;

block ScalerDesTrb_WcEffNcPR00
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
  parameter Boolean use_tableFile_Wc = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch about table file reading"));
  parameter Boolean use_tableFile_eff = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch about table file reading"));
  parameter PropulsionSystem.Types.switches.switchTableDataResource switchTableDataLocation = PropulsionSystem.Types.switches.switchTableDataResource.inLibraryDirectory "where table data file is located, valid if use_tableFile_..==true" annotation(
    Dialog(group = "switch about table file reading"));
  parameter Modelica.Blocks.Types.Smoothness switchSmoothness_Wc = Modelica.Blocks.Types.Smoothness.ContinuousDerivative "" annotation(
    Dialog(group = "switch about interpolation"));
  parameter Modelica.Blocks.Types.Smoothness switchSmoothness_eff = Modelica.Blocks.Types.Smoothness.ContinuousDerivative "" annotation(
    Dialog(group = "switch about interpolation"));
  /* ---------------------------------------------
            parameters    
      --------------------------------------------- */
  parameter String pathName_tableFileInSimExeDir = "./tableData/table_Compressor_WcPReff_NcRline00.txt" "relative path under sim. exe. file directory" annotation(
    Dialog(group = "table file read setting"));
  parameter String pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Compressor_WcPReff_NcRline00.txt" "path in library sub-directory" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_Wc = "Wc_NcRline" "" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_eff = "eff_NcRline" "" annotation(
    Dialog(group = "table file read setting"));
  /* ---------------------------------------------
              Internal objects   
        --------------------------------------------- */
  PropulsionSystem.Subelements.TurbineTable_WcEff_NcPR00 TrbTbl_WcEff_NcPR 
  (
    use_tableFile_Wc= use_tableFile_Wc,
    use_tableFile_eff= use_tableFile_eff,
    switchTableDataLocation= switchTableDataLocation,
    switchSmoothness_Wc= switchSmoothness_Wc,
    switchSmoothness_eff= switchSmoothness_eff,
    pathName_tableFileInSimExeDir=pathName_tableFileInSimExeDir,
    pathName_tableFileInLibPackage=pathName_tableFileInLibPackage,
    tableName_Wc=tableName_Wc,
    tableName_eff=tableName_eff
  )
  ""
  annotation(
    Placement(visible = true, transformation(origin = {40, 60}, extent = {{-40, -40}, {40, 40}}, rotation = 0)));
  
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division2 annotation(
    Placement(visible = true, transformation(origin = {150, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division3 annotation(
    Placement(visible = true, transformation(origin = {150, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division4 annotation(
    Placement(visible = true, transformation(origin = {150, -142}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {56, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  /* ---------------------------------------------
                Interface
      --------------------------------------------- */
  input Modelica.Blocks.Interfaces.RealInput u_NcTblDes annotation(
    Placement(visible = true, transformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-80, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  input Modelica.Blocks.Interfaces.RealInput u_PRtblDes annotation(
    Placement(visible = true, transformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  input Modelica.Blocks.Interfaces.RealInput u_NcDes annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_WcDes annotation(
    Placement(visible = true, transformation(origin = {-120, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_PRdes annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_effDes annotation(
    Placement(visible = true, transformation(origin = {-120, -140}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.SubelementBus subelementBus1 annotation(
    Placement(visible = true, transformation(origin = {0, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_s_NcDes annotation(
    Placement(visible = true, transformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_s_WcDes annotation(
    Placement(visible = true, transformation(origin = {210, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_s_PRdes annotation(
    Placement(visible = true, transformation(origin = {210, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_s_effDes annotation(
    Placement(visible = true, transformation(origin = {210, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
  
protected
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(u_NcTblDes, TrbTbl_WcEff_NcPR.u_NcTbl) annotation(
    Line(points = {{-60, 120}, {-60, 76}, {-4, 76}}, color = {0, 0, 127}));
  connect(u_NcTblDes, division1.u2) annotation(
    Line(points = {{-60, 120}, {-60, -6}, {138, -6}}, color = {0, 0, 127}));
  connect(const1.y, feedback2.u2) annotation(
    Line(points = {{-39, -30}, {-29, -30}, {-29, -30}, {-29, -30}}, color = {0, 0, 127}));
  connect(u_PRtblDes, feedback2.u1) annotation(
    Line(points = {{-20, 120}, {-20, -22}}, color = {0, 0, 127}));
  connect(feedback2.y, division3.u2) annotation(
    Line(points = {{-20, -39}, {-20, -66}, {138, -66}}, color = {0, 0, 127}));
  connect(u_PRtblDes, TrbTbl_WcEff_NcPR.u_PRtbl) annotation(
    Line(points = {{-20, 120}, {-20, 44}, {-4, 44}}, color = {0, 0, 127}));
  connect(TrbTbl_WcEff_NcPR.y_eff, division4.u2) annotation(
    Line(points = {{84, 44}, {102, 44}, {102, -148}, {138, -148}}, color = {0, 0, 127}));
  connect(TrbTbl_WcEff_NcPR.y_Wc, division2.u2) annotation(
    Line(points = {{84, 76}, {108, 76}, {108, -106}, {138, -106}, {138, -106}}, color = {0, 0, 127}));
  connect(division4.y, y_s_effDes) annotation(
    Line(points = {{161, -142}, {181, -142}, {181, -140}, {210, -140}}, color = {0, 0, 127}));
  connect(u_effDes, division4.u1) annotation(
    Line(points = {{-120, -140}, {4, -140}, {4, -136}, {138, -136}}, color = {0, 0, 127}));
  connect(u_WcDes, division2.u1) annotation(
    Line(points = {{-120, -100}, {4, -100}, {4, -94}, {138, -94}}, color = {0, 0, 127}));
  connect(division2.y, y_s_WcDes) annotation(
    Line(points = {{161, -100}, {210, -100}}, color = {0, 0, 127}));
  connect(feedback1.y, division3.u1) annotation(
    Line(points = {{65, -60}, {96, -60}, {96, -54}, {138, -54}}, color = {0, 0, 127}));
  connect(division3.y, y_s_PRdes) annotation(
    Line(points = {{161, -60}, {209, -60}}, color = {0, 0, 127}));
  connect(u_NcDes, division1.u1) annotation(
    Line(points = {{-120, 0}, {-50, 0}, {-50, 6}, {138, 6}}, color = {0, 0, 127}));
  connect(division1.y, y_s_NcDes) annotation(
    Line(points = {{161, 0}, {210, 0}}, color = {0, 0, 127}));
  connect(const.y, feedback1.u2) annotation(
    Line(points = {{41, -30}, {56.5, -30}, {56.5, -52}, {56, -52}}, color = {0, 0, 127}));
  connect(u_PRdes, feedback1.u1) annotation(
    Line(points = {{-120, -60}, {48, -60}}, color = {0, 0, 127}));
  annotation(
    defaultComponentName = "ScalerDesTrb",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {1, -90}, extent = {{-101, 10}, {99, -10}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
    Diagram(coordinateSystem(extent = {{-100, -160}, {200, 100}})),
    __OpenModelica_commandLineOptions = "");
end ScalerDesTrb_WcEffNcPR00;
