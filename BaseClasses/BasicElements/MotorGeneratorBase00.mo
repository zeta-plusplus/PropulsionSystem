within PropulsionSystem.BaseClasses.BasicElements;

model MotorGeneratorBase00
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
  Modelica.SIunits.Power pwrIdeal "power extracted at flange_1/power supplied to motor";
  Modelica.SIunits.Power pwr "real generated power/real power supplied to flange_1";
  Modelica.SIunits.Power Qloss "heat generated due to loss";
  Modelica.SIunits.Torque trqIdeal "torque extracted at flange_1/power supplied to motor";
  Modelica.SIunits.Torque trq "torque by real generated power/real torque supplied to flange_1";
  Modelica.SIunits.Power pwr_inv "real power, sign inverted";
  Modelica.SIunits.Torque trq_inv "real torque, sign inverted";
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
    Placement(visible = true, transformation(origin = {90, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  
  
  
  /* ---------------------------------------------
  Connections, interface <-> internal variables
  --------------------------------------------- */
  //--------------------
  if use_HeatPort_1 == true then
    Qloss = (-1.0) * HeatPort_1.Q_flow;
  end if;
  //--------------------
  phi = flange_1.phi;
  if flange_1.tau >= 0.0 then
    // generator operation
    trqIdeal = flange_1.tau;
  else
    // motor operation
    flange_1.tau = trq;
  end if;
  
  
  
  /* ---------------------------------------------
  Eqns describing physics
  --------------------------------------------- */
  pwr = pwrIdeal * eff;
  der(phi) = omega;
  omega * trq = pwr;
  omega * trqIdeal = pwrIdeal;
  pwr_inv = -1.0 * pwr;
  trq_inv = -1.0 * trq;
  Qloss = abs(pwrIdeal - pwr);
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "MotGene",
    Icon(graphics = {Rectangle(origin = {1, 1}, fillColor = {165, 165, 165}, fillPattern = FillPattern.Solid, extent = {{-101, 9}, {71, -11}}), Text(origin = {-45, 76}, extent = {{-35, 4}, {125, -16}}, textString = "%name"), Ellipse(origin = {-70, -4}, fillColor = {0, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, lineThickness = 0.75, extent = {{-16, 64}, {18, -56}}, endAngle = 360), Rectangle(origin = {7, -1}, fillColor = {0, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.HorizontalCylinder, extent = {{-76, 61}, {78, -59}}), Ellipse(origin = {85, -4}, fillColor = {0, 170, 0}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, lineThickness = 0.75, extent = {{-16, 64}, {16, -56}}, endAngle = 360), Text(origin = {-39, 21}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-43, 3}, {139, -41}}, textString = "Motor/Gene.", fontSize = 40)}, coordinateSystem(initialScale = 0.1)));
end MotorGeneratorBase00;
