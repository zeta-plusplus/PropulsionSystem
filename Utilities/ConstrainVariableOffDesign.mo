within PropulsionSystem.Utilities;

model ConstrainVariableOffDesign
  import Modelica.SIunits;
  /* ---------------------------------------------
          Internal variables
      --------------------------------------------- */
  discrete Real auxVar1;
  //Real k_u_variable;
  //Real k_auxVar1;
  /* ---------------------------------------------
                  internal objects    
      --------------------------------------------- */
  inner outer PropulsionSystem.EngineSimEnvironment environment "System wide properties";
  PropulsionSystem.Utilities.ConstrainVariable Constraint(use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /* ---------------------------------------------
                  interface    
      --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_variable annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_targetValue "" annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180)));
  //******************************************************************************************
protected
  //******************************************************************************************
initial equation
  //auxVar1 = 0.0;
  //k_u_variable = 0.0;
  //k_auxVar1 = 1.0;
//******************************************************************************************
algorithm
  /*
  if noEvent(time <= environment.timeRemoveDesConstraint) then
    k_u_variable := 0;
    k_auxVar1 := 1;
  else
    k_u_variable := 1;
    k_auxVar1 := 0;
  end if;
  //----------
  
  auxVar1:= Constraint.u_variable - k_u_variable * u_variable;
  */
//******************************************************************************************
equation
  connect(Constraint.u_targetValue, u_targetValue) annotation(
    Line(points = {{62, -10}, {91, -10}, {91, 0}, {120, 0}}, color = {0, 0, 127}));
  
  if noEvent(time<=environment.timeRemoveDesConstraint) then
    Constraint.u_variable= auxVar1;
  else
    Constraint.u_variable= u_variable;
  end if;
  
  when(sample(environment.timeRemoveDesConstraint,1.0)and(environment.timeRemoveDesConstraint<time))then
    auxVar1=1;
  end when;
  
  annotation(
    defaultComponentName = "ConstraintDesPt",
    Diagram,
    Icon(graphics = {Rectangle(fillColor = {255, 170, 0}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-3, -83}, lineColor = {255, 255, 255}, extent = {{-97, 3}, {103, -17}}, textString = "%name"), Text(origin = {-3, 37}, lineColor = {255, 255, 255}, extent = {{-95, 3}, {101, -37}}, textString = "Constraint", fontSize = 34), Text(origin = {-3, -3}, lineColor = {255, 255, 255}, extent = {{-89, 3}, {95, -35}}, textString = "Off Des.", fontSize = 34)}, coordinateSystem(initialScale = 0.1)));
end ConstrainVariableOffDesign;
