within PropulsionSystem.Subelements;

block TurbineTable_WcEff_NcPR00
  extends PropulsionSystem.Icons.Icon_TurbineTable_WcEff_NcPR00;
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
  parameter Boolean printCmd = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(tab = "debug setting"));
  
  
  /* ---------------------------------------------
          parameters    
    --------------------------------------------- */
  parameter String pathName_tableFileInSimExeDir = "./tableData/table_Turbine_WcEff_NcPR00.txt" "relative path under sim. exe. file directory" annotation(
    Dialog(group = "table file read setting"));
  parameter String pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Turbine_WcEff_NcPR00.txt" "path in library sub-directory" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_Wc = "Wc_NcPR" "" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_eff = "eff_NcPR" "" annotation(
    Dialog(group = "table file read setting"));
  
  
  /* ---------------------------------------------
          Internal objects   
    --------------------------------------------- */
  Modelica.Blocks.Tables.CombiTable2Ds combiTable2D_Wc
  (
  table = tableDefault_Wc_NcPR, 
  tableOnFile = use_tableFile_Wc, 
  fileName = fullPathName_tableFile_used, 
  tableName = tableName_Wc, 
  smoothness = switchSmoothness_Wc
  ) "" annotation(
    Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Tables.CombiTable2Ds combiTable2D_eff
  (
  table = tableDefault_eff_NcPR, 
  tableOnFile = use_tableFile_eff, 
  fileName = fullPathName_tableFile_used, 
  tableName = tableName_eff, 
  smoothness = switchSmoothness_eff
  ) "" annotation(
    Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  /* ---------------------------------------------
            Interface
    --------------------------------------------- */
  PropulsionSystem.Types.SubelementBus subelementBus1 annotation(
    Placement(visible = true, transformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_NcTbl annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_PRtbl annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_Wc(quantity = "MassFlowRate", unit = "kg/s", displayUnit = "kg/s") "[kg/s]" annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_eff "[nond]" annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
protected
  parameter String fullPathName_tableFileInSimExeDir = Modelica.Utilities.Files.fullPathName(pathName_tableFileInSimExeDir) "" annotation(
    HideResult = false);
  parameter String fullPathName_tableFileInLibPackage = Modelica.Utilities.Files.loadResource(pathName_tableFileInLibPackage) "" annotation(
    HideResult = false);
  parameter String fullPathName_tableFile_used = if switchTableDataLocation == PropulsionSystem.Types.switches.switchTableDataResource.inSimExeDirectory then fullPathName_tableFileInSimExeDir elseif switchTableDataLocation == PropulsionSystem.Types.switches.switchTableDataResource.inLibraryDirectory then fullPathName_tableFileInLibPackage else fullPathName_tableFileInLibPackage "" annotation(
    HideResult = false);
  parameter Integer sizeTbl_Wc[2](each fixed = false) "" annotation(
    HideResult = false);
  parameter Integer sizeTbl_eff[2](each fixed = false) "" annotation(
    HideResult = false);
  parameter Integer n_Wc(fixed = false) "" annotation(
    HideResult = false);
  parameter Integer n_eff(fixed = false) "" annotation(
    HideResult = false);
  
  parameter Real tableDefault_Wc_NcPR[:, :] = [	0	,	1.000	,	1.300	,	1.690	,	2.197	,	2.856	,	3.713	,	4.827	,	6.275	,	8.157	,	10.604	;
	0.1	,	0.000	,	137.534	,	183.868	,	194.429	,	195.890	,	195.997	,	196.000	,	196.000	,	196.000	,	196.000	;
	0.2	,	0.000	,	135.288	,	180.381	,	190.521	,	191.898	,	191.997	,	192.000	,	192.000	,	192.000	,	192.000	;
	0.3	,	0.000	,	133.022	,	176.882	,	186.608	,	187.907	,	187.997	,	188.000	,	188.000	,	188.000	,	188.000	;
	0.4	,	0.000	,	130.736	,	173.370	,	182.692	,	183.914	,	183.998	,	184.000	,	184.000	,	184.000	,	184.000	;
	0.5	,	0.000	,	128.429	,	169.845	,	178.772	,	179.921	,	179.998	,	180.000	,	180.000	,	180.000	,	180.000	;
	0.6	,	0.000	,	126.102	,	166.308	,	174.848	,	175.928	,	175.998	,	176.000	,	176.000	,	176.000	,	176.000	;
	0.7	,	0.000	,	123.754	,	162.758	,	170.922	,	171.934	,	171.998	,	172.000	,	172.000	,	172.000	,	172.000	;
	0.8	,	0.000	,	121.385	,	159.196	,	166.991	,	167.940	,	167.998	,	168.000	,	168.000	,	168.000	,	168.000	;
	0.9	,	0.000	,	118.995	,	155.621	,	163.058	,	163.945	,	163.999	,	164.000	,	164.000	,	164.000	,	164.000	;
	1.0	,	0.000	,	116.584	,	152.034	,	159.121	,	159.950	,	159.999	,	160.000	,	160.000	,	160.000	,	160.000	;
	1.1	,	0.000	,	114.151	,	148.435	,	155.181	,	155.955	,	155.999	,	156.000	,	156.000	,	156.000	,	156.000	;
	1.2	,	0.000	,	111.696	,	144.824	,	151.239	,	151.959	,	151.999	,	152.000	,	152.000	,	152.000	,	152.000	;
	1.3	,	0.000	,	109.219	,	141.200	,	147.293	,	147.963	,	147.999	,	148.000	,	148.000	,	148.000	,	148.000	;
	1.4	,	0.000	,	106.720	,	137.565	,	143.344	,	143.966	,	143.999	,	144.000	,	144.000	,	144.000	,	144.000	;
	1.5	,	0.000	,	104.198	,	133.918	,	139.393	,	139.970	,	139.999	,	140.000	,	140.000	,	140.000	,	140.000	]
 "table, Wc=f(Nc, PR)" annotation(
    Dialog(group = "default table"),
    HideResult = true);
  
  parameter Real tableDefault_eff_NcPR[:, :] = [	0	,	1.000	,	1.300	,	1.690	,	2.197	,	2.856	,	3.713	,	4.827	,	6.275	,	8.157	,	10.604	;
	0.1	,	0.737	,	0.736	,	0.736	,	0.734	,	0.729	,	0.721	,	0.704	,	0.675	,	0.623	,	0.533	;
	0.2	,	0.774	,	0.774	,	0.774	,	0.772	,	0.767	,	0.759	,	0.743	,	0.714	,	0.663	,	0.573	;
	0.3	,	0.808	,	0.808	,	0.807	,	0.805	,	0.802	,	0.794	,	0.778	,	0.750	,	0.700	,	0.610	;
	0.4	,	0.836	,	0.837	,	0.836	,	0.835	,	0.831	,	0.824	,	0.809	,	0.782	,	0.733	,	0.645	;
	0.5	,	0.861	,	0.861	,	0.861	,	0.860	,	0.857	,	0.850	,	0.837	,	0.810	,	0.763	,	0.677	;
	0.6	,	0.880	,	0.881	,	0.881	,	0.881	,	0.878	,	0.872	,	0.860	,	0.835	,	0.789	,	0.706	;
	0.7	,	0.895	,	0.896	,	0.896	,	0.897	,	0.895	,	0.890	,	0.879	,	0.856	,	0.812	,	0.731	;
	0.8	,	0.904	,	0.906	,	0.907	,	0.908	,	0.907	,	0.903	,	0.893	,	0.872	,	0.831	,	0.754	;
	0.9	,	0.909	,	0.911	,	0.913	,	0.914	,	0.914	,	0.912	,	0.904	,	0.885	,	0.846	,	0.773	;
	1.0	,	0.908	,	0.910	,	0.913	,	0.915	,	0.917	,	0.916	,	0.909	,	0.893	,	0.858	,	0.788	;
	1.1	,	0.901	,	0.904	,	0.908	,	0.911	,	0.914	,	0.914	,	0.910	,	0.896	,	0.865	,	0.800	;
	1.2	,	0.889	,	0.893	,	0.897	,	0.901	,	0.905	,	0.908	,	0.906	,	0.895	,	0.867	,	0.807	;
	1.3	,	0.871	,	0.876	,	0.881	,	0.886	,	0.892	,	0.896	,	0.896	,	0.889	,	0.865	,	0.811	;
	1.4	,	0.847	,	0.852	,	0.858	,	0.865	,	0.872	,	0.878	,	0.881	,	0.877	,	0.858	,	0.809	;
	1.5	,	0.816	,	0.822	,	0.829	,	0.837	,	0.846	,	0.854	,	0.860	,	0.860	,	0.845	,	0.803	]
 "eff=f(Nc, PR)" annotation(
    Dialog(group = "default table"),
    HideResult = true);
  
  //********************************************************************************
initial algorithm
  if printCmd == true then
    print("----- msg at initialization -----" + "\n");
    print("     instance: " + getInstanceName() + "\n");
    print("file read by this component= " + fullPathName_tableFile_used + "\n");
    print("----- end msg at initialization, " + getInstanceName() + " -----" + "\n");
  end if;
initial equation
  sizeTbl_Wc = size(combiTable2D_Wc.table);
  sizeTbl_eff = size(combiTable2D_eff.table);
  /*
  n_Wc = sizeTbl_Wc[0] * sizeTbl_Wc[1];
  n_eff = sizeTbl_eff[0] * sizeTbl_eff[1];
  */
  
equation
  connect(combiTable2D_Wc.y, y_Wc) annotation(
    Line(points = {{2, 60}, {110, 60}}, color = {0, 0, 127}));
  connect(combiTable2D_eff.y, y_eff) annotation(
    Line(points = {{2, -60}, {110, -60}}, color = {0, 0, 127}));
  connect(u_PRtbl, combiTable2D_Wc.u2) annotation(
    Line(points = {{-120, -40}, {-46, -40}, {-46, 54}, {-22, 54}}, color = {0, 0, 127}));
  connect(u_NcTbl, combiTable2D_Wc.u1) annotation(
    Line(points = {{-120, 40}, {-72, 40}, {-72, 66}, {-22, 66}}, color = {0, 0, 127}));
  connect(u_PRtbl, combiTable2D_eff.u2) annotation(
    Line(points = {{-120, -40}, {-46, -40}, {-46, -66}, {-22, -66}, {-22, -66}}, color = {0, 0, 127}));
  connect(u_NcTbl, combiTable2D_eff.u1) annotation(
    Line(points = {{-120, 40}, {-72, 40}, {-72, -54}, {-22, -54}}, color = {0, 0, 127}));
  annotation(
    defaultComponentName = "TrbTbl_WcEff_NcPR",
    Diagram,
    Icon(graphics = {Text(origin = {0, -111}, extent = {{-100, 7}, {100, -7}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end TurbineTable_WcEff_NcPR00;
