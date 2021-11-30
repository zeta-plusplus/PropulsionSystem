within PropulsionSystem;

model EngineSimEnvironment
  extends PropulsionSystem.Icons.Icon_EngineSimEnvironment;
  
  /* ---------------------------------------------
      parameters
  --------------------------------------------- */
  parameter Modelica.SIunits.Time timeRemoveDesConstraint=1.0
    "time to keep constraint by design point"
    annotation(
    Dialog(group = "Simulation setting"));
  
  
  parameter Modelica.SIunits.Temperature Tstd(start=288.15)= PropulsionSystem.Constants.constants_earth.Tstd
    ""
    annotation(
    Dialog(group = "constants of standards"));
  
  parameter Modelica.SIunits.Pressure pStd(start=101315)= PropulsionSystem.Constants.constants_earth.pStd
    ""
    annotation(
    Dialog(group = "constants of standards"));
  
  parameter Modelica.SIunits.Acceleration gravity(start=9.81)= PropulsionSystem.Constants.constants_earth.gravity
    ""
    annotation(
    Dialog(group = "constants of standards"));
  //----- gound -----
  parameter Modelica.SIunits.Length alt_ground= PropulsionSystem.Constants.constants_earth.alt_ground
    ""
    annotation(
    Dialog(group = "constants for atmosphere model"));
  
  parameter Modelica.SIunits.Temperature T_ground= PropulsionSystem.Constants.constants_earth.T_ground
    ""
    annotation(
    Dialog(group = "constants for atmosphere model"));
  
  parameter Modelica.SIunits.AbsolutePressure p_ground= PropulsionSystem.Constants.constants_earth.p_ground
    ""
    annotation(
    Dialog(group = "constants for atmosphere model"));
  //----- upper bound of troposhere -----
  parameter Modelica.SIunits.Length alt_UpBdTropos= PropulsionSystem.Constants.constants_earth.alt_UpBdTropos
    ""
    annotation(
    Dialog(group = "constants for atmosphere model"));
    
  parameter Modelica.SIunits.Temperature T_UpBdTropos= PropulsionSystem.Constants.constants_earth.T_UpBdTropos
    ""
    annotation(
    Dialog(group = "constants for atmosphere model"));
    
  parameter Modelica.SIunits.AbsolutePressure p_UpBdTropos= PropulsionSystem.Constants.constants_earth.p_UpBdTropos
    ""
    annotation(
    Dialog(group = "constants for atmosphere model"));
    
  parameter Real LapseR1= PropulsionSystem.Constants.constants_earth.LapseR1
    ""
    annotation(
    Dialog(group = "constants for atmosphere model"));
    //----- upper bound of stratosphere -----
  parameter Modelica.SIunits.Length alt_UpBdStratos= PropulsionSystem.Constants.constants_earth.alt_UpBdStratos
    ""
    annotation(
    Dialog(group = "constants for atmosphere model"));
  
  parameter Modelica.SIunits.Temperature T_UpBdStratos= PropulsionSystem.Constants.constants_earth.T_UpBdStratos
    ""
    annotation(
    Dialog(group = "constants for atmosphere model"));
    
  parameter Modelica.SIunits.AbsolutePressure p_UpBdStratos= PropulsionSystem.Constants.constants_earth.p_UpBdStratos
    ""
    annotation(
    Dialog(group = "constants for atmosphere model"));
    
  parameter Real LapseR2= PropulsionSystem.Constants.constants_earth.LapseR2
    ""
    annotation(
    Dialog(group = "constants for atmosphere model"));
  
  

/********************************************************
  Graphics
********************************************************/
  
annotation (
    defaultComponentName="environment",
    defaultComponentPrefixes="inner",
    missingInnerMessage="
Your model is using an outer \"environment\" component but
an inner \"environment\" component is not defined.
For simulation drag Modelica.Fluid.System into your model
to specify system properties.",
    Icon(coordinateSystem(preserveAspectRatio=false, initialScale = 0.1), graphics={Text(lineColor = {0, 0, 255}, extent = {{-150, 150}, {150, 110}}, textString = "%name")}),
    Documentation(info="<html>
            </html>"));

end EngineSimEnvironment;
