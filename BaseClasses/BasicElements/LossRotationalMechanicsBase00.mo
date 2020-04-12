within PropulsionSystem.BaseClasses.BasicElements;

model LossRotationalMechanicsBase00
  /********************************************************
                              imports
    ********************************************************/
  import Modelica.Constants;
  /********************************************************
           Declaration
    ********************************************************/
  /* ---------------------------------------------
              switch
    --------------------------------------------- */
  parameter Boolean use_HeatPort_1 = false "use heat port" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  
  
  
  /* ---------------------------------------------
            Internal variables    
    --------------------------------------------- */
  Modelica.SIunits.Power pwrIn "power in";
  Modelica.SIunits.Power pwrOut "power out";
  Modelica.SIunits.Power Qloss "heat generated due to loss";
  Modelica.SIunits.Torque trqIn "torque in";
  Modelica.SIunits.Torque trqOut "torque out";
  Modelica.SIunits.Torque trqMin;
  Modelica.SIunits.Torque trqMax;
  Modelica.SIunits.Power pwrOut_inv "power out, sign inverted";
  Modelica.SIunits.Torque trqOut_inv "torque out, sign inverted";
  Modelica.SIunits.AngularVelocity omega "mechanical rotation speed, rad/sec";
  Modelica.SIunits.Angle phi "mechanical rotation displacement, rad";
  Real eff "efficiency";
  
  
  
  /* ---------------------------------------------
             Interface
    --------------------------------------------- */
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_1 annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a HeatPort_1 if use_HeatPort_1 annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {-90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = { -60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_2 annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  
equation
  
  
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  trqMax= max(flange_1.tau, flange_2.tau);
  trqMin= min(flange_1.tau, flange_2.tau);
  
  if(trqMax== flange_1.tau)then
    trqIn= flange_1.tau;
    trqOut= (-1.0)*flange_2.tau;
  else
    trqIn= flange_2.tau;
    trqOut= (-1.0)*flange_1.tau;  
  end if;
  
  phi = flange_1.phi;
  phi = flange_2.phi;
  
  //--------------------
  if use_HeatPort_1 == true then
    Qloss = (-1.0) * HeatPort_1.Q_flow;
  end if;
  //--------------------
  
  
  
  /* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  der(phi) = omega;
  omega * trqOut = pwrOut;
  omega * trqIn = pwrIn;
  pwrOut_inv = (-1.0) * pwrOut;
  trqOut_inv = (-1.0) * trqOut;
  Qloss = (1.0-eff)*pwrIn;
  pwrIn-(Qloss+pwrOut)=0;
  
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "LossRotMech",
    Icon(graphics = {Rectangle(origin = {1, 1}, fillPattern = FillPattern.Solid, extent = {{-101, 9}, {99, -11}}), Text(origin = {-45, 76}, extent = {{-35, 4}, {125, -16}}, textString = "%name"), Ellipse(origin = {-66, -4}, fillColor = {170, 170, 127}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 0.75, extent = {{-16, 64}, {18, -56}}, endAngle = 360), Rectangle(origin = {7, -1}, fillColor = {170, 170, 127}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-72, 61}, {58, -59}}), Ellipse(origin = {65, -4}, fillColor = {170, 170, 127}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, lineThickness = 0.75, extent = {{-16, 64}, {16, -56}}, endAngle = 360), Text(origin = {-39, 21}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-37, 3}, {91, -37}}, textString = "Mech. Loss", fontSize = 40), Rectangle(origin = {21, 7}, fillPattern = FillPattern.Solid, extent = {{45, 3}, {79, -17}}), Ellipse(origin = {62, 1}, fillPattern = FillPattern.Solid, extent = {{-2, 9}, {10, -11}}, endAngle = 360)}, coordinateSystem(initialScale = 0.1)));
end LossRotationalMechanicsBase00;
