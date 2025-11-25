within PropulsionSystem.Visualizers;

model PlotRectangle00
  /********************************************************
            imports
    ********************************************************/
  import units = Modelica.Units.SI;
  import unitsNonSI = Modelica.Units.NonSI;
  import cnst = Modelica.Constants;
  
  
  /********************************************************
            Declaration
    ********************************************************/
  /* ---------------------------------------------
            parameters
    --------------------------------------------- */
  parameter units.Length x1_par=0;
  parameter units.Length y1_par=0;
  parameter units.Length delta_x_par=1.5;
  parameter units.Length delta_y_par=1;
  
  /* ---------------------------------------------
            variables
    --------------------------------------------- */
  units.Length x1;
  units.Length y1;
  units.Length delta_x;
  units.Length delta_y;
  units.Length arr4plot_x[5];
  units.Length arr4plot_y[5];
  
equation
  
  x1=x1_par;
  y1=y1_par;
  delta_x=delta_x_par;
  delta_y=delta_y_par;
  
  arr4plot_x[1]=x1;
  arr4plot_x[2]=arr4plot_x[1]+delta_x;
  arr4plot_x[3]=arr4plot_x[2];
  arr4plot_x[4]=arr4plot_x[3]-delta_x;
  arr4plot_x[5]=arr4plot_x[4];
  
  arr4plot_y[1]=y1;
  arr4plot_y[2]=arr4plot_y[1];
  arr4plot_y[3]=arr4plot_y[2]+delta_y;
  arr4plot_y[4]=arr4plot_y[3];
  arr4plot_y[5]=arr4plot_y[4]-delta_y;


annotation(
    defaultComponentName = "plotRect",
    Icon(graphics = {Rectangle(lineColor = {222, 221, 218}, fillColor = {255, 255, 255}, pattern = LinePattern.Dash, fillPattern = FillPattern.Solid, extent = {{-100, 80}, {100, -80}}), Text(origin = {0, -94}, extent = {{-100, 10}, {100, -10}}, textString = "%name"), Rectangle(fillColor = {119, 118, 123}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-80, 40}, {80, -40}})}, coordinateSystem(preserveAspectRatio=false, extent = {{-100, -80}, {100, 80}})));


end PlotRectangle00;