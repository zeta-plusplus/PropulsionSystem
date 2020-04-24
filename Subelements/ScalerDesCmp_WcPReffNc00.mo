within PropulsionSystem.Subelements;

block ScalerDesCmp_WcPReffNc00
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
  parameter Boolean use_tableFile_Wc=false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch about table file reading"));
  parameter Boolean use_tableFile_PR=false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch about table file reading"));
  parameter Boolean use_tableFile_eff=false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch about table file reading"));
  parameter PropulsionSystem.Types.switches.switchTableDataResource switchTableDataLocation=PropulsionSystem.Types.switches.switchTableDataResource.inLibraryDirectory "where table data file is located, valid if use_tableFile_..==true" annotation(
    Dialog(group="switch about table file reading")
  );
  
  parameter Modelica.Blocks.Types.Smoothness switchSmoothness_Wc
    =Modelica.Blocks.Types.Smoothness.ContinuousDerivative "" annotation(
    Dialog(group="switch about interpolation")
  );
  parameter Modelica.Blocks.Types.Smoothness switchSmoothness_PR
    =Modelica.Blocks.Types.Smoothness.ContinuousDerivative "" annotation(
    Dialog(group="switch about interpolation")
  );
  parameter Modelica.Blocks.Types.Smoothness switchSmoothness_eff
    =Modelica.Blocks.Types.Smoothness.ContinuousDerivative "" annotation(
    Dialog(group="switch about interpolation")
  );
  
  
  /* ---------------------------------------------
        parameters    
  --------------------------------------------- */
  parameter String pathName_tableFileInSimExeDir="./tableData/table_Compressor_WcPReff_NcRline00.txt" "relative path under sim. exe. file directory" annotation(
    Dialog(group = "table file read setting"));
  parameter String pathName_tableFileInLibPackage="modelica://PropulsionSystem/tableData/table_Compressor_WcPReff_NcRline00.txt" "path in library sub-directory" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_Wc="Wc_NcRline" "" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_PR="PR_NcRline" "" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_eff="eff_NcRline" "" annotation(
    Dialog(group = "table file read setting"));
  
  
  /* ---------------------------------------------
          Internal objects   
    --------------------------------------------- */
  PropulsionSystem.Subelements.CompressorTable_WcPReff_NcRline00 CmpTbl_WcPReff_NcRline_Des
  (
    use_tableFile_Wc= use_tableFile_Wc,
    use_tableFile_PR= use_tableFile_PR,
    use_tableFile_eff= use_tableFile_eff,
    switchTableDataLocation= switchTableDataLocation,
    switchSmoothness_Wc= switchSmoothness_Wc,
    switchSmoothness_PR= switchSmoothness_PR,
    switchSmoothness_eff= switchSmoothness_eff,
    pathName_tableFileInSimExeDir=pathName_tableFileInSimExeDir,
    pathName_tableFileInLibPackage=pathName_tableFileInLibPackage,
    tableName_Wc=tableName_Wc,
    tableName_PR=tableName_PR,
    tableName_eff=tableName_eff
  )
    "" annotation(
    Placement(visible = true, transformation(origin = {20, 60}, extent = {{-40, -40}, {40, 40}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {140, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division2 annotation(
    Placement(visible = true, transformation(origin = {140, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division3 annotation(
    Placement(visible = true, transformation(origin = {140, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division4 annotation(
    Placement(visible = true, transformation(origin = {140, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-50, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback2 annotation(
    Placement(visible = true, transformation(origin = {90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
  
  
  /* ---------------------------------------------
            Interface
  --------------------------------------------- */
  input Modelica.Blocks.Interfaces.RealInput u_NcTblDes annotation(
    Placement(visible = true, transformation(origin = {-80, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-80, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  input Modelica.Blocks.Interfaces.RealInput u_RlineTblDes annotation(
    Placement(visible = true, transformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  input Modelica.Blocks.Interfaces.RealInput u_NcDes annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_WcDes annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_PRdes annotation(
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_effDes annotation(
    Placement(visible = true, transformation(origin = {-120, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.SubelementBus subelementBus1 annotation(
    Placement(visible = true, transformation(origin = {0, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-80, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_s_NcDes annotation(
    Placement(visible = true, transformation(origin = {210, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_s_WcDes annotation(
    Placement(visible = true, transformation(origin = {210, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_s_PRdes annotation(
    Placement(visible = true, transformation(origin = {210, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_s_effDes annotation(
    Placement(visible = true, transformation(origin = {210, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
protected
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {60, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
equation
  connect(u_RlineTblDes, CmpTbl_WcPReff_NcRline_Des.u_RlineTbl) annotation(
    Line(points = {{-40, 120}, {-40, 44}, {-24, 44}}, color = {0, 0, 127}));
  connect(u_NcTblDes, CmpTbl_WcPReff_NcRline_Des.u_NcTbl) annotation(
    Line(points = {{-80, 120}, {-80, 76}, {-24, 76}}, color = {0, 0, 127}));
  connect(u_NcTblDes, division1.u2) annotation(
    Line(points = {{-80, 120}, {-80, -6}, {128, -6}}, color = {0, 0, 127}));
  connect(division1.y, y_s_NcDes) annotation(
    Line(points = {{152, 0}, {204, 0}, {204, 0}, {210, 0}}, color = {0, 0, 127}));
  connect(u_NcDes, division1.u1) annotation(
    Line(points = {{-120, 0}, {-50, 0}, {-50, 6}, {128, 6}, {128, 6}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline_Des.y_eff, division4.u2) annotation(
    Line(points = {{64, 36}, {76, 36}, {76, -126}, {128, -126}, {128, -126}}, color = {0, 0, 127}));
  connect(u_effDes, division4.u1) annotation(
    Line(points = {{-120, -120}, {-30, -120}, {-30, -114}, {128, -114}, {128, -114}}, color = {0, 0, 127}));
  connect(division4.y, y_s_effDes) annotation(
    Line(points = {{152, -120}, {202, -120}, {202, -120}, {210, -120}}, color = {0, 0, 127}));
  connect(division3.y, y_s_PRdes) annotation(
    Line(points = {{152, -80}, {204, -80}, {204, -80}, {210, -80}}, color = {0, 0, 127}));
  connect(division2.y, y_s_WcDes) annotation(
    Line(points = {{152, -40}, {202, -40}, {202, -40}, {210, -40}}, color = {0, 0, 127}));
  connect(feedback2.y, division3.u2) annotation(
    Line(points = {{90, -58}, {90, -58}, {90, -86}, {128, -86}, {128, -86}}, color = {0, 0, 127}));
  connect(const1.y, feedback2.u2) annotation(
    Line(points = {{72, -50}, {82, -50}, {82, -50}, {82, -50}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline_Des.y_PR, feedback2.u1) annotation(
    Line(points = {{64, 60}, {90, 60}, {90, -42}, {90, -42}}, color = {0, 0, 127}));
  connect(feedback1.y, division3.u1) annotation(
    Line(points = {{-40, -80}, {54, -80}, {54, -74}, {128, -74}, {128, -74}}, color = {0, 0, 127}));
  connect(u_PRdes, feedback1.u1) annotation(
    Line(points = {{-120, -80}, {-58, -80}, {-58, -80}, {-58, -80}}, color = {0, 0, 127}));
  connect(const.y, feedback1.u2) annotation(
    Line(points = {{-58, -100}, {-50, -100}, {-50, -88}, {-50, -88}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline_Des.y_Wc, division2.u2) annotation(
    Line(points = {{64, 84}, {106, 84}, {106, -46}, {128, -46}}, color = {0, 0, 127}));
  connect(u_WcDes, division2.u1) annotation(
    Line(points = {{-120, -40}, {-18, -40}, {-18, -34}, {128, -34}, {128, -34}}, color = {0, 0, 127}));
  annotation(
    defaultComponentName="ScalerDesCmp",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {1, -90}, extent = {{-101, 10}, {99, -10}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
    Diagram(coordinateSystem(extent = {{-100, -160}, {200, 100}})),
    __OpenModelica_commandLineOptions = "");
    
end ScalerDesCmp_WcPReffNc00;
