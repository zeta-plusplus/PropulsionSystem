within PropulsionSystem.BaseClasses.BasicElements;

model Duct_Base
  extends PropulsionSystem.Interfaces.ElementFrames.ElementFrame_2FluidPorts;
  /********************************************************
      imports
    ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  import PropulsionSystem.Subelements;
  /********************************************************
           Declaration
    ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Type definitions, only valid in this class **********
  type switch_dPqP_Subelement = enumeration(NoSubelement "", Wc2ndOrder "", DynPressure1stOrder "") annotation(
    Documentation(info = "<html>
    
    </html>"));
  //********** Parameters **********
  //##### none #####
  //----- switches -----
  //##### none #####
  //********** Internal variables **********
  Real dPqP(start = 0.001);
  Modelica.SIunits.PressureDifference dP;
  //********** Internal model **********
  //##### none #####
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
//##### none #####
//********** Eqns describing physics **********
//-- pressure --
  dP = dPqP * fluid_1.p;
  fluid_2.p = fluid_1.p - dP;
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
//-- energy conservation --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h = 0;
/********************************************************
  Graphics
********************************************************/
  annotation(
    Icon(graphics = {Rectangle(origin = {0, -6}, fillColor = {211, 211, 211}, fillPattern = FillPattern.Solid, extent = {{-70, 46}, {70, -34}}), Rectangle(origin = {-68, 62}, fillColor = {147, 147, 147}, fillPattern = FillPattern.Solid, extent = {{-2, 20}, {2, -22}}), Rectangle(origin = {68, 62}, fillColor = {147, 147, 147}, fillPattern = FillPattern.Solid, extent = {{-2, 20}, {2, -22}}), Line(origin = {-58.6968, -34.4291}, points = {{-6.97745, -5.58397}, {1.02255, 6.41603}, {7.02255, -5.58397}}, thickness = 1), Line(origin = {-43.5748, -34.0328}, points = {{-6.97745, -5.58397}, {1.02255, 6.41603}, {7.02255, -5.58397}}, thickness = 1), Line(origin = {-28.4528, -33.9566}, points = {{-6.97745, -5.58397}, {1.02255, 6.41603}, {7.02255, -5.58397}}, thickness = 1), Line(origin = {-13.9711, -34.2005}, points = {{-6.97745, -5.58397}, {1.02255, 6.41603}, {7.02255, -5.58397}}, thickness = 1), Line(origin = {0.83073, -33.8042}, points = {{-6.97745, -5.58397}, {1.02255, 6.41603}, {7.02255, -5.58397}}, thickness = 1), Line(origin = {15.6326, -33.728}, points = {{-6.97745, -5.58397}, {1.02255, 6.41603}, {7.02255, -5.58397}}, thickness = 1), Line(origin = {30.7546, -33.6518}, points = {{-6.97745, -5.58397}, {1.02255, 6.41603}, {7.02255, -5.58397}}, thickness = 1), Line(origin = {44.9162, -33.8957}, points = {{-6.97745, -5.58397}, {1.02255, 6.41603}, {7.02255, -5.58397}}, thickness = 1), Line(origin = {59.0778, -33.4994}, points = {{-6.97745, -5.58397}, {1.02255, 6.41603}, {7.02255, -5.58397}}, thickness = 1), Text(origin = {-16, 3}, fillPattern = FillPattern.Solid, extent = {{-54, 7}, {86, -13}}, textString = "%name"), Rectangle(origin = {-78, 80}, rotation = -90, fillColor = {147, 147, 147}, fillPattern = FillPattern.Solid, extent = {{-2, 12}, {2, -22}}), Rectangle(origin = {88, 80}, rotation = -90, fillColor = {147, 147, 147}, fillPattern = FillPattern.Solid, extent = {{-2, 12}, {2, -22}}), Line(origin = {-0.2901, 19.7252}, points = {{-30, 0}, {30, 0}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5)}, coordinateSystem(initialScale = 0.1)));
end Duct_Base;