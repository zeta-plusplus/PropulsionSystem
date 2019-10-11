within PropulsionSystem.Interfaces.ElementFrames;

partial model ElementFrame_2FluidPorts_1HeatPort

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
    annotation(Dialog(tab="Assumptions"), Evaluate=true);
  
  
  
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
  
  
  parameter Modelica.SIunits.HeatFlowRate dq_1_start= 0.0
    ""
    annotation(Dialog(tab = "Initialization"));
  
  parameter Modelica.SIunits.Temperature T_wall_1= 1600.0
    ""
    annotation(Dialog(tab = "Initialization"));
  
  
  
  
  //********** Internal variables **********
  Medium.BaseProperties fluid_1
  (
    p.start= p1_init, T.start= T1_init,
    state.p.start= p1_init, state.T.start= T1_init,
    h.start=h1_init
  )
    "flow station of inlet with isentropic compression";
  
  Medium.BaseProperties fluid_2
  (
    p.start= p2_init, T.start= T2_init,
    state.p.start= p2_init, state.T.start= T2_init,
    h.start= h2_init
  )
    "flow station of outlet with isentropic compression";
  
  //----- inner-outer-connected variables -----
  //##### none #####
  //********** Interfaces **********
  Modelica.Fluid.Interfaces.FluidPort_a port_1
  (
    redeclare package Medium = Medium,
    m_flow
    (
      min=if (allowFlowReversal) then -Constants.inf else 0.0,
      start= m_flow1_init
    ),
    h_outflow.start= h1_init
  )
    ""
    annotation(
    Placement(visible = true, transformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Fluid.Interfaces.FluidPort_b port_2
  (
    redeclare package Medium = Medium,
    m_flow
    (
      max=if allowFlowReversal then +Constants.inf else 0.0,
      start= m_flow2_init
    ),
    h_outflow.start= h2_init
  )
    ""
    annotation(
    Placement(visible = true, transformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a HeatPort_1
    ""
    annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  
  //********** Protected objects **********
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {70, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected
  parameter Boolean port_1_exposesState = false
    "= true if port_a exposes the state of a fluid volume";
  parameter Boolean port_2_exposesState = false
    "= true if port_b.p exposes the state of a fluid volume";
  parameter Boolean showDesignFlowDirection = false
    "= false to hide the arrow in the model icon"; 


/********************************************************
  Model coding
********************************************************/
initial algorithm
  //***** debug-print *****
  /*
  print("\n");
  print("At initialization"+"\n");
  print(String(getInstanceName()) +"\n");
  print("fluid_1.state.p= "+String(fluid_1.state.p) +"\n");
  print("fluid_2.p= "+String(fluid_2.p) +"\n");
  */
  
algorithm
  
  //***** debug-print *****
  /*
  print("time= "+String(time)+" [s]"+"\n");
  print(String(getInstanceName()) +"\n");
  print("fluid_1.state.p= "+String(fluid_1.state.p) +"\n");
  print("fluid_2.p= "+String(fluid_2.p) +"\n");
  */
  
  assert(fluid_1.p < 0.0, getInstanceName()+", fluid_1.p got less than 0",
      AssertionLevel.warning);
  assert(fluid_1.T < 0.0, getInstanceName()+", fluid_1.T got less than 0",
      AssertionLevel.warning);
  assert(fluid_1.h < 0.0, getInstanceName()+", fluid_1.h got less than 0",
      AssertionLevel.warning);
  
  //----------
  assert(fluid_2.p < 0.0, getInstanceName()+", fluid_2.p got less than 0",
      AssertionLevel.warning);
  assert(fluid_2.T < 0.0, getInstanceName()+", fluid_2.T got less than 0",
      AssertionLevel.warning);
  assert(fluid_2.h < 0.0, getInstanceName()+", fluid_2.h got less than 0",
      AssertionLevel.warning);
  
  

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
//********** Eqns describing physics **********
//-- wall temperature --
  HeatPort_1.T = fluid_2.T;
  
  

  
  
      
/********************************************************
  Graphics
********************************************************/
//##### none #####


end ElementFrame_2FluidPorts_1HeatPort;
