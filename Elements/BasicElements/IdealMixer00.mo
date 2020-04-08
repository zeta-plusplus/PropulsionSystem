within PropulsionSystem.Elements.BasicElements;

model IdealMixer00
  extends PropulsionSystem.BaseClasses.BasicElements.IdealMixerBase00;
  
algorithm
//##### none #####
equation
//##### none #####
  
  
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Mixer",
    Icon(coordinateSystem(extent = {{-100, -60}, {100, 60}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end IdealMixer00;
