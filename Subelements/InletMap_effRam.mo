within PropulsionSystem.Subelements;

model InletMap_effRam
  extends PropulsionSystem.Interfaces.SubelementFrames.SubelementFrame;
  //***** import *****
  import Modelica.Constants;
  import Modelica.Math;
  import PropulsionSystem.Types.switches;
  
  
  /********************************************************
           Declaration
  ********************************************************/
  //********** Package **********
  outer replaceable package Medium = Modelica.Media.Interfaces.PartialMedium;
  //********** Parameters **********
  outer parameter Boolean switchUseMapDataFile_effRam "";
  outer parameter String tableName_effRam;
  outer parameter String pathName_tableFile "";
  outer parameter Modelica.Blocks.Types.Smoothness switchSmoothness "";
  //---
  //********** Internal variables **********
  Modelica.SIunits.MassFlowRate WcCurve "";
  Modelica.SIunits.MassFlowRate WcCurveDes "";
  Real effRamCurve "";
  Real effRamCurveDes "";
  //-----
  Real s_Wc_CurveDes "";
  Real s_MnFlt_CurveDes "";
  Real s_effRam_CurveDes "";
  //-----
  Real s_Wc "";
  Real s_effRam "";
  //-----
  Real effRam_internal "";
    //----- outer-connected variables -----
  outer switches.switch_defineDesValue switchDef_s_Wc_CurveDes "";
  outer switches.switch_defineDesValue switchDef_s_effRam_CurveDes "";
  outer Real MnFltDes "";
  outer Modelica.SIunits.MassFlowRate WcDes_1 "";
  outer Real effRamDes "";
  //---
  outer Real s_Wc_CurveDes_in "";
  outer Real s_effRam_CurveDes_in "";
  //---
  outer Real PRcurveDes "";
  outer Real NcqNcDesCurveDes "";
  
  
  Modelica.Blocks.Tables.CombiTable2D table_effRam annotation(
    Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Tables.CombiTable2D table_effRamDes annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  annotation(
    Icon(graphics = {Rectangle(lineColor = {255, 0, 0}, lineThickness = 4, extent = {{-100, 100}, {100, -100}}), Line(points = {{-100, 100}, {100, -100}}, color = {255, 0, 0}, thickness = 4)}));
  
end InletMap_effRam;
