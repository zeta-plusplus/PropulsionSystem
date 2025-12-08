within PropulsionSystem.Types.switches;

type switchConstraintTurbomechRotation= enumeration(
  Mnt_o_in "Mn, tangential, tip", 
  Mnt_m_in "Mn, tangential, mean",
  Mnt_i_in "Mn, tangential, hub",
  MnRel_o_in "Mn, Relative, tip", 
  MnRel_m_in "Mn, Relative, mean",
  MnRel_i_in "Mn, Relative, hub",
  
  Mnt_o_out "Mn, tangential, tip", 
  Mnt_m_out "Mn, tangential, mean",
  Mnt_i_out "Mn, tangential, hub",
  MnRel_o_out "Mn, Relative, tip", 
  MnRel_m_out "Mn, Relative, mean",
  MnRel_i_out "Mn, Relative, hub",
  
  Nmech "mech rotational speed",
  None "none"
) annotation(
  Documentation(info = "<html>

</html>"));