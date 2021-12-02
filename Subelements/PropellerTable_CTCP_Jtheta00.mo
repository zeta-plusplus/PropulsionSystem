within PropulsionSystem.Subelements;

block PropellerTable_CTCP_Jtheta00
  extends PropulsionSystem.Icons.Icon_PropellerTable_CTCP_Jtheta00;
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
  parameter Boolean use_tableFile_CT = true "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch about table file reading"));
  parameter Boolean use_tableFile_CP = true "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch about table file reading"));
  parameter PropulsionSystem.Types.switches.switchTableDataResource switchTableDataLocation = PropulsionSystem.Types.switches.switchTableDataResource.inLibraryDirectory "where table data file is located, valid if use_tableFile_..==true" annotation(
    Dialog(group = "switch about table file reading"));
  parameter Modelica.Blocks.Types.Smoothness switchSmoothness_CT = Modelica.Blocks.Types.Smoothness.ContinuousDerivative "" annotation(
    Dialog(group = "switch about interpolation"));
  parameter Modelica.Blocks.Types.Smoothness switchSmoothness_CP = Modelica.Blocks.Types.Smoothness.ContinuousDerivative "" annotation(
    Dialog(group = "switch about interpolation"));
  parameter Boolean printCmd = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(tab = "debug setting"));
  /* ---------------------------------------------
            parameters    
      --------------------------------------------- */
  parameter String pathName_tableFileInSimExeDir = "./tableData/table_Propeller_CTCP_Jtheta00.txt" "relative path under sim. exe. file directory" annotation(
    Dialog(group = "table file read setting"));
  parameter String pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Propeller_CTCP_Jtheta00.txt" "path in library sub-directory" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_CT = "CT_Jtheta" "" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_CP = "CP_Jtheta" "" annotation(
    Dialog(group = "table file read setting"));
  /* ---------------------------------------------
            Internal objects   
      --------------------------------------------- */
  Modelica.Blocks.Tables.CombiTable2D combiTable2D_CT(table = tableDefault_CT_Jtheta, tableOnFile = use_tableFile_CT, fileName = fullPathName_tableFile_used, tableName = tableName_CT, smoothness = switchSmoothness_CT) "" annotation(
    Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2D combiTable2D_CP(table = tableDefault_CP_Jtheta, tableOnFile = use_tableFile_CP, fileName = fullPathName_tableFile_used, tableName = tableName_CP, smoothness = switchSmoothness_CP) "" annotation(
    Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  /* ---------------------------------------------
              Interface
      --------------------------------------------- */
  PropulsionSystem.Types.SubelementBus subelementBus1 annotation(
    Placement(visible = true, transformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_J "[nond]" annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_theta(quantity="Angle", unit="deg", displayUnit="deg") "[deg]" annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_CT "[nond]" annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_CP "[nond]" annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
protected
  parameter String fullPathName_tableFileInSimExeDir = Modelica.Utilities.Files.fullPathName(pathName_tableFileInSimExeDir) "" annotation(
    HideResult = false);
  parameter String fullPathName_tableFileInLibPackage = Modelica.Utilities.Files.loadResource(pathName_tableFileInLibPackage) "" annotation(
    HideResult = false);
  parameter String fullPathName_tableFile_used = if switchTableDataLocation == PropulsionSystem.Types.switches.switchTableDataResource.inSimExeDirectory then fullPathName_tableFileInSimExeDir elseif switchTableDataLocation == PropulsionSystem.Types.switches.switchTableDataResource.inLibraryDirectory then fullPathName_tableFileInLibPackage else fullPathName_tableFileInLibPackage "" annotation(
    HideResult = false);
  parameter Integer sizeTbl_CT[2](each fixed = false) "" annotation(
    HideResult = false);
  parameter Integer sizeTbl_CP[2](each fixed = false) "" annotation(
    HideResult = false);
  parameter Integer n_CT(fixed = false) "" annotation(
    HideResult = false);
  parameter Integer n_CP(fixed = false) "" annotation(
    HideResult = false);
  parameter Real tableDefault_CT_Jtheta[:, :]=
    [	0.00000	,	15.00000	,	20.00000	,	25.00000	,	30.00000	,	35.00000	,	40.00000	,	45.00000	;
	0.00000	,	0.14000	,	0.15700	,	0.16000	,	0.16700	,	0.17400	,	0.17800	,	0.18000	;
	0.20000	,	0.11800	,	0.15100	,	0.15500	,	0.16300	,	0.17000	,	0.17500	,	0.18200	;
	0.40000	,	0.08500	,	0.12600	,	0.15200	,	0.15700	,	0.16400	,	0.17200	,	0.18500	;
	0.60000	,	0.04800	,	0.09200	,	0.13500	,	0.15300	,	0.16000	,	0.16600	,	0.18700	;
	0.80000	,	0.00400	,	0.05200	,	0.10000	,	0.14300	,	0.15500	,	0.15800	,	0.17800	;
	1.00000	,	-0.03000	,	0.01000	,	0.06000	,	0.11200	,	0.14600	,	0.14700	,	0.16700	;
	1.20000	,	-0.03000	,	-0.03000	,	0.02000	,	0.07200	,	0.12000	,	0.14600	,	0.16000	;
	1.40000	,	-0.03000	,	-0.03000	,	-0.02000	,	0.03000	,	0.08200	,	0.13000	,	0.15800	;
	1.60000	,	-0.03000	,	-0.03000	,	-0.02000	,	-0.00900	,	0.04500	,	0.09800	,	0.15300	;
	1.80000	,	-0.03000	,	-0.03000	,	-0.02000	,	-0.00900	,	0.00800	,	0.06500	,	0.12800	;
	2.00000	,	-0.03000	,	-0.03000	,	-0.02000	,	-0.00900	,	-0.03000	,	0.03200	,	0.10200	;
	2.20000	,	-0.03000	,	-0.03000	,	-0.02000	,	-0.00900	,	-0.03000	,	0.00000	,	0.07200	;
	2.40000	,	-0.03000	,	-0.03000	,	-0.02000	,	-0.00900	,	-0.03000	,	-0.01000	,	0.04000	;
	2.60000	,	-0.03000	,	-0.03000	,	-0.02000	,	-0.00900	,	-0.03000	,	-0.01000	,	0.00900	;
	2.80000	,	-0.03000	,	-0.03000	,	-0.02000	,	-0.00900	,	-0.03000	,	-0.01000	,	-0.02000	]
 "CT=f(J, theta)" annotation(
    Dialog(group = "default table"),
    HideResult = true);
  parameter Real tableDefault_CP_Jtheta[:, :]=
    [	0.00000	,	15.00000	,	20.00000	,	25.00000	,	30.00000	,	35.00000	,	40.00000	,	45.00000	;
	0.00000	,	0.06000	,	0.09000	,	0.15000	,	0.21200	,	0.26400	,	0.31000	,	0.39000	;
	0.20000	,	0.05800	,	0.08800	,	0.13800	,	0.19800	,	0.25200	,	0.30600	,	0.39200	;
	0.40000	,	0.05000	,	0.08500	,	0.12800	,	0.18400	,	0.23800	,	0.29800	,	0.39100	;
	0.60000	,	0.03500	,	0.07300	,	0.12000	,	0.17100	,	0.22300	,	0.28700	,	0.38300	;
	0.80000	,	0.00400	,	0.04800	,	0.10000	,	0.15800	,	0.21100	,	0.27000	,	0.36700	;
	1.00000	,	-0.04000	,	0.01100	,	0.07000	,	0.13800	,	0.19900	,	0.25100	,	0.34700	;
	1.20000	,	-0.04000	,	-0.04000	,	0.02700	,	0.10000	,	0.17700	,	0.24800	,	0.33300	;
	1.40000	,	-0.04000	,	-0.04000	,	-0.02600	,	0.05000	,	0.13800	,	0.22800	,	0.32800	;
	1.60000	,	-0.04000	,	-0.04000	,	-0.02600	,	-0.01000	,	0.08400	,	0.19000	,	0.32100	;
	1.80000	,	-0.04000	,	-0.04000	,	-0.02600	,	-0.01000	,	0.02500	,	0.14000	,	0.28500	;
	2.00000	,	-0.04000	,	-0.04000	,	-0.02600	,	-0.01000	,	-0.04000	,	0.08800	,	0.24200	;
	2.20000	,	-0.04000	,	-0.04000	,	-0.02600	,	-0.01000	,	-0.04000	,	0.03000	,	0.19800	;
	2.40000	,	-0.04000	,	-0.04000	,	-0.02600	,	-0.01000	,	-0.04000	,	-0.03000	,	0.14000	;
	2.60000	,	-0.04000	,	-0.04000	,	-0.02600	,	-0.01000	,	-0.04000	,	-0.03000	,	0.06000	;
	2.80000	,	-0.04000	,	-0.04000	,	-0.02600	,	-0.01000	,	-0.04000	,	-0.03000	,	-0.02000	]
 "CP=f(J, theta)" annotation(
    Dialog(group = "default table"),
    HideResult = true);
  //********************************************************************************
initial algorithm
  if printCmd == true then
    print("----- msg at initialization -----" + "\n");
    print("     instance: " + String(getInstanceName()) + "\n");
    print("file read by this component= " + fullPathName_tableFile_used + "\n");
    print("----- end msg at initialization, " + String(getInstanceName()) + " -----" + "\n");
  end if;
initial equation
  sizeTbl_CT = size(combiTable2D_CT.table);
  sizeTbl_CP = size(combiTable2D_CP.table);
  n_CT = sizeTbl_CT[0] * sizeTbl_CT[1];
  n_CP = sizeTbl_CP[0] * sizeTbl_CP[1];
equation
  connect(u_theta, combiTable2D_CP.u2) annotation(
    Line(points = {{-120, -40}, {-42, -40}, {-42, -66}, {-22, -66}, {-22, -66}}, color = {0, 0, 127}));
  connect(u_theta, combiTable2D_CT.u2) annotation(
    Line(points = {{-120, -40}, {-50, -40}, {-50, 54}, {-22, 54}, {-22, 54}}, color = {0, 0, 127}));
  connect(combiTable2D_CT.y, y_CT) annotation(
    Line(points = {{2, 60}, {110, 60}}, color = {0, 0, 127}));
  connect(combiTable2D_CP.y, y_CP) annotation(
    Line(points = {{2, -60}, {110, -60}}, color = {0, 0, 127}));
  connect(u_J, combiTable2D_CT.u1) annotation(
    Line(points = {{-120, 40}, {-72, 40}, {-72, 66}, {-22, 66}}, color = {0, 0, 127}));
  connect(u_J, combiTable2D_CP.u1) annotation(
    Line(points = {{-120, 40}, {-72, 40}, {-72, -54}, {-22, -54}}, color = {0, 0, 127}));
  annotation(
    defaultComponentName = "PropTbl_CTCP_Jtheta",
    Diagram,
    Icon(graphics = {Text(origin = {0, -112}, extent = {{-100, 8}, {100, -8}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end PropellerTable_CTCP_Jtheta00;
