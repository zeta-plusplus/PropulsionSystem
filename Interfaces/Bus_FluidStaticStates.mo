within PropulsionSystem.Interfaces;

expandable connector Bus_FluidStaticStates
  extends Modelica.Icons.SignalBus;
  
  import units = Modelica.Units.SI;
  
  Real Mn;
  units.Area Aeff;
  units.Pressure Ps;
  units.Temperature Ts;
  units.Velocity VelocityOfSound;
  units.SpecificEnthalpy hs;
  
  annotation(
    defaultComponentName = "bus_Static",
    Icon);
end Bus_FluidStaticStates;
