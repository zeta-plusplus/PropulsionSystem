within PropulsionSystem.Subelements;

block CompressorTable_WcPReff_NcRline00
  extends PropulsionSystem.Icons.Icon_CompressorTable_WcPReff_NcRline00;
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
  
  parameter Boolean printCmd = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(tab = "debug setting"));
  
  
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
  Modelica.Blocks.Tables.CombiTable2D combiTable2D_Wc(
    table =tableDefault_Wc_NcRline,
    tableOnFile= use_tableFile_Wc,
    fileName= fullPathName_tableFile_used,
    tableName= tableName_Wc,
    smoothness= switchSmoothness_Wc
  )
  ""
    annotation(
    Placement(visible = true, transformation(origin = {-10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2D combiTable2D_PR(
    table= tableDefault_PR_NcRline,
    tableOnFile= use_tableFile_PR,
    fileName= fullPathName_tableFile_used,
    tableName= tableName_PR,
    smoothness= switchSmoothness_PR
  )
  ""
   annotation(
    Placement(visible = true, transformation(origin = {-10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2D combiTable2D_eff(
    table=tableDefault_eff_NcRline,
    tableOnFile= use_tableFile_eff,
    fileName= fullPathName_tableFile_used,
    tableName= tableName_eff,
    smoothness= switchSmoothness_eff
  )
  ""
   annotation(
    Placement(visible = true, transformation(origin = {-10, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  
  /* ---------------------------------------------
          Interface
  --------------------------------------------- */
  PropulsionSystem.Types.SubelementBus subelementBus1 annotation(
    Placement(visible = true, transformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_NcTbl annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_RlineTbl annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_Wc(start=100.0, quantity="MassFlowRate", unit="kg/s", displayUnit="kg/s") "[kg/s]" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true),
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_PR(start=2.0) "[nond]" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true),
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  output Modelica.Blocks.Interfaces.RealOutput y_eff(start=0.9) "[nond]" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true),
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
protected
  parameter String fullPathName_tableFileInSimExeDir=Modelica.Utilities.Files.fullPathName(pathName_tableFileInSimExeDir)
    "" 
    annotation(
    HideResult=false
    );
  parameter String fullPathName_tableFileInLibPackage=Modelica.Utilities.Files.loadResource(pathName_tableFileInLibPackage)
    "" 
    annotation(
    HideResult=false
    );
  
  parameter String fullPathName_tableFile_used= 
    if (switchTableDataLocation==PropulsionSystem.Types.switches.switchTableDataResource.inSimExeDirectory) then  fullPathName_tableFileInSimExeDir 
    elseif (switchTableDataLocation==PropulsionSystem.Types.switches.switchTableDataResource.inLibraryDirectory) then fullPathName_tableFileInLibPackage 
    else fullPathName_tableFileInLibPackage 
    "" 
    annotation(
    HideResult=false
    );
  
  
  parameter Integer sizeTbl_Wc[2](each fixed=false)
    "" 
    annotation(
    HideResult=false
    );
  parameter Integer sizeTbl_PR[2](each fixed=false)
    "" 
    annotation(
    HideResult=false
    );    
  parameter Integer sizeTbl_eff[2](each fixed=false)
    "" 
    annotation(
    HideResult=false
    );
  /*
  parameter Integer n_Wc(fixed=false)
    "" 
    annotation(
    HideResult=false
    );
  parameter Integer n_PR(fixed=false)
    "" 
    annotation(
    HideResult=false
    );
  parameter Integer n_eff(fixed=false)
    "" 
    annotation(
    HideResult=false
    );
  */
  
  parameter Real tableDefault_Wc_NcRline[:, :]= [0, 0.087266463, 0.185441233, 0.283616003, 0.381790774, 0.479965544, 0.578140315, 0.676315085, 0.774489856, 0.872664626, 0.970839396, 1.069014167; 0.1, 10.376, 9.951, 9.252, 8.327, 7.238, 6.055, 4.854, 3.704, 2.664, 1.781, 1.083; 0.2, 21.859, 21.369, 20.542, 19.401, 17.982, 16.325, 14.481, 12.506, 10.460, 8.410, 6.422; 0.3, 34.349, 33.818, 32.915, 31.650, 30.043, 28.115, 25.896, 23.418, 20.719, 17.839, 14.827; 0.4, 47.840, 47.277, 46.312, 44.952, 43.204, 41.078, 38.587, 35.743, 32.562, 29.058, 25.243; 0.5, 62.331, 61.739, 60.720, 59.276, 57.409, 55.118, 52.404, 49.265, 45.695, 41.682, 37.207; 0.6, 77.824, 77.203, 76.134, 74.613, 72.638, 70.200, 67.291, 63.895, 59.990, 55.541, 50.497; 0.7, 94.316, 93.668, 92.550, 90.957, 88.880, 86.307, 83.219, 79.590, 75.385, 70.548, 64.996; 0.8, 111.808, 111.134, 109.969, 108.306, 106.132, 103.429, 100.173, 96.329, 91.847, 86.653, 80.637; 0.9, 130.301, 129.600, 128.389, 126.657, 124.389, 121.563, 118.147, 114.098, 109.355, 103.827, 97.379; 1.0, 149.794, 149.067, 147.810, 146.011, 143.651, 140.704, 137.134, 132.889, 127.896, 122.051, 115.194; 1.1, 170.287, 169.534, 168.232, 166.366, 163.916, 160.851, 157.130, 152.695, 147.462, 141.313, 134.065; 1.2, 191.779, 191.001, 189.654, 187.723, 185.183, 182.003, 178.134, 173.513, 168.048, 161.604, 153.979; 1.3, 214.272, 213.469, 212.077, 210.080, 207.452, 204.157, 200.144, 195.341, 189.648, 182.917, 174.927; 1.4, 237.765, 236.936, 235.500, 233.438, 230.723, 227.315, 223.159, 218.177, 212.260, 205.249, 196.903; 1.5, 262.258, 261.404, 259.923, 257.797, 254.995, 251.475, 247.177, 242.018, 235.882, 228.596, 219.901] "table, Wc=f(Nc, Rline)" annotation(
    Dialog(group = "default table"),
    HideResult=true
    );
  
  parameter Real tableDefault_PR_NcRline[:, :]= [0, 0.087266463, 0.185441233, 0.283616003, 0.381790774, 0.479965544, 0.578140315, 0.676315085, 0.774489856, 0.872664626, 0.970839396, 1.069014167; 0.1, 0.0001, 0.0013, 0.0048, 0.0117, 0.0227, 0.0383, 0.0584, 0.0824, 0.1093, 0.1378, 0.1662; 0.2, 0.0165, 0.0582, 0.1174, 0.1900, 0.2726, 0.3618, 0.4547, 0.5479, 0.6387, 0.7241, 0.8015; 0.3, 0.1347, 0.3198, 0.5176, 0.7202, 0.9225, 1.1204, 1.3104, 1.4893, 1.6544, 1.8030, 1.9331; 0.4, 0.4694, 0.9064, 1.3074, 1.6810, 2.0295, 2.3530, 2.6509, 2.9221, 3.1654, 3.3796, 3.5636; 0.5, 1.1089, 1.8859, 2.5346, 3.1047, 3.6146, 4.0729, 4.4842, 4.8509, 5.1743, 5.4552, 5.6936; 0.6, 2.1121, 3.2963, 4.2234, 5.0064, 5.6870, 6.2855, 6.8134, 7.2775, 7.6821, 8.0302, 8.3234; 0.7, 3.5176, 5.1600, 6.3870, 7.3939, 8.2514, 8.9937, 9.6402, 10.2028, 10.6893, 11.1048, 11.4530; 0.8, 5.3511, 7.4906, 9.0332, 10.2719, 11.3104, 12.1988, 12.9653, 13.6272, 14.1959, 14.6792, 15.0825; 0.9, 7.6303, 10.2970, 12.1670, 13.6431, 14.8658, 15.9020, 16.7893, 17.5511, 18.2023, 18.7535, 19.2119; 1.0, 10.3677, 13.5852, 15.7915, 17.5094, 18.9184, 20.1036, 21.1126, 21.9745, 22.7085, 23.3277, 23.8413; 1.1, 13.5721, 17.3595, 19.9089, 21.8719, 23.4689, 24.8041, 25.9352, 26.8976, 27.7145, 28.4018, 28.9706; 1.2, 17.2502, 21.6227, 24.5209, 26.7315, 28.5179, 30.0038, 31.2573, 32.3204, 33.2203, 33.9758, 34.6000; 1.3, 21.4069, 26.3771, 29.6285, 32.0888, 34.0657, 35.7028, 37.0792, 38.2431, 39.2261, 40.0498, 40.7293; 1.4, 26.0460, 31.6243, 35.2326, 37.9442, 40.1125, 41.9013, 43.4007, 44.6656, 45.7318, 46.6238, 47.3585; 1.5, 31.1704, 37.3657, 41.3339, 44.2982, 46.6585, 48.5993, 50.2220, 51.5880, 52.7375, 53.6977, 54.4878] "table, PR=f(Nc, Rline)" annotation(
    Dialog(group = "default table"),
    HideResult=true
    );
  
  parameter Real tableDefault_eff_NcRline[:, :]= [	0	,	0.087266463	,	0.185441233	,	0.283616003	,	0.381790774	,	0.479965544	,	0.578140315	,	0.676315085	,	0.774489856	,	0.872664626	,	0.970839396	,	1.069014167	;	0.1	,	0.4545	,	0.4831	,	0.5073	,	0.5272	,	0.5428	,	0.5540	,	0.5610	,	0.5636	,	0.5619	,	0.5559	,	0.5456	;	0.2	,	0.5318	,	0.5603	,	0.5846	,	0.6044	,	0.6200	,	0.6313	,	0.6382	,	0.6409	,	0.6392	,	0.6332	,	0.6229	;	0.3	,	0.6000	,	0.6285	,	0.6527	,	0.6726	,	0.6882	,	0.6995	,	0.7064	,	0.7091	,	0.7074	,	0.7014	,	0.6911	;	0.4	,	0.6591	,	0.6876	,	0.7118	,	0.7317	,	0.7473	,	0.7586	,	0.7655	,	0.7682	,	0.7665	,	0.7605	,	0.7502	;	0.5	,	0.7091	,	0.7376	,	0.7618	,	0.7817	,	0.7973	,	0.8086	,	0.8155	,	0.8182	,	0.8165	,	0.8105	,	0.8002	;	0.6	,	0.7500	,	0.7785	,	0.8027	,	0.8226	,	0.8382	,	0.8495	,	0.8564	,	0.8591	,	0.8574	,	0.8514	,	0.8411	;	0.7	,	0.7818	,	0.8103	,	0.8346	,	0.8544	,	0.8700	,	0.8813	,	0.8882	,	0.8909	,	0.8892	,	0.8832	,	0.8729	;	0.8	,	0.8045	,	0.8331	,	0.8573	,	0.8772	,	0.8928	,	0.9040	,	0.9110	,	0.9136	,	0.9119	,	0.9059	,	0.8956	; 0.9	,	0.8182	,	0.8467	,	0.8709	,	0.8908	,	0.9064	,	0.9177	,	0.9246	,	0.9272	,	0.9256	,	0.9196	,	0.9093	;	1.0	,	0.8227	,	0.8513	,	0.8755	,	0.8954	,	0.9109	,	0.9222	,	0.9292	,	0.9318	,	0.9301	,	0.9241	,	0.9138	;	1.1	,	0.8182	,	0.8467	,	0.8709	,	0.8908	,	0.9064	,	0.9177	,	0.9246	,	0.9272	,	0.9256	,	0.9196	,	0.9093	;	1.2	,	0.8045	,	0.8331	,	0.8573	,	0.8772	,	0.8928	,	0.9040	,	0.9110	,	0.9136	,	0.9119	,	0.9059	,	0.8956	;	1.3	,	0.7818	,	0.8103	,	0.8346	,	0.8544	,	0.8700	,	0.8813	,	0.8882	,	0.8909	,	0.8892	,	0.8832	,	0.8729	;	1.4	,	0.7500	,	0.7785	,	0.8027	,	0.8226	,	0.8382	,	0.8495	,	0.8564	,	0.8591	,	0.8574	,	0.8514	,	0.8411	;	1.5	,	0.7091	,	0.7376	,	0.7618	,	0.7817	,	0.7973	,	0.8086	,	0.8155	,	0.8182	,	0.8165	,	0.8105	,	0.8002	]
 "" annotation(
    Dialog(group = "default table"),
    HideResult=true
    );
  //********************************************************************************
initial algorithm
  
  if printCmd == true then
    print("----- msg at initialization -----"+"\n");
    print("     instance: " + getInstanceName()  + "\n");
    print("file read by this component= " + fullPathName_tableFile_used + "\n");
    print("----- end msg at initialization, " + getInstanceName()+ " -----"+"\n");
  end if;
  
  
  
initial equation
  sizeTbl_Wc=size(combiTable2D_Wc.table);
  sizeTbl_PR=size(combiTable2D_PR.table);
  sizeTbl_eff=size(combiTable2D_eff.table);
  /*
  n_Wc=sizeTbl_Wc[0]*sizeTbl_Wc[1];
  n_PR=sizeTbl_PR[0]*sizeTbl_PR[1];
  n_eff=sizeTbl_eff[0]*sizeTbl_eff[1];
  */
  
equation
  
  /**/
  connect(combiTable2D_Wc.y, y_Wc) annotation(
    Line(points = {{2, 60}, {110, 60}}, color = {0, 0, 127}));
  connect(combiTable2D_PR.y, y_PR) annotation(
    Line(points = {{2, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(combiTable2D_eff.y, y_eff) annotation(
    Line(points = {{2, -60}, {110, -60}}, color = {0, 0, 127}));
  
  connect(u_RlineTbl, combiTable2D_Wc.u2) annotation(
    Line(points = {{-120, -40}, {-46, -40}, {-46, 54}, {-22, 54}}, color = {0, 0, 127}));
  connect(u_NcTbl, combiTable2D_Wc.u1) annotation(
    Line(points = {{-120, 40}, {-72, 40}, {-72, 66}, {-22, 66}}, color = {0, 0, 127}));
  connect(u_RlineTbl, combiTable2D_eff.u2) annotation(
    Line(points = {{-120, -40}, {-46, -40}, {-46, -66}, {-22, -66}, {-22, -66}}, color = {0, 0, 127}));
  connect(u_RlineTbl, combiTable2D_PR.u2) annotation(
    Line(points = {{-120, -40}, {-46, -40}, {-46, -6}, {-22, -6}, {-22, -6}}, color = {0, 0, 127}));
  connect(u_NcTbl, combiTable2D_eff.u1) annotation(
    Line(points = {{-120, 40}, {-72, 40}, {-72, -54}, {-22, -54}}, color = {0, 0, 127}));
  connect(u_NcTbl, combiTable2D_PR.u1) annotation(
    Line(points = {{-120, 40}, {-72, 40}, {-72, 6}, {-22, 6}, {-22, 6}}, color = {0, 0, 127}));
  
  
annotation(
    defaultComponentName="CmpTbl_WcPReff_NcRline",
    Diagram,
    Icon(graphics = {Text(origin = {0, -110}, extent = {{-100, 8}, {100, -8}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
    
end CompressorTable_WcPReff_NcRline00;
