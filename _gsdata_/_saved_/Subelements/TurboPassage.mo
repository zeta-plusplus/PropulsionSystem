within PropulsionSystem.Subelements;

model TurboPassage
  /********************************************************
          imports
  ********************************************************/
  import units=Modelica.Units.SI;
  import unitsNonSI=Modelica.Units.NonSI;
  
  
  
  /********************************************************
          Declaration
  ********************************************************/
  /* ---------------------------------------------
          parameters
  --------------------------------------------- */
  parameter Real BR_in_par=0.55;
  parameter Real AR_par=1.2;
  parameter Integer nStgFoil_par=2;
  
  
  /* ---------------------------------------------
          variables
  --------------------------------------------- */
  Real AR;
  Real rSpan;
  Real nStgFoil;
  
  Real BR_in;
  Real BR_out;
  
  units.Area A_in;
  units.Area A_out;
  
  units.Length x[nStgFoil_par] "x, TE side";
  units.Length r_i[nStgFoil_par] "r, TE side, inner";
  units.Length r_o[nStgFoil_par] "r, TE side, outer";
  units.Length b[nStgFoil_par] "blade/vane span";
  units.Length cAx[nStgFoil_par] "axial length";
  
  
  /* ---------------------------------------------
          Interface
  --