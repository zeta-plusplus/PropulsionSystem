within PropulsionSystem.Media.EngineBreathingAir;

package DryAirMethaneMixture00 "N2, O2, and CH4"
  extends Modelica.Media.IdealGases.Common.MixtureGasNasa(mediumName="DryAirMethaneMixture00",
    data={Modelica.Media.IdealGases.Common.SingleGasesData.N2, Modelica.Media.IdealGases.Common.SingleGasesData.O2, Modelica.Media.IdealGases.Common.SingleGasesData.CH4},
	fluidConstants={Modelica.Media.IdealGases.Common.FluidData.N2, Modelica.Media.IdealGases.Common.FluidData.O2, Modelica.Media.IdealGases.Common.FluidData.CH4},
	substanceNames={"Nitrogen","Oxygen","Methane"},
	reference_X= {0.768,0.232,0.0}
    );
  
end DryAirMethaneMixture00;
