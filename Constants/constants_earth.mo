within PropulsionSystem.Constants;

model constants_earth
  
  
  constant Modelica.SIunits.Pressure pStd= 101.315*1000;
  constant Modelica.SIunits.Temperature Tstd= 288.15;
  constant Modelica.SIunits.Acceleration gravity= 9.81;
  
  
  // gound
  constant Modelica.SIunits.Length alt_ground = 0.0;
  constant Modelica.SIunits.Temperature T_ground = 288.16;
  constant Modelica.SIunits.AbsolutePressure p_ground = 101323.7;
  // upper bound of troposhere
  constant Modelica.SIunits.Length alt_UpBdTropos = 11019.1;
  constant Modelica.SIunits.Temperature T_UpBdTropos = 216.67;
  constant Modelica.SIunits.AbsolutePressure p_UpBdTropos = 22632.9;
  constant Real LapseR1 = -0.0064878;
  // upper bound of stratosphere
  constant Modelica.SIunits.Length alt_UpBdStratos = 25099.1;
  constant Modelica.SIunits.Temperature T_UpBdStratos = 216.67;
  constant Modelica.SIunits.AbsolutePressure p_UpBdStratos = 2486.4;
  constant Real LapseR2 = 0.0;
  
  
end constants_earth;
