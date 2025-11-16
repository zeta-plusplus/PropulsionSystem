within PropulsionSystem.Subelements;

model TurboPassage00
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
  parameter Types.switches.switchConstraintTurboPassage swCnstrPass = Types.switches.switchConstraintTurboPassage.constTipRad;
  parameter Real BR_in_par = 0.55;
  parameter Real AR_par = 1.2;
  parameter Integer nStgFoil_par = 6;
  parameter units.Length x1_par = 0.0;
  parameter units.Length rCtr_par=0.0;
  /* ---------------------------------------------
            variables
    --------------------------------------------- */
  Real AR "aspect ratio";
  Real SR "span ratio";
  Integer nStgFoil;
  Real BR_in;
  units.Area A_in;
  units.Area A_out;
  units.Length x1 "x of inlet";
  units.Length rCtr "r of center line";
  units.Length r_i_in;
  units.Length r_i_out;
  units.Length r_o_in;
  units.Length r_o_out;
  units.Length x[nStgFoil_par + 1] "x, TE side";
  units.Length r_i[nStgFoil_par + 1] "r, TE side, inner";
  units.Length r_o[nStgFoil_par + 1] "r, TE side, outer";
  units.Length b[nStgFoil_par + 1] "blade/vane span";
  units.Length cAx[nStgFoil_par] "axial length";
  
  units.Length arr_x[3*nStgFoil_par+3];
  units.Length arr_r[3*nStgFoil_par+3];
  
  /* ---------------------------------------------
                Interface
    --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_A_in annotation(
    Placement(transformation(origin = {-100, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-99, 0}, extent = {{-5, -5}, {5, 5}})));
  Modelica.Blocks.Interfaces.RealInput u_A_out annotation(
    Placement(transformation(origin = {100, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {99, 20}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));


equation
//------------------------------
  BR_in = BR_in_par;
  AR = AR_par;
  nStgFoil = nStgFoil_par;
  x1= x1_par;
  rCtr=rCtr_par;
//------------------------------
  A_in = u_A_in;
  A_out = u_A_out;
//------------------------------
  r_i_in = sqrt(A_in/(cnst.pi*(1/BR_in^2 - 1))) + rCtr;
  r_o_in = r_i_in/BR_in + rCtr;
  //-----
  if (swCnstrPass == Types.switches.switchConstraintTurboPassage.constTipRad) then
    r_o_out = r_o_in + rCtr;
    r_i_out = sqrt(r_o_out^2 - A_out/cnst.pi) + rCtr;
  end if;
  
  //-----
  SR=b[nStgFoil+1]/b[1];
  
//-----
  for i in 1:nStgFoil_par loop
    if (i == 1) then
      b[i] = r_o[i] - r_i[i];
      x[i] = x1;
      r_i[i] = r_i_in + rCtr;
      r_o[i] = r_o_in + rCtr;
    else
      b[i] = b[i - 1]*SR^(1/nStgFoil);
      x[i] = x[i - 1] + cAx[i - 1];
      if (swCnstrPass == Types.switches.switchConstraintTurboPassage.constTipRad) then
        r_o[i] = r_o_in + rCtr;
        r_i[i] = r_o[i] - b[i] + rCtr;
      end if;
    end if;
    cAx[i] = b[i]*(1 + (SR)^(1/nStgFoil))/(2*AR);
    
    //-----
    
  end for;
//-----
  x[nStgFoil + 1] = x[nStgFoil] + cAx[nStgFoil];
  r_i[nStgFoil + 1] = r_i_out + rCtr;
  r_o[nStgFoil + 1] = r_o_out + rCtr;
  b[nStgFoil + 1] = r_o[nStgFoil + 1] - r_i[nStgFoil + 1];
  
  
  
  annotation(
    defaultComponentName = "TrboPsg",
    Icon(graphics = {Polygon(origin = {0, 1}, fillColor = {154, 153, 150}, fillPattern = FillPattern.Solid, lineThickness = 2, points = {{-100, 31}, {100, 31}, {100, 3}, {60, -1}, {20, -7}, {-20, -13}, {-60, -21}, {-100, -31}, {-100, 31}}), Text(origin = {0, -49}, extent = {{-100, 11}, {100, -11}}, textString = "%name")}, coordinateSystem(preserveAspectRatio = false, extent = {{-100, -40}, {100, 40}})));


end TurboPassage00;