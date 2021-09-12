within PropulsionSystem.Elements.BasicElements;

model DuctDpqpWcSecOrder01
  extends PropulsionSystem.BaseClasses.BasicElements.DuctBase00;
  /********************************************************
          imports   
  ********************************************************/
  import Modelica.Constants;
  
  
  /********************************************************
                       Declaration    
  ********************************************************/
  /* ---------------------------------------------
            Internal variables
  --------------------------------------------- */
  discrete Real auxVar "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
  
  //********************************************************************************
protected
  parameter Real kLoss(fixed=false) "" annotation(
    HideResult=false);
  
  
  //********************************************************************************
initial equation
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  dPdes = dP;
  dPqPdes= dP/fluid_1.p;
  kLoss= dPqPdes/(Wc_1_des^2.0);
  
  
  //********************************************************************************
algorithm
  
  
  //********************************************************************************
equation
  
  //--------------------
  if noEvent(time<=environment.timeRemoveDesConstraint) then
    dPqP= auxVar;
  else
    dPqP= kLoss*Wc_1^2;
  end if;
  //--------------------
  
  when(sample(environment.timeRemoveDesConstraint,1.0)and(environment.timeRemoveDesConstraint<time))then
    //if(switch_calcOnlyDes==false)then
    //===== mode: des. pt. -> off des. =====
      auxVar=1.0;
    //end if;
  end when;
  /**/
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Duct",
    Documentation(info = "<html>
  
  
</html>"),
    Icon(coordinateSystem(initialScale = 0.1))
  );
  
  
end DuctDpqpWcSecOrder01;
