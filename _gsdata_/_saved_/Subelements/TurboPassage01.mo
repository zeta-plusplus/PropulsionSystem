within PropulsionSystem.Subelements;

model TurboPassage01
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
  parameter Boolean swInvFwBw=false;
  parameter Types.switches.switchConstraintTurboPassage swCnstrPass = Types.switches.switchConstraintTurboPassage.constTipRad;
  parameter Real BR_in_par = 0.55;
  parameter Real AR_par = 1.2;
  parameter Integer nStgFoil_par = 12;
  parameter units.Length x1_4plot_par = 0.0;
  parameter units.Length rCtr_4plot_par=0.0;
  /* ---------------------------------------------
            variables
    --------------------------------------------- */
  Real AR "aspect ratio";
  Real SR "span ratio";
  Integer nStgFoil;
  Real BR_in;
  units.Area A_in;
  units.Area A_out;
  units.Length x1_4plot "x of inlet";
  units.Length rCtr_4plot "r of center line";
  units.Length r_i_in;
  units.Length r_i_out;
  units.Length r_m_in;
  units.Length r_m_out;
  units.Length r_o_in;
  units.Length r_o_out;
  units.Length x[nStgFoil_par + 1] "x, TE side";
  units.Length r_i[nStgFoil_par + 1] "r, TE side, inner";
  units.Length r_o[nStgFoil_par + 1] "r, TE side, outer";
  units.Length b[nStgFoil_par + 1] "blade/vane span";
  units.Length cAx[nStgFoil_par] "axial length";
  
  units.Length arr4plot_x[3*(nStgFoil_par+1)+3];
  units.Length arr4plot_r[3*(nStgFoil_par+1)+3];
  
  units.Length arr4plot_CtrLine_x[2];
  units.Length arr4plot_CtrLine_r[2];
  /* ---------------------------------------------
                      Interface
          --------------------------------------------- */
  PropulsionSystem.Interfaces.Bus_FluidStaticStates bus_Static_1 annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  PropulsionSystem.Interfaces.Bus_FluidStaticStates bus_Static_2 annotation(
    Placement(transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {100, 20}, extent = {{-10, -10}, {10, 10}})));
equation
//------------------------------
  BR_in = BR_in_par;
  AR = AR_par;
  nStgFoil = nStgFoil_par;
  x1_4plot= x1_4plot_par;
  rCtr_4plot=rCtr_4plot_par;
//------------------------------
  A_in = bus_Static_1.Aeff;
  A_out = bus_Static_2.Aeff;
//------------------------------
  r_i_in = sqrt(A_in/(cnst.pi*(1/BR_in^2 - 1)));
  BR_in= r_i_in/r_o_in;
  
  
  r_m_in =1/2*(r_i_in+r_o_in);
//-----
  if (swCnstrPass == Types.switches.switchConstraintTurboPassage.constTipRad) then
    r_o_out = r_o_in;
  elseif (swCnstrPass == Types.switches.switchConstraintTurboPassage.constHubRad) then
    r_i_out= r_i_in;
  end if;
  
  A_out=cnst.pi*(r_o_out^2-r_i_out^2);
  
  r_m_out =1/2*(r_i_out+r_o_out);
//-----
  SR=b[nStgFoil+1]/b[1];
  //-----
for i in 1:nStgFoil_par loop
    if (i == 1) then
      b[i] = r_o[i] - r_i[i];
      x[i] = 0;
      r_i[i] = r_i_in;
      r_o[i] = r_o_in;
    else
      b[i] = b[i - 1]*SR^(1/nStgFoil);
      x[i] = x[i - 1] + cAx[i - 1];
//-----
      if (swCnstrPass == Types.switches.switchConstraintTurboPassage.constTipRad) then
        r_o[i] = r_o_in;
      elseif (swCnstrPass == Types.switches.switchConstraintTurboPassage.constHubRad) then
        r_i[i] = r_i_in;
      end if;
      r_i[i] = r_o[i] - b[i];
    end if;
    cAx[i] = b[i]*(1 + (SR)^(1/nStgFoil))/(2*AR);
//-----
    arr4plot_x[3*i-2]=x[i]+x1_4plot;
    arr4plot_x[3*i-1]=x[i]+x1_4plot;
    arr4plot_x[3*i-0]=x[i]+x1_4plot;
    
    arr4plot_r[3*i-2]=r_i[i]+rCtr_4plot;
    arr4plot_r[3*i-1]=r_o[i]+rCtr_4plot;
    arr4plot_r[3*i-0]=r_i[i]+rCtr_4plot;
  end for;
//-----
  x[nStgFoil + 1] = x[nStgFoil] + cAx[nStgFoil];
  r_i[nStgFoil + 1] = r_i_out;
  r_o[nStgFoil + 1] = r_o_out;
  b[nStgFoil + 1] = r_o[nStgFoil + 1] - r_i[nStgFoil + 1];
//-----
  arr4plot_x[3*(nStgFoil+1)-2]=x[nStgFoil+1]+x1_4plot;
  arr4plot_x[3*(nStgFoil+1)-1]=x[nStgFoil+1]+x1_4plot;
  arr4plot_x[3*(nStgFoil+1)-0]=x[nStgFoil+1]+x1_4plot;
  
  arr4plot_r[3*(nStgFoil+1)-2]=r_i[nStgFoil+1]+rCtr_4plot;
  arr4plot_r[3*(nStgFoil+1)-1]=r_o[nStgFoil+1]+rCtr_4plot;
  arr4plot_r[3*(nStgFoil+1)-0]=r_i[nStgFoil+1]+rCtr_4plot;
  
  arr4plot_x[3*(nStgFoil+1)+1]=x[nStgFoil+1]+x1_4plot;
  arr4plot_x[3*(nStgFoil+1)+2]=x[1]+x1_4plot;
  arr4plot_x[3*(nStgFoil+1)+3]=x[1]+x1_4plot;
  
  arr4plot_r[3*(nStgFoil+1)+1]=r_o[nStgFoil+1]+rCtr_4plot;
  arr4plot_r[3*(nStgFoil+1)+2]=r_o[1]+rCtr_4plot;
  arr4plot_r[3*(nStgFoil+1)+3]=r_i[1]+rCtr_4plot;
  
  arr4plot_CtrLine_x[1]=-0.1*(x[nStgFoil + 1]-x[1])+x1_4plot;
  arr4plot_CtrLine_x[2]=x[nStgFoil + 1]+0.1*(x[nStgFoil + 1]-x[1])+x1_4plot;
  arr4plot_CtrLine_r[1]=rCtr_4plot;
  arr4plot_CtrLine_r[2]=rCtr_4plot;
  
  
  
  annotation(
    defaultComponentName = "TrboPsg",
    Icon(graphics = {Polygon(origin = {0, 1}, fillColor = {154, 153, 150}, fillPattern = FillPattern.Solid, lineThickness = 2, points = {{-100, 31}, {100, 31}, {100, 3}, {60, -1}, {20, -7}, {-20, -13}, {-60, -21}, {-100, -31}, {-100, 31}}), Text(origin = {0, -49}, extent = {{-100, 11}, {100, -11}}, textString = "%name")}, coordinateSystem(preserveAspectRatio = false, extent = {{-100, -40}, {100, 40}})));



end TurboPassage01;