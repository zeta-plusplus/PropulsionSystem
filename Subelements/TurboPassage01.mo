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
  parameter PropulsionSystem.Types.switches.switchConstraintTurboPassage swCnstrPass = PropulsionSystem.Types.switches.switchConstraintTurboPassage.constTipRad;
  parameter PropulsionSystem.Types.switches.switchConstraintTurbomechRotation swCnstrRot = PropulsionSystem.Types.switches.switchConstraintTurbomechRotation.None;
  parameter Real BR_in_par = 0.55;
  parameter Real AR_par = 1.2;
  parameter Integer nStgFoil_par = 12;
  parameter units.Length x1_4plot_par = 0.0;
  parameter units.Length rCtr_4plot_par=0.0;
  
  parameter Real Mnt_o_in_par=0.8;
  parameter Real Mnt_m_in_par=0.8;
  parameter Real Mnt_i_in_par=0.8;
  parameter Real Mnt_o_out_par=0.8;
  parameter Real Mnt_m_out_par=0.8;
  parameter Real Mnt_i_out_par=0.8;
  
  parameter Real MnRel_o_in_par=0.95;
  parameter Real MnRel_m_in_par=0.95;
  parameter Real MnRel_i_in_par=0.95;
  parameter Real MnRel_o_out_par=0.95;
  parameter Real MnRel_m_out_par=0.95;
  parameter Real MnRel_i_out_par=0.95;
  
  
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
  units.Length r_o_in(start=0.5);
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
  
  units.AngularVelocity w;
  unitsNonSI.AngularVelocity_rpm Nmech;
  units.Velocity Vt_i_in;
  units.Velocity Vt_m_in;
  units.Velocity Vt_o_in;
  units.Velocity Vt_i_out;
  units.Velocity Vt_m_out;
  units.Velocity Vt_o_out;
  Real Mnt_i_in "Mach tangential";
  Real Mnt_m_in "Mach tangential";
  Real Mnt_o_in "Mach tangential";
  Real Mnt_i_out "Mach tangential";
  Real Mnt_m_out "Mach tangential";
  Real Mnt_o_out "Mach tangential";
  
  Real MnRel_i_in "Mach relative";
  Real MnRel_m_in "Mach relative";
  Real MnRel_o_in "Mach relative";
  Real MnRel_i_out "Mach relative";
  Real MnRel_m_out "Mach relative";
  Real MnRel_o_out "Mach relative";
  
  /* ---------------------------------------------
                                Interface
                    --------------------------------------------- */
  FluidSystemComponents.Interfaces.FluidStaticStateInput portStatIn_inlet annotation(
    Placement(transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}})));
  FluidSystemComponents.Interfaces.FluidStaticStateInput portStatIn_outlet annotation(
    Placement(transformation(origin = {100, 0}, extent = {{10, -10}, {-10, 10}}), iconTransformation(origin = {100, 20}, extent = {{10, -10}, {-10, 10}})));
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange annotation(
    Placement(transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}})));
equation
//------------------------------
  BR_in = BR_in_par;
  AR = AR_par;
  nStgFoil = nStgFoil_par;
  x1_4plot= x1_4plot_par;
  rCtr_4plot=rCtr_4plot_par;
//------------------------------
  A_in=portStatIn_inlet.Aeff;
  A_out=portStatIn_outlet.Aeff;
  
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
  
  //-----
  if(swCnstrRot==PropulsionSystem.Types.switches.switchConstraintTurbomechRotation.Mnt_o_in)then
    Mnt_o_in= Mnt_o_in_par;
  end if;
  
  
  //-----
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
  
  //----------
  0 = flange.tau;
  w = der(flange.phi);
  Nmech= Modelica.Units.Conversions.to_rpm(w);
  
  Vt_i_in = r_i_in*w;
  Vt_m_in = r_m_in*w;
  Vt_o_in = r_o_in*w;
  Mnt_i_in= Vt_i_in/portStatIn_inlet.Vsound;
  Mnt_m_in= Vt_m_in/portStatIn_inlet.Vsound;
  Mnt_o_in= Vt_o_in/portStatIn_inlet.Vsound;
  
  Vt_i_out = r_i_out*w;
  Vt_m_out = r_m_out*w;
  Vt_o_out = r_o_out*w;
  Mnt_i_out= Vt_i_out/portStatIn_outlet.Vsound;
  Mnt_m_out= Vt_m_out/portStatIn_outlet.Vsound;
  Mnt_o_out= Vt_o_out/portStatIn_outlet.Vsound;
  
  MnRel_i_in^2=Mnt_i_in^2 + portStatIn_inlet.Mn^2;
  MnRel_m_in^2=Mnt_m_in^2 + portStatIn_inlet.Mn^2;
  MnRel_o_in^2=Mnt_o_in^2 + portStatIn_inlet.Mn^2;
  
  MnRel_i_out^2=Mnt_i_out^2 + portStatIn_outlet.Mn^2;
  MnRel_m_out^2=Mnt_m_out^2 + portStatIn_outlet.Mn^2;
  MnRel_o_out^2=Mnt_o_out^2 + portStatIn_outlet.Mn^2;
  
  
  annotation(
    defaultComponentName = "TrboPsg",
    Icon(graphics = {Polygon(origin = {0, 1}, fillColor = {154, 153, 150}, fillPattern = FillPattern.Solid, lineThickness = 2, points = {{-100, 31}, {100, 31}, {100, 3}, {60, -1}, {20, -7}, {-20, -13}, {-60, -21}, {-100, -31}, {-100, 31}}), Text(origin = {0, 51}, extent = {{-100, 11}, {100, -11}}, textString = "%name")}, coordinateSystem(preserveAspectRatio = false, extent = {{-100, -40}, {100, 40}})));



end TurboPassage01;