within PropulsionSystem.Interfaces.ElementFrames;

partial model ElementFrame_3FluidPorts

  import Modelica.Constants;
  
  /********************************************************
   Declaration
  ********************************************************/
  //********** Package **********
  replaceable package Medium= Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching= true);
  //********** Parameters **********
  parameter Boolean allowFlowReversal= true
    "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)"
    annotation(
    Dialog(tab="Assumptions"), Evaluate=true);
  
  
  //********** Initialization Parameters **********
  //--- fluid_1, port_1 ---
  parameter Modelica.SIunits.MassFlowRate m_flow1_init(displayUnit="kg/s")= 1.0
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.Pressure p1_init(displayUnit="Pa")= 101.3*1000
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.Temperature T1_init(displayUnit="K")= 288.15
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
    
  parameter Modelica.SIunits.SpecificEnthalpy h1_init(displayUnit="J/kg")= 1.004*1000*288.15
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  //--- fluid_2, port_2 ---
  parameter Modelica.SIunits.MassFlowRate m_flow2_init(displayUnit="kg/s")= -1.0*m_flow1_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.Pressure p2_init(displayUnit="Pa")= 101.3*1000
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.Temperature T2_init(displayUnit="K")= 288.15
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.SpecificEnthalpy h2_init(displayUnit="J/kg")= 1.004*1000*288.15
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  //--- fluid_3, port_3 ---
  parameter Modelica.SIunits.MassFlowRate m_flow3_init(displayUnit="kg/s")= -1.0*m_flow1_init
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.Pressure p3_init(displayUnit="Pa")= 101.3*1000
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.Temperature T3_init(displayUnit="K")= 288.15
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  parameter Modelica.SIunits.SpecificEnthalpy h3_init(displayUnit="J/kg")= 1.004*1000*288.15
    ""
    annotation(Dialog(tab="Initialization", group="Fluid states"));
  
  
  //********** Internal variables **********
  Medium.BaseProperties fluid_1 "flow station of port_1 with isentropic compression";
  Medium.BaseProperties fluid_2 "flow station of port_2 with isentropic compression";
  Medium.BaseProperties fluid_3 "flow station of port_3 with isentropic compression";
  //----- inner-outer-connected variables -----
  //##### none #####
  //********** Interfaces **********
  Modelica.Fluid.Interfaces.FluidPort_a port_1
    (
      redeclare package Medium = Medium,
      m_flow(min=if allowFlowReversal then -Constants.inf else 0.0)
    ) 
    annotation(
    Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Fluid.Interfaces.FluidPort_b port_2
    (
      redeclare package Medium = Medium,
      m_flow(min=if allowFlowReversal then -Constants.inf else 0.0)
    )
      annotation(
      Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Fluid.Interfaces.FluidPort_b port_3
    (
      redeclare package Medium = Medium,
      m_flow(max=if allowFlowReversal then +Constants.inf else 0.0)
    ) 
      annotation(
      Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    
  
  
  //********** Protected objects **********
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {90, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  
  
/********************************************************
  Model coding
********************************************************/
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
//-- fluidPort_1 --
  fluid_1.p = port_1.p;
  port_1.h_outflow= fluid_1.h;
  fluid_1.h= actualStream(port_1.h_outflow);
  fluid_1.Xi= actualStream(port_1.Xi_outflow);
//-- fluidPort_2 --
  fluid_2.p = port_2.p;
  fluid_2.h= actualStream(port_2.h_outflow);
  fluid_2.Xi= actualStream(port_2.Xi_outflow);
//-- fluidPort_3 --
  fluid_3.p = port_3.p;
  fluid_3.h= actualStream(port_3.h_outflow);
  fluid_3.Xi= actualStream(port_3.Xi_outflow);
//********** Eqns describing physics **********
//##### none #####

algorithm
  
  //***** debug-print *****
  /*
  print("\n");
  print("time= "+String(time)+" [s]"+"\n");
  print(String(getInstanceName()) +"\n");
  print("fluid_1.state.p= "+String(fluid_1.state.p) +"\n");
  print("fluid_2.p= "+String(fluid_2.p) +"\n");
  */
  
  
/********************************************************
  Graphics
********************************************************/
//##### none #####


end ElementFrame_3FluidPorts;
