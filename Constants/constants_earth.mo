within PropulsionSystem.Constants;

model constants_earth
  
  //
  import units = Modelica.Units.SI;
  
  //
  constant units.Pressure pStd= 101.315*1000;
  constant units.Temperature Tstd= 288.15;
  constant units.Acceleration gravity= 9.81;
  
  
  // gound
  constant units.Length alt_ground = 0.0;
  constant units.Temperature T_ground = 288.16;
  constant units.AbsolutePressure p_ground = 101323.7;
  // upper bound of troposhere
  constant units.Length alt_UpBdTropos = 11019.1;
  constant units.Temperature T_UpBdTropos = 216.67;
  constant units.AbsolutePressure p_UpBdTropos = 22632.9;
  constant Real LapseR1 = -0.0064878;
  // upper bound of stratosphere
  constant units.Length alt_UpBdStratos = 25099.1;
  constant units.Temperature T_UpBdStratos = 216.67;
  constant units.AbsolutePressure p_UpBdStratos = 2486.4;
  constant Real LapseR2 = 0.0;
  
  
end constants_earth;
