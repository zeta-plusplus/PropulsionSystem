within PropulsionSystem.Subelements;

block SclTrb_WcEff00
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
  Modelica.Blocks.Math.Product product3 annotation(
    Placement(visible = true, transformation(origin = {70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /* ---------------------------------------------
              Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_Wc annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_eff annotation(
    Placement(visible = true, transformation(origin = {-120, -62}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_WcScld annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_effScld annotation(
    Placement(visible = true, transformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_s_Wc annotation(
    Placement(visible = true, transformation(origin = {-60, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u_s_eff annotation(
    Placement(visible = true, transformation(origin = {40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {40, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Types.SubelementBus subelementBus1 annotation(
    Placement(visible = true, transformation(origin = {-70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-70, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
protected
equation
  connect(product3.y, y_effScld) annotation(
    Line(points = {{82, -60}, {102, -60}, {102, -60}, {110, -60}}, color = {0, 0, 127}));
  connect(u_eff, product3.u2) annotation(
    Line(points = {{-120, -62}, {-86, -62}, {-86, -66}, {58, -66}, {58, -66}}, color = {0, 0, 127}));
  connect(u_s_eff, product3.u1) annotation(
    Line(points = {{40, 120}, {40, 120}, {40, -54}, {58, -54}, {58, -54}}, color = {0, 0, 127}));
  connect(product1.y, y_WcScld) annotation(
    Line(points = {{82, 60}, {104, 60}, {104, 60}, {110, 60}}, color = {0, 0, 127}));
  connect(u_Wc, product1.u2) annotation(
    Line(points = {{-120, 60}, {-74, 60}, {-74, 54}, {58, 54}, {58, 54}}, color = {0, 0, 127}));
  connect(u_s_Wc, product1.u1) annotation(
    Line(points = {{-60, 120}, {-62, 120}, {-62, 66}, {58, 66}, {58, 66}}, color = {0, 0, 127}));
  annotation(
    defaultComponentName = "SclTrb",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-2, -88}, extent = {{-98, 8}, {102, -12}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)),
    Diagram(coordinateSystem(initialScale = 0.1)));
  
  
end SclTrb_WcEff00;
