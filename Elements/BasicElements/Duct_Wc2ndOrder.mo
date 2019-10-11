within PropulsionSystem.Elements.BasicElements;

model Duct_Wc2ndOrder
  extends PropulsionSystem.Elements.BasicElements.Duct;
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  import PropulsionSystem.Subelements;
  /********************************************************
       Declaration
  ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Parameters **********
  inner parameter Real k_dPqP = 0.0001 "" annotation(
    Dialog(group = "Characteristics"));
  //********** Internal variables **********
  inner Modelica.SIunits.MassFlowRate dm;
  //********** Internal model **********
  PropulsionSystem.Subelements.dPqP_Wc2ndOrder model_characteristics_1(redeclare package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-8, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //PropulsionSystem.Elements.Duct_Wc2ndOrder.Model_dPqP model_dPqP(redeclare package Medium = Medium)
  //********** Interfaces **********
  //##### none #####
  //********** Initialization **********
  //##### none #####
  //********** Protected objects **********
  //##### none #####
algorithm
//##### none #####
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
  if(0.0<port_1.m_flow)then
    dm= port_1.m_flow;
  elseif(0.0<port_2.m_flow)then
    dm= port_2.m_flow;
  end if;
  
  if (switchDPqP == PropulsionSystem.Types.switches.switch_dPqP_input.calc_Subelement) then
    dPqP = model_characteristics_1.dPqP_internal;
  end if;
  
//********** Eqns describing physics **********
//##### none #####
/********************************************************
  Graphics
********************************************************/
  annotation(
    Icon(coordinateSystem(initialScale = 0.1)));
end Duct_Wc2ndOrder;
