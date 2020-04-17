within PropulsionSystem.Subelements;

model SclCmp_WcPReff00
  /********************************************************
                imports
    ********************************************************/
  import Modelica.Constants;
  /********************************************************
                         Declaration
    ********************************************************/
  /* ---------------------------------------------
          Internal objects   
    --------------------------------------------- */
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /* ---------------------------------------------
            Interface
    --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_Wc annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_PR annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_eff annotation(
    Placement(visible = true, transformation(origin = {-120, -62}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_WcScld annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_PRscld annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_effScld annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_s_Wc annotation(
    Placement(visible = true, transformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-60, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u_s_PR annotation(
    Placement(visible = true, transformation(origin = {0, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u_s_eff annotation(
    Placement(visible = true, transformation(origin = {40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {60, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product3 annotation(
    Placement(visible = true, transformation(origin = {70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Product product2 annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
protected
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {20, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(product3.y, y_effScld) annotation(
    Line(points = {{82, -60}, {102, -60}, {102, -60}, {110, -60}}, color = {0, 0, 127}));
  connect(u_eff, product3.u2) annotation(
    Line(points = {{-120, -62}, {-86, -62}, {-86, -66}, {58, -66}, {58, -66}}, color = {0, 0, 127}));
  connect(u_s_eff, product3.u1) annotation(
    Line(points = {{40, 120}, {40, 120}, {40, -54}, {58, -54}, {58, -54}}, color = {0, 0, 127}));
  connect(add1.y, y_PRscld) annotation(
    Line(points = {{82, 0}, {104, 0}, {104, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(const1.y, add1.u2) annotation(
    Line(points = {{32, -30}, {48, -30}, {48, -6}, {58, -6}, {58, -6}}, color = {0, 0, 127}));
  connect(product2.y, add1.u1) annotation(
    Line(points = {{32, 0}, {44, 0}, {44, 6}, {58, 6}, {58, 6}}, color = {0, 0, 127}));
  connect(const.y, feedback1.u2) annotation(
    Line(points = {{-80, -18}, {-80, -18}, {-80, -8}, {-80, -8}}, color = {0, 0, 127}));
  connect(u_s_PR, product2.u1) annotation(
    Line(points = {{0, 120}, {0, 120}, {0, 6}, {8, 6}, {8, 6}}, color = {0, 0, 127}));
  connect(feedback1.y, product2.u2) annotation(
    Line(points = {{-70, 0}, {-56, 0}, {-56, -6}, {8, -6}, {8, -6}}, color = {0, 0, 127}));
  connect(u_PR, feedback1.u1) annotation(
    Line(points = {{-120, 0}, {-90, 0}, {-90, 0}, {-88, 0}}, color = {0, 0, 127}));
  connect(product1.y, y_WcScld) annotation(
    Line(points = {{82, 60}, {104, 60}, {104, 60}, {110, 60}}, color = {0, 0, 127}));
  connect(u_Wc, product1.u2) annotation(
    Line(points = {{-120, 60}, {-74, 60}, {-74, 54}, {58, 54}, {58, 54}}, color = {0, 0, 127}));
  connect(u_s_Wc, product1.u1) annotation(
    Line(points = {{-60, 120}, {-62, 120}, {-62, 66}, {58, 66}, {58, 66}}, color = {0, 0, 127}));  
annotation(
    defaultComponentName="SclCmp",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}})}),
    Diagram(coordinateSystem(initialScale = 0.1)));
  
  
end SclCmp_WcPReff00;
