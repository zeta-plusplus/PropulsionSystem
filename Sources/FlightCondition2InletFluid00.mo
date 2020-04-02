within PropulsionSystem.Sources;

model FlightCondition2InletFluid00
  extends PropulsionSystem.BaseClasses.BasicElements.FlightCondition2InletFluidBase00;
  
  
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
  parameter Boolean use_u_alt = false
    "get alt from the real input connector"
    annotation(
    Evaluate=true, HideResult=true, choices(checkBox=true));
  
  parameter Boolean use_u_MN = false
    "get MN from the real input connector"
    annotation(
    Evaluate=true, HideResult=true, choices(checkBox=true));
  
  parameter Boolean use_u_dTamb = false
    "get dTamb from the real input connector"
    annotation(
    Evaluate=true, HideResult=true, choices(checkBox=true));
  
  parameter Boolean use_u_X = false
    "get fluid composition from the real input connector"
    annotation(
    Evaluate=true, HideResult=true, choices(checkBox=true));
  
  parameter Boolean use_u_C = false
    "get fluid trace substance from the real input connector"
    annotation(
    Evaluate=true, HideResult=true, choices(checkBox=true));
  
  
  
  /* ---------------------------------------------
          parameters
  --------------------------------------------- */
  parameter Modelica.SIunits.Length alt_paramInput = 10000.0 "flight altitude, valid only when use_u_alt==false, value fixed through simulation" annotation(
    );
  
  parameter Real MN_paramInput = 0.80 "flight mach number, valid only when use_u_MN==false, value fixed through simulation" annotation(
    );
  
  parameter Modelica.SIunits.TemperatureDifference dTamb_paramInput = 0.0 "temperature diffrence from standard atmosphere, valid only when use_u_dTamb==false, value fixed through simulation" annotation(
    );
  
  parameter Medium.MassFraction X_fluid_paramInput[Medium.nX]= Medium.X_default "fluid composition, valid only when use_u_X==false, value fixed through simulation" annotation(
    );
  
  parameter Medium.ExtraProperty C_fluid_paramInput[Medium.nC](quantity=Medium.extraPropertiesNames)=fill(0, Medium.nC) "fluid trace substance, valid only when use_u_C==false, value fixed through simulation" annotation(
    );
  
  
  
  /* ---------------------------------------------
          Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_alt(quantity="Length", unit="m",displayUnit="m") if use_u_alt "flight altitude, valid only when use_u_alt==true" annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Interfaces.RealInput u_MN if use_u_MN 
    "flight mach number, valid only when use_u_MN==true" annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Interfaces.RealInput u_dTamb(quantity="ThermodynamicTemperature", unit="K",displayUnit="K") if use_u_dTamb "temperature difference from standard atmospere, valid only when use_u_dTamb==true"  annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Interfaces.RealInput u_X_fluid[Medium.nX] if use_u_X
    "composition of fluid, valid only when use_u_X==true" annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Interfaces.RealInput u_C_fluid[Medium.nC] if use_u_C
    "trace substance of fluid, valid only when use_u_C==true" annotation(
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
    
    
algorithm
//##### none #####
equation
  
  
  /* ---------------------------------------------
    Connections, interface <-> internal variables
  --------------------------------------------- */
  //--------------------
  if (use_u_alt == true) then
    alt = u_alt;
  elseif (use_u_alt == false) then
    alt = alt_paramInput;
  end if;
  //--------------------
  if (use_u_MN == true) then
    MN = u_MN;
  elseif (use_u_MN == false) then
    MN = MN_paramInput;
  end if;
  //--------------------
  if (use_u_dTamb == true) then
    dTamb = u_dTamb;
  elseif (use_u_dTamb == false) then
    dTamb = dTamb_paramInput;
  end if;
  //--------------------
  if (use_u_X == true) then
    X_fluid= u_X_fluid;
  elseif (use_u_X == false) then
    X_fluid= X_fluid_paramInput;
  end if;
  //--------------------
  if (use_u_C == true) then
    C_fluid= u_C_fluid;
  elseif (use_u_C == false) then
    C_fluid= C_fluid_paramInput;
  end if;
  //--------------------
  
  
  
  
/********************************************************
  Graphics
********************************************************/

  
annotation(
    defaultComponentName = "Flt2Fluid",
    Documentation(info = "<html>
  <a href=modelica://PropulsionSystem/docs/Sources/FlightCondition2InletFluid00.html> Document html page</a>
  
  <h4>example/demo models</h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.FlightCondition2InletFluid00_ex01\"> PropulsionSystem.Examples.BasicElements.FlightCondition2InletFluid00_ex01 </a> </li>
    </ul>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>
    
  <h4>classes from which this component extend </h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.BaseClasses.BasicElements.FlightCondition2InletFluidBase00\"> PropulsionSystem.BaseClasses.BasicElements.FlightCondition2InletFluidBase00 </a> </li>
    </ul>

</html>"),
    
    Icon(coordinateSystem(initialScale = 0.1)));
  


end FlightCondition2InletFluid00;
