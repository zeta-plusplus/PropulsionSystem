within PropulsionSystem.Elements.BasicElements;

model TrbCharFixed00
  extends PropulsionSystem.BaseClasses.BasicElements.TurbineBase00;
  extends PropulsionSystem.BaseClasses.BasicElements.TurbineBaseDefDesPt00;
  
  /********************************************************
        imports   
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  
  
  /********************************************************
        Declaration   
  ********************************************************/
  /* ---------------------------------------------
        switches    
  --------------------------------------------- */
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated "switch how to determine PR" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  parameter Boolean use_u_eff = false "get eff from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
  
  
  /* ---------------------------------------------
        parameters    
  --------------------------------------------- */
  inner parameter Real PRdes_paramInput = 5.0 "pressure ratio, valid only when switchDetermine_PR==param, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));

  inner parameter Real effDes_paramInput = 0.80 "adiabatic efficiency, valid only when use_u_eff==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  
  /* ---------------------------------------------
        Interface   
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_PR if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "PR input, valid only when switchDetermine_PR==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-60, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

  Modelica.Blocks.Interfaces.RealInput u_eff if use_u_eff "eff input, valid only when use_u_eff==true" annotation(
    Placement(visible = true, transformation(origin = {-20, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {-3.55271e-15, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));

//******************************************************************************************
initial algorithm
  
//******************************************************************************************
initial equation
  /* ---------------------------------------------
  design point calc
  --------------------------------------------- */
  fluid_1_des.m_flow= port_1.m_flow;
  fluid_1_des.p= fluid_1.p;
  fluid_1_des.T= fluid_1.T;
  
  NmechDes = Nmech; 
  //--------------------
  if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    PRdes = PRdes_paramInput;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    PRdes = u_PR;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    PRdes= PR;
  end if; 
  //--------------------
  if use_u_eff == false then
    effDes = effDes_paramInput;
  elseif use_u_eff==true then
    effDes = u_eff;
  end if; 
  //--------------------
  
  
//******************************************************************************************
algorithm
//##### none #####
//******************************************************************************************
equation
  
  when (time<=environment.timeRemoveDesConstraint)then
    /* ---------------------------------------------
    design point calc
    --------------------------------------------- */
    fluid_1_des.m_flow=port_1.m_flow;
    fluid_1_des.p=fluid_1.p;
    fluid_1_des.T=fluid_1.T;
    NmechDes=Nmech;
    
    if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.param then
      PRdes = PRdes_paramInput;
    elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
      PRdes = u_PR;
    elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
      PRdes= PR;
    end if; 
    //--------------------
    if use_u_eff == false then
      effDes = effDes_paramInput;
    elseif use_u_eff==true then
      effDes = u_eff;
    end if; 
    //--------------------
    
  end when;
  
  //--------------------
  if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    PR = PRdes_paramInput;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    PR = u_PR;
  end if; 
  //--------------------
  if use_u_eff == false then
    eff = effDes_paramInput;
  elseif use_u_eff==true then
    eff = u_eff;
  end if; 
  //--------------------
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Trb",
    Documentation(info = "<html>
  <a href=modelica://PropulsionSystem/docs/Elements/BasicElements/TrbCharFixed00.html> Document html page</a>
  
  <h4>example/demo models</h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.TrbCharFixed00_ex01\"> PropulsionSystem.Examples.BasicElements.TrbCharFixed00_ex01 </a> </li>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.TrbCharFixed00_ex02\"> PropulsionSystem.Examples.BasicElements.TrbCharFixed00_ex02 </a> </li>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.Cmp_and_Trb_ex01\"> PropulsionSystem.Examples.BasicElements.Cmp_and_Trb_ex01 </a> </li>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.Cmp_and_Trb_ex02\"> PropulsionSystem.Examples.BasicElements.Cmp_and_Trb_ex02 </a> </li>
    </ul>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>
    
  <h4>classes from which this component extend </h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.BaseClasses.BasicElements.TurbineBase00\"> PropulsionSystem.BaseClasses.BasicElements.TurbineBase00 </a> </li>
    </ul>

</html>"));

end TrbCharFixed00;
