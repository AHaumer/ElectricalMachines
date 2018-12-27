within ;
package ElectricalMachines "Electrical machine models with Parameter records"
  extends Modelica.Icons.Package;
  package Examples
    extends Modelica.Icons.ExamplesPackage;
    package QuasiStatic
      extends Modelica.Icons.ExamplesPackage;
      model DCPM_NominalOperation
        extends Modelica.Icons.Example;
        import Modelica.Utilities.Streams.print;
        import Modelica.SIunits.Conversions.to_rpm;
        parameter Modelica.SIunits.Torque tau0=
          dcpm.data.ViNominal*dcpm.data.IaNominal/dcpm.data.wNominal
          "Estimated initial torque";
        .ElectricalMachines.QuasiStatic.DCMachines.DC_PermanentMagnet dcpm(
            phiMechanical(fixed=true), wMechanical(fixed=true, start=dcpm.data.wNominal))
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
            Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={6,30})));
        Modelica.Electrical.Analog.Sources.ConstantVoltage armatureVoltage(V=dcpm.data.VaNominal)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,30})));
        Modelica.Electrical.Analog.Basic.Ground                      ground
          annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
        Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
          annotation (Placement(transformation(extent={{20,-10},{40,10}})));
        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{70,-10},{50,10}})));
        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{20,50},{40,70}})));
        Modelica.Blocks.Sources.Constant const(k=dcpm.data.IaNominal)
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
        Modelica.Blocks.Continuous.Integrator integralController(
          k=1000,
          initType=Modelica.Blocks.Types.Init.InitialOutput,
          y_start=tau0)
          annotation (Placement(transformation(extent={{50,50},{70,70}})));
        Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={80,30})));
      equation
        when terminal() then
          print("w  ="+String(to_rpm(multiSensor.w), significantDigits=16)+"rpm");
          print("tau="+String(multiSensor.tau, significantDigits=9)+"Nm");
        end when;
        connect(torque.flange, multiSensor.flange_b)
          annotation (Line(points={{50,0},{40,0}}, color={0,0,0}));
        connect(dcpm.flange, multiSensor.flange_a)
          annotation (Line(points={{10,0},{20,0}}, color={0,0,0}));
        connect(const.y, feedback.u1)
          annotation (Line(points={{11,60},{22,60}},color={0,0,127}));
        connect(feedback.y, integralController.u)
          annotation (Line(points={{39,60},{48,60}}, color={0,0,127}));
        connect(armatureVoltage.p, currentSensor.p)
          annotation (Line(points={{-80,40},{6,40}},   color={0,0,255}));
        connect(currentSensor.n, dcpm.pin_ap)
          annotation (Line(points={{6,20},{6,10}},     color={0,0,255}));
        connect(armatureVoltage.n, ground.p)
          annotation (Line(points={{-80,20},{-80,-20}}, color={0,0,255}));
        connect(currentSensor.i, feedback.u2)
          annotation (Line(points={{16,30},{30,30},{30,52}}, color={0,0,127}));
        connect(armatureVoltage.n, dcpm.pin_an)
          annotation (Line(points={{-80,20},{-6,20},{-6,10}},   color={0,0,255}));
        connect(integralController.y, gain.u)
          annotation (Line(points={{71,60},{80,60},{80,42}}, color={0,0,127}));
        connect(gain.y, torque.tau)
          annotation (Line(points={{80,19},{80,0},{72,0}}, color={0,0,127}));
        annotation (experiment(Interval=0.001, Tolerance=1e-06));
      end DCPM_NominalOperation;

      model DCEE_NominalOperation
        extends Modelica.Icons.Example;
        import Modelica.Utilities.Streams.print;
        import Modelica.SIunits.Conversions.to_rpm;
        parameter Modelica.SIunits.Voltage VeNominal=
          Modelica.Electrical.Machines.Thermal.convertResistance(
          dcee.data.Re, dcee.data.TeRef, dcee.data.alpha20e, dcee.data.TeNominal)*dcee.data.IeNominal
          "Nominal excitation voltage";
        parameter Modelica.SIunits.Torque tau0=
          dcee.data.ViNominal*dcee.data.IaNominal/dcee.data.wNominal
          "Estimated initial torque";
        .ElectricalMachines.QuasiStatic.DCMachines.DC_ElectricalExcited dcee(
            phiMechanical(fixed=true), wMechanical(fixed=true, start=dcee.data.wNominal))
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
            Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={6,30})));
        Modelica.Electrical.Analog.Sources.ConstantVoltage armatureVoltage(V=dcee.data.VaNominal)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,30})));
        Modelica.Electrical.Analog.Basic.Ground                      ground
          annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
        Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
          annotation (Placement(transformation(extent={{20,-10},{40,10}})));
        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{70,-10},{50,10}})));
        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{20,50},{40,70}})));
        Modelica.Blocks.Sources.Constant const(k=dcee.data.IaNominal)
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
        Modelica.Blocks.Continuous.Integrator integralController(
          k=1000,
          initType=Modelica.Blocks.Types.Init.InitialOutput,
          y_start=tau0)
          annotation (Placement(transformation(extent={{50,50},{70,70}})));
        Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={80,30})));
        Modelica.Electrical.Analog.Sources.ConstantVoltage excitationVoltage(V=
              VeNominal) annotation (Placement(transformation(
              extent={{10,10},{-10,-10}},
              rotation=90,
              origin={-30,-10})));
        Modelica.Electrical.Analog.Basic.Ground                      groundE
          annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
      equation
        when terminal() then
          print("w  ="+String(to_rpm(multiSensor.w), significantDigits=16)+"rpm");
          print("tau="+String(multiSensor.tau, significantDigits=9)+"Nm");
        end when;
        connect(torque.flange, multiSensor.flange_b)
          annotation (Line(points={{50,0},{40,0}}, color={0,0,0}));
        connect(dcee.flange, multiSensor.flange_a)
          annotation (Line(points={{10,0},{20,0}}, color={0,0,0}));
        connect(const.y, feedback.u1)
          annotation (Line(points={{11,60},{22,60}},color={0,0,127}));
        connect(feedback.y, integralController.u)
          annotation (Line(points={{39,60},{48,60}}, color={0,0,127}));
        connect(armatureVoltage.p, currentSensor.p)
          annotation (Line(points={{-80,40},{6,40}},   color={0,0,255}));
        connect(currentSensor.n, dcee.pin_ap)
          annotation (Line(points={{6,20},{6,10}},     color={0,0,255}));
        connect(armatureVoltage.n, ground.p)
          annotation (Line(points={{-80,20},{-80,-20}}, color={0,0,255}));
        connect(currentSensor.i, feedback.u2)
          annotation (Line(points={{16,30},{30,30},{30,52}}, color={0,0,127}));
        connect(integralController.y, gain.u)
          annotation (Line(points={{71,60},{80,60},{80,42}}, color={0,0,127}));
        connect(gain.y, torque.tau)
          annotation (Line(points={{80,19},{80,0},{72,0}}, color={0,0,127}));
        connect(armatureVoltage.n, dcee.pin_an)
          annotation (Line(points={{-80,20},{-6,20},{-6,10}}, color={0,0,255}));
        connect(excitationVoltage.p, dcee.pin_ep)
          annotation (Line(points={{-30,0},{-30,6},{-10,6}}, color={0,0,255}));
        connect(excitationVoltage.n, groundE.p)
          annotation (Line(points={{-30,-20},{-30,-30}},           color={0,0,255}));
        connect(excitationVoltage.n, dcee.pin_en)
          annotation (Line(points={{-30,-20},{-10,-20},{-10,-6}}, color={0,0,255}));
        annotation (experiment(Interval=0.001, Tolerance=1e-06));
      end DCEE_NominalOperation;

      model DCSE_NominalOperation
        extends Modelica.Icons.Example;
        import Modelica.Utilities.Streams.print;
        import Modelica.SIunits.Conversions.to_rpm;
        parameter Modelica.SIunits.Torque tau0=
          dcse.data.ViNominal*dcse.data.IaNominal/dcse.data.wNominal
          "Estimated initial torque";
        .ElectricalMachines.QuasiStatic.DCMachines.DC_SeriesExcited dcse(
            phiMechanical(fixed=true), wMechanical(fixed=true, start=dcse.data.wNominal))
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
            Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={6,30})));
        Modelica.Electrical.Analog.Sources.ConstantVoltage armatureVoltage(V=dcse.data.VaNominal)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,30})));
        Modelica.Electrical.Analog.Basic.Ground                      ground
          annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
        Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
          annotation (Placement(transformation(extent={{20,-10},{40,10}})));
        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{70,-10},{50,10}})));
        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{20,50},{40,70}})));
        Modelica.Blocks.Sources.Constant const(k=dcse.data.IaNominal)
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
        Modelica.Blocks.Continuous.Integrator integralController(
          k=1000,
          initType=Modelica.Blocks.Types.Init.InitialOutput,
          y_start=tau0)
          annotation (Placement(transformation(extent={{50,50},{70,70}})));
        Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={80,30})));
      equation
        when terminal() then
          print("w  ="+String(to_rpm(multiSensor.w), significantDigits=16)+"rpm");
          print("tau="+String(multiSensor.tau, significantDigits=9)+"Nm");
        end when;
        connect(torque.flange, multiSensor.flange_b)
          annotation (Line(points={{50,0},{40,0}}, color={0,0,0}));
        connect(dcse.flange, multiSensor.flange_a)
          annotation (Line(points={{10,0},{20,0}}, color={0,0,0}));
        connect(const.y, feedback.u1)
          annotation (Line(points={{11,60},{22,60}},color={0,0,127}));
        connect(feedback.y, integralController.u)
          annotation (Line(points={{39,60},{48,60}}, color={0,0,127}));
        connect(armatureVoltage.p, currentSensor.p)
          annotation (Line(points={{-80,40},{6,40}},   color={0,0,255}));
        connect(currentSensor.n, dcse.pin_ap)
          annotation (Line(points={{6,20},{6,10}},     color={0,0,255}));
        connect(armatureVoltage.n, ground.p)
          annotation (Line(points={{-80,20},{-80,-20}}, color={0,0,255}));
        connect(currentSensor.i, feedback.u2)
          annotation (Line(points={{16,30},{30,30},{30,52}}, color={0,0,127}));
        connect(ground.p, dcse.pin_en)
          annotation (Line(points={{-80,-20},{-10,-20},{-10,-6}}, color={0,0,255}));
        connect(dcse.pin_an, dcse.pin_ep)
          annotation (Line(points={{-6,10},{-10,10},{-10,6}},  color={0,0,255}));
        connect(integralController.y, gain.u)
          annotation (Line(points={{71,60},{80,60},{80,42}}, color={0,0,127}));
        connect(gain.y, torque.tau)
          annotation (Line(points={{80,19},{80,0},{72,0}}, color={0,0,127}));
        annotation (experiment(Interval=0.001, Tolerance=1e-06));
      end DCSE_NominalOperation;

      model IMC_NominalOperation
        extends Modelica.Icons.Example;
        import Modelica.Constants.pi;
        import Modelica.Utilities.Streams.print;
        import Modelica.SIunits.Conversions.to_rpm;
        parameter Modelica.SIunits.Torque tau0=161.401185 "Estimated initial torque";
        Real pf=powerSensor.y.re/powerSensor.abs_y "Power factor";
        .ElectricalMachines.QuasiStatic.FundamentalWave.IM_SquirrelCage imc(gamma(
              fixed=true), wMechanical(fixed=true, start=imc.data.wNominal))
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
          terminalBox(m=imc.m, terminalConnection="Y")
          annotation (Placement(transformation(extent={{-10,6},{10,26}})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentQuasiRMSSensor
          currentQuasiRMSSensor(m=imc.m) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={0,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource
          voltageSource(
          m=imc.m,
          gamma(fixed=true, start=0),
          f=imc.data.fsNominal,
          V=fill(imc.data.VsNominal, imc.m)) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star(m=imc.m)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,0})));
        Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground
          annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
        Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
          annotation (Placement(transformation(extent={{20,-10},{40,10}})));
        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{70,-10},{50,10}})));
        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{20,50},{40,70}})));
        Modelica.Blocks.Sources.Constant const(k=imc.data.IsNominal)
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
        Modelica.Blocks.Continuous.Integrator integralController(
          k=1000,
          initType=Modelica.Blocks.Types.Init.InitialOutput,
          y_start=tau0)
          annotation (Placement(transformation(extent={{50,50},{70,70}})));
        Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={80,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor
          powerSensor
          annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
      equation
        when terminal() then
          print("w  ="+String(to_rpm(multiSensor.w), significantDigits=16)+"rpm");
          print("tau="+String(multiSensor.tau, significantDigits=9)+"Nm");
          print("pf ="+String(pf, significantDigits=9));
        end when;
        connect(terminalBox.plug_sn, imc.plug_sn)
          annotation (Line(points={{-6,10},{-6,10}},   color={85,170,255}));
        connect(terminalBox.plug_sp, imc.plug_sp)
          annotation (Line(points={{6,10},{6,10}},     color={85,170,255}));
        connect(currentQuasiRMSSensor.plug_n, terminalBox.plugSupply)
          annotation (Line(points={{0,20},{0,12}},     color={85,170,255}));
        connect(ground.pin, terminalBox.starpoint) annotation (Line(points={{-80,-20},
                {-70,-20},{-70,12},{-9,12}},  color={85,170,255}));
        connect(torque.flange, multiSensor.flange_b)
          annotation (Line(points={{50,0},{40,0}}, color={0,0,0}));
        connect(imc.flange, multiSensor.flange_a)
          annotation (Line(points={{10,0},{20,0}}, color={0,0,0}));
        connect(currentQuasiRMSSensor.I, feedback.u2)
          annotation (Line(points={{10,30},{30,30},{30,52}},  color={0,0,127}));
        connect(const.y, feedback.u1)
          annotation (Line(points={{11,60},{22,60}},color={0,0,127}));
        connect(feedback.y, integralController.u)
          annotation (Line(points={{39,60},{48,60}}, color={0,0,127}));
        connect(star.pin_n, ground.pin)
          annotation (Line(points={{-80,-10},{-80,-20}}, color={85,170,255}));
        connect(voltageSource.plug_n, star.plug_p)
          annotation (Line(points={{-80,20},{-80,10}}, color={85,170,255}));
        connect(integralController.y, gain.u)
          annotation (Line(points={{71,60},{80,60},{80,42}}, color={0,0,127}));
        connect(gain.y, torque.tau)
          annotation (Line(points={{80,19},{80,0},{72,0}}, color={0,0,127}));
        connect(voltageSource.plug_p, powerSensor.currentP)
          annotation (Line(points={{-80,40},{-60,40}}, color={85,170,255}));
        connect(powerSensor.currentN, currentQuasiRMSSensor.plug_p)
          annotation (Line(points={{-40,40},{0,40}},   color={85,170,255}));
        connect(powerSensor.currentP, powerSensor.voltageP)
          annotation (Line(points={{-60,40},{-60,50},{-50,50}}, color={85,170,255}));
        connect(voltageSource.plug_n, powerSensor.voltageN)
          annotation (Line(points={{-80,20},{-50,20},{-50,30}}, color={85,170,255}));
        annotation (experiment(Interval=0.001, Tolerance=1e-06));
      end IMC_NominalOperation;

      model IMS_NominalOperation
        extends Modelica.Icons.Example;
        import Modelica.Constants.pi;
        import Modelica.Utilities.Streams.print;
        import Modelica.SIunits.Conversions.to_rpm;
        parameter Modelica.SIunits.Torque tau0=161.401185 "Estimated initial torque";
        Real pf=powerSensor.y.re/powerSensor.abs_y "Power factor";
        .ElectricalMachines.QuasiStatic.FundamentalWave.IM_SlipRing ims(gamma(
              fixed=true), wMechanical(fixed=true, start=ims.data.wNominal))
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
          terminalBox(m=ims.m, terminalConnection="Y")
          annotation (Placement(transformation(extent={{-10,6},{10,26}})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentQuasiRMSSensor
          currentQuasiRMSSensor(m=ims.m) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={0,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource
          voltageSource(
          m=ims.m,
          gamma(fixed=true, start=0),
          f=ims.data.fsNominal,
          V=fill(ims.data.VsNominal, ims.m)) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star(m=ims.m)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,0})));
        Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground
          annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
        Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
          annotation (Placement(transformation(extent={{20,-10},{40,10}})));
        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{70,-10},{50,10}})));
        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{20,50},{40,70}})));
        Modelica.Blocks.Sources.Constant const(k=ims.data.IsNominal)
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
        Modelica.Blocks.Continuous.Integrator integralController(
          k=1000,
          initType=Modelica.Blocks.Types.Init.InitialOutput,
          y_start=tau0)
          annotation (Placement(transformation(extent={{50,50},{70,70}})));
        Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
          terminalBox1(m=ims.m, terminalConnection="Y")
          annotation (Placement(transformation(extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-16,0})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star starR(m=ims.m)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-30,-10})));
        Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundR
          annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
        Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={80,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor
          powerSensor
          annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
      equation
        when terminal() then
          print("w  ="+String(to_rpm(multiSensor.w), significantDigits=16)+"rpm");
          print("tau="+String(multiSensor.tau, significantDigits=9)+"Nm");
          print("pf ="+String(pf, significantDigits=9));
        end when;
        connect(terminalBox.plug_sn,ims. plug_sn)
          annotation (Line(points={{-6,10},{-6,10}},   color={85,170,255}));
        connect(terminalBox.plug_sp,ims. plug_sp)
          annotation (Line(points={{6,10},{6,10}},     color={85,170,255}));
        connect(currentQuasiRMSSensor.plug_n, terminalBox.plugSupply)
          annotation (Line(points={{0,20},{0,12}},     color={85,170,255}));
        connect(star.pin_n, ground.pin)
          annotation (Line(points={{-80,-10},{-80,-20}}, color={85,170,255}));
        connect(voltageSource.plug_n, star.plug_p)
          annotation (Line(points={{-80,20},{-80,10}}, color={85,170,255}));
        connect(ground.pin, terminalBox.starpoint) annotation (Line(points={{-80,-20},
                {-70,-20},{-70,12},{-9,12}},  color={85,170,255}));
        connect(torque.flange, multiSensor.flange_b)
          annotation (Line(points={{50,0},{40,0}}, color={0,0,0}));
        connect(ims.flange, multiSensor.flange_a)
          annotation (Line(points={{10,0},{20,0}}, color={0,0,0}));
        connect(currentQuasiRMSSensor.I, feedback.u2)
          annotation (Line(points={{10,30},{30,30},{30,52}},  color={0,0,127}));
        connect(const.y, feedback.u1)
          annotation (Line(points={{11,60},{22,60}},color={0,0,127}));
        connect(feedback.y, integralController.u)
          annotation (Line(points={{39,60},{48,60}}, color={0,0,127}));
        connect(terminalBox1.plug_sp, ims.plug_rp)
          annotation (Line(points={{-10,6},{-10,6}}, color={85,170,255}));
        connect(terminalBox1.plug_sn, ims.plug_rn)
          annotation (Line(points={{-10,-6},{-10,-6}}, color={85,170,255}));
        connect(starR.plug_p, terminalBox1.plugSupply)
          annotation (Line(points={{-30,0},{-12,0}}, color={85,170,255}));
        connect(starR.pin_n,groundR. pin)
          annotation (Line(points={{-30,-20},{-30,-30}}, color={85,170,255}));
        connect(groundR.pin, terminalBox1.starpoint) annotation (Line(points={{-30,-30},
                {-12,-30},{-12,-9}},          color={85,170,255}));
        connect(integralController.y, gain.u)
          annotation (Line(points={{71,60},{80,60},{80,42}}, color={0,0,127}));
        connect(gain.y, torque.tau)
          annotation (Line(points={{80,19},{80,0},{72,0}}, color={0,0,127}));
        connect(voltageSource.plug_p, powerSensor.currentP)
          annotation (Line(points={{-80,40},{-60,40}}, color={85,170,255}));
        connect(powerSensor.currentN, currentQuasiRMSSensor.plug_p)
          annotation (Line(points={{-40,40},{0,40}},   color={85,170,255}));
        connect(powerSensor.currentP, powerSensor.voltageP)
          annotation (Line(points={{-60,40},{-60,50},{-50,50}}, color={85,170,255}));
        connect(voltageSource.plug_n, powerSensor.voltageN)
          annotation (Line(points={{-80,20},{-50,20},{-50,30}}, color={85,170,255}));
        annotation (experiment(Interval=0.001, Tolerance=1e-06));
      end IMS_NominalOperation;

      model SMPM_NominalOperation
        extends Modelica.Icons.Example;
        import Modelica.Constants.pi;
        import Modelica.Utilities.Streams.print;
        import Modelica.SIunits.Conversions.to_deg;
        parameter Modelica.SIunits.Torque tau0=181.4447 "Estimated initial torque";
        parameter Modelica.SIunits.Angle gammar0=110.7561*pi/180
          "Estimated initial rotor angle";
        Real pf=powerSensor.y.re/powerSensor.abs_y "Power factor";
        .ElectricalMachines.QuasiStatic.FundamentalWave.SM_PermanentMagnet smpm(gammar(
              fixed=true, start=gammar0), wMechanical(fixed=true, start=smpm.data.wNominal))
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
          terminalBox(m=smpm.m, terminalConnection="Y")
          annotation (Placement(transformation(extent={{-10,6},{10,26}})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentQuasiRMSSensor
          currentQuasiRMSSensor(m=smpm.m) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={0,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource
          voltageSource(
          m=smpm.m,
          gamma(fixed=true, start=0),
          f=smpm.data.fsNominal,
          V=fill(smpm.data.VsNominal, smpm.m)) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star(m=smpm.m)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,0})));
        Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground
          annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
        Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
          annotation (Placement(transformation(extent={{20,-10},{40,10}})));
        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{70,-10},{50,10}})));
        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{20,50},{40,70}})));
        Modelica.Blocks.Sources.Constant const(k=smpm.data.IsNominal)
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
        Modelica.Blocks.Continuous.Integrator integralController(
          k=1000,
          initType=Modelica.Blocks.Types.Init.InitialOutput,
          y_start=tau0)
          annotation (Placement(transformation(extent={{50,50},{70,70}})));
        Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={80,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor
          powerSensor
          annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
      equation
        when terminal() then
          print("gammar="+String(to_deg(smpm.gammar), significantDigits=16)+"deg");
          print("tau   ="+String(multiSensor.tau, significantDigits=9)+"Nm");
          print("pf    ="+String(pf, significantDigits=9));
        end when;
        connect(terminalBox.plug_sn, smpm.plug_sn)
          annotation (Line(points={{-6,10},{-6,10}},   color={85,170,255}));
        connect(terminalBox.plug_sp, smpm.plug_sp)
          annotation (Line(points={{6,10},{6,10}},     color={85,170,255}));
        connect(currentQuasiRMSSensor.plug_n, terminalBox.plugSupply)
          annotation (Line(points={{0,20},{0,12}},     color={85,170,255}));
        connect(ground.pin, terminalBox.starpoint) annotation (Line(points={{-80,-20},
                {-70,-20},{-70,12},{-9,12}},  color={85,170,255}));
        connect(torque.flange, multiSensor.flange_b)
          annotation (Line(points={{50,0},{40,0}}, color={0,0,0}));
        connect(smpm.flange, multiSensor.flange_a)
          annotation (Line(points={{10,0},{20,0}}, color={0,0,0}));
        connect(currentQuasiRMSSensor.I, feedback.u2)
          annotation (Line(points={{10,30},{30,30},{30,52}},  color={0,0,127}));
        connect(const.y, feedback.u1)
          annotation (Line(points={{11,60},{22,60}},color={0,0,127}));
        connect(feedback.y, integralController.u)
          annotation (Line(points={{39,60},{48,60}}, color={0,0,127}));
        connect(star.pin_n, ground.pin)
          annotation (Line(points={{-80,-10},{-80,-20}}, color={85,170,255}));
        connect(voltageSource.plug_n, star.plug_p)
          annotation (Line(points={{-80,20},{-80,10}}, color={85,170,255}));
        connect(integralController.y, gain.u)
          annotation (Line(points={{71,60},{80,60},{80,42}}, color={0,0,127}));
        connect(gain.y, torque.tau)
          annotation (Line(points={{80,19},{80,0},{72,0}}, color={0,0,127}));
        connect(voltageSource.plug_p, powerSensor.currentP)
          annotation (Line(points={{-80,40},{-60,40}}, color={85,170,255}));
        connect(powerSensor.currentN, currentQuasiRMSSensor.plug_p)
          annotation (Line(points={{-40,40},{0,40}},   color={85,170,255}));
        connect(powerSensor.currentP, powerSensor.voltageP)
          annotation (Line(points={{-60,40},{-60,50},{-50,50}}, color={85,170,255}));
        connect(voltageSource.plug_n, powerSensor.voltageN)
          annotation (Line(points={{-80,20},{-50,20},{-50,30}}, color={85,170,255}));
        annotation (experiment(Interval=0.001, Tolerance=1e-06));
      end SMPM_NominalOperation;

      model SMEE_NominalOperation
        extends Modelica.Icons.Example;
        import Modelica.Constants.pi;
        import Modelica.Utilities.Streams.print;
        import Modelica.SIunits.Conversions.to_deg;
        parameter Modelica.SIunits.Torque tau0=185.2564 "Estimated initial torque";
        parameter Modelica.SIunits.Angle gammar0=148.7736*pi/180
          "Estimated initial rotor angle";
        parameter Modelica.SIunits.Current Ie0=18.7107 "Estimated initial excitation current";
        Real pf=powerSensor.y.re/powerSensor.abs_y "Power factor";
        .ElectricalMachines.QuasiStatic.FundamentalWave.SM_ElectricalExcited smee(gammar(
              fixed=true, start=gammar0), wMechanical(fixed=true, start=smee.data.wNominal))
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
          terminalBox(m=smee.m, terminalConnection="Y")
          annotation (Placement(transformation(extent={{-10,6},{10,26}})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentQuasiRMSSensor
          currentQuasiRMSSensor(m=smee.m) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={0,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource
          voltageSource(
          m=smee.m,
          gamma(fixed=true, start=0),
          f=smee.data.fsNominal,
          V=fill(smee.data.VsNominal, smee.m)) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star(m=smee.m)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,0})));
        Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground
          annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
        Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
          annotation (Placement(transformation(extent={{20,-10},{40,10}})));
        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{70,-10},{50,10}})));
        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{20,50},{40,70}})));
        Modelica.Blocks.Sources.Constant const(k=smee.data.IsNominal)
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
        Modelica.Blocks.Continuous.Integrator integralController(
          k=1000,
          initType=Modelica.Blocks.Types.Init.InitialOutput,
          y_start=tau0)
          annotation (Placement(transformation(extent={{50,50},{70,70}})));
        Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={80,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor
          powerSensor
          annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
        Modelica.Electrical.Analog.Basic.Ground groundE
          annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
        Modelica.Electrical.Analog.Sources.ConstantCurrent excitationCurrent(I=Ie0)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=90,
              origin={-30,-10})));
      equation
        when terminal() then
          print("gammar=" + String(to_deg(smee.gammar), significantDigits=16) + "deg");
          print("tau   ="+String(multiSensor.tau, significantDigits=9)+"Nm");
          print("pf    ="+String(pf, significantDigits=9));
        end when;
        connect(terminalBox.plug_sn, smee.plug_sn)
          annotation (Line(points={{-6,10},{-6,10}},   color={85,170,255}));
        connect(terminalBox.plug_sp, smee.plug_sp)
          annotation (Line(points={{6,10},{6,10}},     color={85,170,255}));
        connect(currentQuasiRMSSensor.plug_n, terminalBox.plugSupply)
          annotation (Line(points={{0,20},{0,12}},     color={85,170,255}));
        connect(ground.pin, terminalBox.starpoint) annotation (Line(points={{-80,-20},
                {-70,-20},{-70,12},{-9,12}},  color={85,170,255}));
        connect(torque.flange, multiSensor.flange_b)
          annotation (Line(points={{50,0},{40,0}}, color={0,0,0}));
        connect(smee.flange, multiSensor.flange_a)
          annotation (Line(points={{10,0},{20,0}}, color={0,0,0}));
        connect(currentQuasiRMSSensor.I, feedback.u2)
          annotation (Line(points={{10,30},{30,30},{30,52}},  color={0,0,127}));
        connect(const.y, feedback.u1)
          annotation (Line(points={{11,60},{22,60}},color={0,0,127}));
        connect(feedback.y, integralController.u)
          annotation (Line(points={{39,60},{48,60}}, color={0,0,127}));
        connect(star.pin_n, ground.pin)
          annotation (Line(points={{-80,-10},{-80,-20}}, color={85,170,255}));
        connect(voltageSource.plug_n, star.plug_p)
          annotation (Line(points={{-80,20},{-80,10}}, color={85,170,255}));
        connect(integralController.y, gain.u)
          annotation (Line(points={{71,60},{80,60},{80,42}}, color={0,0,127}));
        connect(gain.y, torque.tau)
          annotation (Line(points={{80,19},{80,0},{72,0}}, color={0,0,127}));
        connect(voltageSource.plug_p, powerSensor.currentP)
          annotation (Line(points={{-80,40},{-60,40}}, color={85,170,255}));
        connect(powerSensor.currentN, currentQuasiRMSSensor.plug_p)
          annotation (Line(points={{-40,40},{0,40}},   color={85,170,255}));
        connect(powerSensor.currentP, powerSensor.voltageP)
          annotation (Line(points={{-60,40},{-60,50},{-50,50}}, color={85,170,255}));
        connect(voltageSource.plug_n, powerSensor.voltageN)
          annotation (Line(points={{-80,20},{-50,20},{-50,30}}, color={85,170,255}));
        connect(excitationCurrent.n, smee.pin_ep)
          annotation (Line(points={{-30,0},{-30,6},{-10,6}}, color={0,0,255}));
        connect(excitationCurrent.p, smee.pin_en) annotation (Line(points={{-30,
                -20},{-10,-20},{-10,-6}}, color={0,0,255}));
        connect(groundE.p, excitationCurrent.p) annotation (Line(points={{-30,
                -30},{-30,-20},{-30,-20}}, color={0,0,255}));
        annotation (experiment(Interval=0.001, Tolerance=1e-06));
      end SMEE_NominalOperation;

      model SMR_NominalOperation
        extends Modelica.Icons.Example;
        import Modelica.Constants.pi;
        import Modelica.Utilities.Streams.print;
        import Modelica.SIunits.Conversions.to_deg;
        parameter Modelica.SIunits.Torque tau0=46.0435 "Estimated initial torque";
        parameter Modelica.SIunits.Angle gammar0=112.8615*pi/180
          "Estimated initial rotor angle";
        Real pf=powerSensor.y.re/powerSensor.abs_y "Power factor";
        .ElectricalMachines.QuasiStatic.FundamentalWave.SM_ReluctanceRotor smr(gammar(
              fixed=true, start=gammar0), wMechanical(fixed=true, start=smr.data.wNominal))
          annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
        Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
          terminalBox(m=smr.m, terminalConnection="Y")
          annotation (Placement(transformation(extent={{-10,6},{10,26}})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentQuasiRMSSensor
          currentQuasiRMSSensor(m=smr.m) annotation (Placement(transformation(
              extent={{10,-10},{-10,10}},
              rotation=90,
              origin={0,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource
          voltageSource(
          m=smr.m,
          gamma(fixed=true, start=0),
          f=smr.data.fsNominal,
          V=fill(smr.data.VsNominal, smr.m)) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star(m=smr.m)
          annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={-80,0})));
        Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground
          annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
        Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
          annotation (Placement(transformation(extent={{20,-10},{40,10}})));
        Modelica.Mechanics.Rotational.Sources.Torque torque
          annotation (Placement(transformation(extent={{70,-10},{50,10}})));
        Modelica.Blocks.Math.Feedback feedback
          annotation (Placement(transformation(extent={{20,50},{40,70}})));
        Modelica.Blocks.Sources.Constant const(k=smr.data.IsNominal)
          annotation (Placement(transformation(extent={{-10,50},{10,70}})));
        Modelica.Blocks.Continuous.Integrator integralController(
          k=1000,
          initType=Modelica.Blocks.Types.Init.InitialOutput,
          y_start=tau0)
          annotation (Placement(transformation(extent={{50,50},{70,70}})));
        Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
              extent={{-10,-10},{10,10}},
              rotation=270,
              origin={80,30})));
        Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor
          powerSensor
          annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
      equation
        when terminal() then
          print("gammar=" + String(to_deg(smr.gammar), significantDigits=16) + "deg");
          print("tau   ="+String(multiSensor.tau, significantDigits=9)+"Nm");
          print("pf    ="+String(pf, significantDigits=9));
        end when;
        connect(terminalBox.plug_sn, smr.plug_sn)
          annotation (Line(points={{-6,10},{-6,10}},   color={85,170,255}));
        connect(terminalBox.plug_sp, smr.plug_sp)
          annotation (Line(points={{6,10},{6,10}},     color={85,170,255}));
        connect(currentQuasiRMSSensor.plug_n, terminalBox.plugSupply)
          annotation (Line(points={{0,20},{0,12}},     color={85,170,255}));
        connect(ground.pin, terminalBox.starpoint) annotation (Line(points={{-80,-20},
                {-70,-20},{-70,12},{-9,12}},  color={85,170,255}));
        connect(torque.flange, multiSensor.flange_b)
          annotation (Line(points={{50,0},{40,0}}, color={0,0,0}));
        connect(smr.flange, multiSensor.flange_a)
          annotation (Line(points={{10,0},{20,0}}, color={0,0,0}));
        connect(currentQuasiRMSSensor.I, feedback.u2)
          annotation (Line(points={{10,30},{30,30},{30,52}},  color={0,0,127}));
        connect(const.y, feedback.u1)
          annotation (Line(points={{11,60},{22,60}},color={0,0,127}));
        connect(feedback.y, integralController.u)
          annotation (Line(points={{39,60},{48,60}}, color={0,0,127}));
        connect(star.pin_n, ground.pin)
          annotation (Line(points={{-80,-10},{-80,-20}}, color={85,170,255}));
        connect(voltageSource.plug_n, star.plug_p)
          annotation (Line(points={{-80,20},{-80,10}}, color={85,170,255}));
        connect(integralController.y, gain.u)
          annotation (Line(points={{71,60},{80,60},{80,42}}, color={0,0,127}));
        connect(gain.y, torque.tau)
          annotation (Line(points={{80,19},{80,0},{72,0}}, color={0,0,127}));
        connect(voltageSource.plug_p, powerSensor.currentP)
          annotation (Line(points={{-80,40},{-60,40}}, color={85,170,255}));
        connect(powerSensor.currentN, currentQuasiRMSSensor.plug_p)
          annotation (Line(points={{-40,40},{0,40}},   color={85,170,255}));
        connect(powerSensor.currentP, powerSensor.voltageP)
          annotation (Line(points={{-60,40},{-60,50},{-50,50}}, color={85,170,255}));
        connect(voltageSource.plug_n, powerSensor.voltageN)
          annotation (Line(points={{-80,20},{-50,20},{-50,30}}, color={85,170,255}));
        annotation (experiment(Interval=0.001, Tolerance=1e-06));
      end SMR_NominalOperation;
    end QuasiStatic;

  end Examples;

  package Transient "Transient Machine Models"
    extends Modelica.Icons.Package;
    package DCMachines "Transient DC machines"
      extends Modelica.Icons.Package;

      model DC_PermanentMagnet
        parameter ElectricalMachines.ParameterRecords.DcPermanentMagnetData data annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet(
          TaOperational=data.TaRef,
          final Jr=data.Jr,
          final Js=data.Js,
          final VaNominal=data.VaNominal,
          final IaNominal=data.IaNominal,
          final wNominal=data.wNominal,
          final TaNominal=data.TaNominal,
          final Ra=data.Ra,
          final TaRef=data.TaRef,
          final alpha20a=data.alpha20a,
          final La=data.La,
          final frictionParameters=data.frictionParameters,
          final coreParameters=data.coreParameters,
          final strayLoadParameters=data.strayLoadParameters,
          final brushParameters=data.brushParameters);
        annotation(defaultComponentName="dcpm");
      end DC_PermanentMagnet;

      model DC_ElectricalExcited
        parameter ElectricalMachines.ParameterRecords.DcElectricalExcitedData data annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_ElectricalExcited(
          TaOperational=data.TaRef,
          TeOperational=data.TeRef,
          final Jr=data.Jr,
          final Js=data.Js,
          final VaNominal=data.VaNominal,
          final IaNominal=data.IaNominal,
          final wNominal=data.wNominal,
          final TaNominal=data.TaNominal,
          final Ra=data.Ra,
          final TaRef=data.TaRef,
          final alpha20a=data.alpha20a,
          final La=data.La,
          final frictionParameters=data.frictionParameters,
          final coreParameters=data.coreParameters,
          final strayLoadParameters=data.strayLoadParameters,
          final brushParameters=data.brushParameters,
          final IeNominal=data.IeNominal,
          final Re=data.Re,
          final TeRef=data.TeRef,
          final alpha20e=data.alpha20e,
          final Le=data.Le,
          final sigmae=data.sigmae);
        annotation(defaultComponentName="dcee");
      end DC_ElectricalExcited;

      model DC_SeriesExcited
        parameter ElectricalMachines.ParameterRecords.DcSeriesExcitedData data annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_SeriesExcited(
          TaOperational=data.TaRef,
          TeOperational=data.TeRef,
          final Jr=data.Jr,
          final Js=data.Js,
          final VaNominal=data.VaNominal,
          final IaNominal=data.IaNominal,
          final wNominal=data.wNominal,
          final TaNominal=data.TaNominal,
          final TeNominal=data.TeNominal,
          final Ra=data.Ra,
          final TaRef=data.TaRef,
          final alpha20a=data.alpha20a,
          final La=data.La,
          final frictionParameters=data.frictionParameters,
          final coreParameters=data.coreParameters,
          final strayLoadParameters=data.strayLoadParameters,
          final brushParameters=data.brushParameters,
          final Re=data.Re,
          final TeRef=data.TeRef,
          final alpha20e=data.alpha20e,
          final Le=data.Le,
          final sigmae=data.sigmae);
        annotation(defaultComponentName="dcse");
      end DC_SeriesExcited;
      annotation (Icon(graphics={Text(
              extent={{-80,80},{80,-80}},
              lineColor={28,108,200},
              textString="DC")}));
    end DCMachines;

    package SpacePhasor "Transient AC machines based on Space Phasors"
      extends Modelica.Icons.Package;
      model IM_SquirrelCage
        parameter ElectricalMachines.ParameterRecords.IM_SquirrelCageData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lszero=data.Lszero,
          final Lssigma=data.Lssigma,
          final Lm=data.Lm,
          final Lrsigma=data.Lrsigma,
          final Rr=data.Rr,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters);
        annotation(defaultComponentName="imc");
      end IM_SquirrelCage;

      model IM_SlipRing
        parameter ElectricalMachines.ParameterRecords.IM_SlipRingData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final useTurnsRatio=data.useTurnsRatio,
          final turnsRatio=data.turnsRatio,
          final VsNominal=data.VsNominal,
          final VrLockedRotor=data.VrLockedRotor,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lszero=data.Lszero,
          final Lssigma=data.Lssigma,
          final Lm=data.Lm,
          final Lrsigma=data.Lrsigma,
          final Lrzero=data.Lrzero,
          final Rr=data.Rr,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters,
          final rotorCoreParameters=data.rotorCoreParameters);
        annotation(defaultComponentName="ims");
      end IM_SlipRing;

      model SM_PermanentMagnet
        parameter ElectricalMachines.ParameterRecords.SM_PermanentMagnetData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final VsOpenCircuit=data.VsOpenCircuit,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lszero=data.Lszero,
          final Lssigma=data.Lssigma,
          final Lmd=data.Lmd,
          final Lmq=data.Lmq,
          useDamperCage=data.useDamperCage,
          final Lrsigmad=data.Lrsigmad,
          final Lrsigmaq=data.Lrsigmaq,
          final Rrd=data.Rrd,
          final Rrq=data.Rrq,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters,
          final permanentMagnetLossParameters=data.permanentMagnetLossParameters);
        annotation(defaultComponentName="smpm");
      end SM_PermanentMagnet;

      model SM_ElectricalExcited
        parameter ElectricalMachines.ParameterRecords.SM_ElectricalExcitedData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          TeOperational=data.TeRef,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lszero=data.Lszero,
          final Lssigma=data.Lssigma,
          final Lmd=data.Lmd,
          final Lmq=data.Lmq,
          useDamperCage=data.useDamperCage,
          final Lrsigmad=data.Lrsigmad,
          final Lrsigmaq=data.Lrsigmaq,
          final Rrd=data.Rrd,
          final Rrq=data.Rrq,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final VsNominal=data.VsNominal,
          final IeOpenCircuit=data.IeOpenCircuit,
          final Re=data.Re,
          final TeRef=data.TeRef,
          final alpha20e=data.alpha20e,
          final sigmae=data.sigmae,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters,
          final brushParameters=data.brushParameters);
        annotation(defaultComponentName="smee");
      end SM_ElectricalExcited;

      model SM_ReluctanceRotor
        parameter ElectricalMachines.ParameterRecords.SM_ReluctanceRotorData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lszero=data.Lszero,
          final Lssigma=data.Lssigma,
          final Lmd=data.Lmd,
          final Lmq=data.Lmq,
          useDamperCage=data.useDamperCage,
          final Lrsigmad=data.Lrsigmad,
          final Lrsigmaq=data.Lrsigmaq,
          final Rrd=data.Rrd,
          final Rrq=data.Rrq,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters);
        annotation(defaultComponentName="smr");
      end SM_ReluctanceRotor;
      annotation (Icon(graphics={Text(
              extent={{-80,80},{80,-80}},
              lineColor={28,108,200},
              textString="AC")}));
    end SpacePhasor;

    package FundamentalWave "Transient AC machines based on the Fundamental Wave of rotating magnetic field"
      extends Modelica.Icons.Package;
      model IM_SquirrelCage
        parameter ElectricalMachines.ParameterRecords.IM_SquirrelCageData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          final m=data.m,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lszero=data.Lszero,
          final Lssigma=data.Lssigma,
          final Lm=data.Lm,
          final Lrsigma=data.Lrsigma,
          final Rr=data.Rr,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters);
        annotation(defaultComponentName="imc");
      end IM_SquirrelCage;

      model IM_SlipRing
        parameter ElectricalMachines.ParameterRecords.IM_SlipRingData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          final m=data.m,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final useTurnsRatio=data.useTurnsRatio,
          final TurnsRatio=data.turnsRatio,
          final VsNominal=data.VsNominal,
          final VrLockedRotor=data.VrLockedRotor,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lszero=data.Lszero,
          final Lssigma=data.Lssigma,
          final Lm=data.Lm,
          final Lrsigma=data.Lrsigma,
          final Lrzero=data.Lrzero,
          final Rr=data.Rr,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters,
          final rotorCoreParameters=data.rotorCoreParameters);
        annotation(defaultComponentName="ims");
      end IM_SlipRing;

      model SM_PermanentMagnet
        parameter ElectricalMachines.ParameterRecords.SM_PermanentMagnetData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          final m=data.m,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final VsOpenCircuit=data.VsOpenCircuit,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lszero=data.Lszero,
          final Lssigma=data.Lssigma,
          final Lmd=data.Lmd,
          final Lmq=data.Lmq,
          useDamperCage=data.useDamperCage,
          final Lrsigmad=data.Lrsigmad,
          final Lrsigmaq=data.Lrsigmaq,
          final Rrd=data.Rrd,
          final Rrq=data.Rrq,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters,
          final permanentMagnetLossParameters=data.permanentMagnetLossParameters);
        annotation(defaultComponentName="smpm");
      end SM_PermanentMagnet;

      model SM_ElectricalExcited
        parameter ElectricalMachines.ParameterRecords.SM_ElectricalExcitedData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          TeOperational=data.TeRef,
          final m=data.m,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lszero=data.Lszero,
          final Lssigma=data.Lssigma,
          final Lmd=data.Lmd,
          final Lmq=data.Lmq,
          useDamperCage=data.useDamperCage,
          final Lrsigmad=data.Lrsigmad,
          final Lrsigmaq=data.Lrsigmaq,
          final Rrd=data.Rrd,
          final Rrq=data.Rrq,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final VsNominal=data.VsNominal,
          final IeOpenCircuit=data.IeOpenCircuit,
          final Re=data.Re,
          final TeRef=data.TeRef,
          final alpha20e=data.alpha20e,
          final sigmae=data.sigmae,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters,
          final brushParameters=data.brushParameters);
        annotation(defaultComponentName="smee");
      end SM_ElectricalExcited;

      model SM_ReluctanceRotor
        parameter ElectricalMachines.ParameterRecords.SM_ReluctanceRotorData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          final m=data.m,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lszero=data.Lszero,
          final Lssigma=data.Lssigma,
          final Lmd=data.Lmd,
          final Lmq=data.Lmq,
          useDamperCage=data.useDamperCage,
          final Lrsigmad=data.Lrsigmad,
          final Lrsigmaq=data.Lrsigmaq,
          final Rrd=data.Rrd,
          final Rrq=data.Rrq,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters);
        annotation(defaultComponentName="smr");
      end SM_ReluctanceRotor;
      annotation (Icon(graphics={
            Rectangle(
              extent={{-60,70},{-80,-50}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={128,128,128}),
            Rectangle(
              extent={{-60,70},{60,-50}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,128,0}),
            Rectangle(
              extent={{-60,80},{20,60}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{60,20},{80,0}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={95,95,95}),
            Polygon(
              points={{-70,-80},{-60,-80},{-30,-10},{20,-10},{50,-80},{60,-80},
                  {60,-90},{-70,-90},{-70,-80}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}));
    end FundamentalWave;
    annotation (Icon(graphics={
          Rectangle(
            origin={0.835,10},
            fillColor={0,128,255},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-60,-60},{60,60}}),
          Rectangle(
            origin={0.835,10},
            fillColor={128,128,128},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{-80,-60},{-60,60}}),
          Rectangle(
            origin={0.835,10},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid,
            extent={{-60,50},{20,70}}),
          Rectangle(
            origin={0.835,10},
            fillColor={95,95,95},
            fillPattern=FillPattern.HorizontalCylinder,
            extent={{60,-10},{80,10}}),
          Polygon(
            origin={0.835,10},
            fillPattern=FillPattern.Solid,
            points={{-70,-90},{-60,-90},{-30,-20},{20,-20},{50,-90},{60,-90},{60,
                -100},{-70,-100},{-70,-90}})}));
  end Transient;

  package QuasiStatic "Quasistatic Machine Models"
    extends Modelica.Icons.Package;
    package DCMachines "Quasistatic DC machines"
      extends Modelica.Icons.Package;

      model DC_PermanentMagnet
        extends ElectricalMachines.Transient.DCMachines.DC_PermanentMagnet(final quasiStationary=true);
        extends Modelica.Electrical.Machines.Icons.QuasiStationaryMachine;
         annotation(defaultComponentName="dcpm");
      end DC_PermanentMagnet;

      model DC_ElectricalExcited
        extends ElectricalMachines.Transient.DCMachines.DC_ElectricalExcited(final quasiStationary=true);
        extends Modelica.Electrical.Machines.Icons.QuasiStationaryMachine;
        annotation(defaultComponentName="dcee");
      end DC_ElectricalExcited;

      model DC_SeriesExcited
        extends ElectricalMachines.Transient.DCMachines.DC_SeriesExcited(final quasiStationary=true);
        extends Modelica.Electrical.Machines.Icons.QuasiStationaryMachine;
        annotation(defaultComponentName="dcse");
      end DC_SeriesExcited;
      annotation (Icon(graphics={Text(
              extent={{-80,80},{80,-80}},
              lineColor={28,108,200},
              textString="DC")}));
    end DCMachines;

    package FundamentalWave "Quasistatic AC machines based on the Fundamental Wave of rotating magnetic field"
      extends Modelica.Icons.Package;
      model IM_SquirrelCage
        parameter ElectricalMachines.ParameterRecords.IM_SquirrelCageData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.InductionMachines.IM_SquirrelCage(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          final m=data.m,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lssigma=data.Lssigma,
          final Lm=data.Lm,
          final Lrsigma=data.Lrsigma,
          final Rr=data.Rr,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters);
        annotation(defaultComponentName="imc");
      end IM_SquirrelCage;

      model IM_SlipRing
        parameter ElectricalMachines.ParameterRecords.IM_SlipRingData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.InductionMachines.IM_SlipRing(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          final m=data.m,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final useTurnsRatio=data.useTurnsRatio,
          final TurnsRatio=data.turnsRatio,
          final VsNominal=data.VsNominal,
          final VrLockedRotor=data.VrLockedRotor,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lssigma=data.Lssigma,
          final Lm=data.Lm,
          final Lrsigma=data.Lrsigma,
          final Rr=data.Rr,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters,
          final rotorCoreParameters=data.rotorCoreParameters);
        annotation(defaultComponentName="ims");
      end IM_SlipRing;

      model SM_PermanentMagnet
        parameter ElectricalMachines.ParameterRecords.SM_PermanentMagnetData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_PermanentMagnet(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          final m=data.m,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final VsOpenCircuit=data.VsOpenCircuit,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lssigma=data.Lssigma,
          final Lmd=data.Lmd,
          final Lmq=data.Lmq,
          useDamperCage=data.useDamperCage,
          final Lrsigmad=data.Lrsigmad,
          final Lrsigmaq=data.Lrsigmaq,
          final Rrd=data.Rrd,
          final Rrq=data.Rrq,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters,
          final permanentMagnetLossParameters=data.permanentMagnetLossParameters);
        annotation(defaultComponentName="smpm");
      end SM_PermanentMagnet;

      model SM_ElectricalExcited
        parameter ElectricalMachines.ParameterRecords.SM_ElectricalExcitedData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_ElectricalExcited(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          TeOperational=data.TeRef,
          final m=data.m,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lssigma=data.Lssigma,
          final Lmd=data.Lmd,
          final Lmq=data.Lmq,
          useDamperCage=data.useDamperCage,
          final Lrsigmad=data.Lrsigmad,
          final Lrsigmaq=data.Lrsigmaq,
          final Rrd=data.Rrd,
          final Rrq=data.Rrq,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final VsNominal=data.VsNominal,
          final IeOpenCircuit=data.IeOpenCircuit,
          final Re=data.Re,
          final TeRef=data.TeRef,
          final alpha20e=data.alpha20e,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters,
          final brushParameters=data.brushParameters);
        annotation(defaultComponentName="smee");
      end SM_ElectricalExcited;

      model SM_ReluctanceRotor
        parameter ElectricalMachines.ParameterRecords.SM_ReluctanceRotorData data
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_ReluctanceRotor(
          TsOperational=data.TsRef,
          TrOperational=data.TrRef,
          final m=data.m,
          final p=data.p,
          final fsNominal=data.fsNominal,
          final Jr=data.Jr,
          final Js=data.Js,
          final Rs=data.Rs,
          final TsRef=data.TsRef,
          final alpha20s=data.alpha20s,
          final Lssigma=data.Lssigma,
          final Lmd=data.Lmd,
          final Lmq=data.Lmq,
          useDamperCage=data.useDamperCage,
          final Lrsigmad=data.Lrsigmad,
          final Lrsigmaq=data.Lrsigmaq,
          final Rrd=data.Rrd,
          final Rrq=data.Rrq,
          final TrRef=data.TrRef,
          final alpha20r=data.alpha20s,
          final frictionParameters=data.frictionParameters,
          final statorCoreParameters=data.statorCoreParameters,
          final strayLoadParameters=data.strayLoadParameters);
        annotation(defaultComponentName="smr");
      end SM_ReluctanceRotor;
      annotation (Icon(graphics={
            Rectangle(
              extent={{-58,70},{-78,-50}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={128,128,128}),
            Rectangle(
              extent={{-58,70},{62,-50}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={255,206,120}),
            Rectangle(
              extent={{62,20},{82,0}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={95,95,95}),
            Rectangle(
              extent={{-58,80},{22,60}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Polygon(
              points={{-68,-80},{-58,-80},{-28,-10},{22,-10},{52,-80},{62,-80},
                  {62,-90},{-68,-90},{-68,-80}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid)}));
    end FundamentalWave;
    annotation (Icon(graphics={          Rectangle(
                extent={{-60,70},{-80,-50}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={128,128,128}),Rectangle(
                extent={{60,20},{80,0}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={95,95,95}),
                               Rectangle(
                extent={{-60,70},{60,-50}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={170,213,255}),
                                      Rectangle(
                extent={{-60,80},{20,60}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),Polygon(
                points={{-70,-80},{-60,-80},{-30,-10},{20,-10},{50,-80},{60,-80},
                {60,-90},{-70,-90},{-70,-80}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}));
  end QuasiStatic;

  package ParameterRecords "Parameter records"
    extends Modelica.Icons.MaterialPropertiesPackage;
    record InductionMachineData "Common parameters for induction machines"
      extends Modelica.Icons.Record;
      import Modelica.Constants.pi;
      parameter Integer m=3 "Number of phases (m=3 for SpacePhasor machines)";
      parameter String machine="machine";
      parameter Modelica.SIunits.Inertia Jr=0.29 "Rotor's moment of inertia";
      parameter Modelica.SIunits.Inertia Js=Jr "Stator's moment of inertia";
      parameter Integer p(min=1) = 2 "Number of pole pairs (Integer)";
      parameter Modelica.SIunits.Frequency fsNominal=50 "Nominal frequency"
        annotation (Dialog(tab="Nominal parameters"));
      parameter Modelica.SIunits.Voltage VsNominal=100
        "Nominal stator voltage per phase"
        annotation (Dialog(tab="Nominal parameters"));
      parameter Modelica.SIunits.Current IsNominal=100
        "Nominal stator current per phase"
        annotation (Dialog(tab="Nominal parameters"));
      parameter Modelica.SIunits.AngularVelocity wNominal(displayUnit="rev/min")=2*pi*fsNominal/p
        "Nominal speed"
        annotation (Dialog(tab="Nominal parameters"));
      parameter Modelica.SIunits.Resistance Rs=0.03
        "Stator resistance per phase at TRef"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Temperature TsRef=293.15
        "Reference temperature of stator resistance"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20
        alpha20s=0 "Temperature coefficient of stator resistance at 20 degC"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Inductance Lszero=Lssigma
        "Stator zero sequence inductance"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Inductance Lssigma=3*(1 - sqrt(1 - 0.0667))/(2*pi*fsNominal)
        "Stator stray inductance per phase"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.Electrical.Machines.Losses.FrictionParameters frictionParameters(
        PRef=0, wRef=wNominal) "Friction loss parameter record"
        annotation (Dialog(tab="Losses"));
      parameter Modelica.Electrical.Machines.Losses.CoreParameters statorCoreParameters(
        final m=m,
        PRef=0,
        VRef=VsNominal,
        wRef=2*pi*fsNominal)
        "Stator core loss parameter record; all parameters refer to stator side"
        annotation (Dialog(tab="Losses"));
      parameter Modelica.Electrical.Machines.Losses.StrayLoadParameters strayLoadParameters(
        PRef=0,
        IRef=IsNominal,
        wRef=wNominal) "Stray load losses" annotation (Dialog(tab="Losses"));
      annotation (
        defaultComponentName="inductionMachineData",
        defaultComponentPrefixes="parameter",
        Documentation(info="<html>
<p>Basic parameters of induction machines are predefined with default values.</p>
</html>"),
        Icon(graphics={Text(
              extent={{-100,0},{100,-50}},
              lineColor={28,108,200},
              textString="%machine")}));
    end InductionMachineData;

    record IM_SquirrelCageData "Parameters for induction machines with squirrel cage"
      extends InductionMachineData(machine="imc",
        wNominal=1440.4552325875*2*pi/60);
      import Modelica.Constants.pi;
      parameter Real s=1 - wNominal/(2*pi*fsNominal/p) "Nominal slip"
        annotation (Dialog(tab="Nominal parameters", enable=false));
      parameter Modelica.SIunits.Inductance Lm=3*sqrt(1 - 0.0667)/(2*pi*fsNominal)
        "Stator main field inductance per phase"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Inductance Lrsigma=3*(1 - sqrt(1 - 0.0667))/(2*pi*fsNominal)
        "Rotor stray inductance per phase (equivalent three phase winding)"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Resistance Rr=0.04
        "Rotor resistance per phase (equivalent three phase winding) at TRef"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Temperature TrRef=293.15
        "Reference temperature of rotor resistance"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter
        Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20 alpha20r=0
        "Temperature coefficient of rotor resistance at 20 degC"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      annotation (
        defaultComponentName="imcData",
        defaultComponentPrefixes="parameter",
        Documentation(info="<html>
<p>Basic parameters of asynchronous induction machines with squirrel cage are predefined with default values.</p>
</html>"));
    end IM_SquirrelCageData;

    record IM_SlipRingData "Parameters for induction machines with slip ring rotor"
      extends InductionMachineData(machine="ims",
        wNominal=1440.4552325875*2*pi/60);
      import Modelica.Constants.pi;
      parameter Real s=1 - wNominal/(2*pi*fsNominal/p) "Nominal slip"
        annotation (Dialog(tab="Nominal parameters", enable=false));
      parameter Modelica.SIunits.Inductance Lm=3*sqrt(1 - 0.0667)/(2*pi*fsNominal)
        "Stator main field inductance per phase"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Inductance Lrsigma=3*(1 - sqrt(1 - 0.0667))/(2*pi*fsNominal)/turnsRatio^2
        "Rotor stray inductance per phase w.r.t. rotor side"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Inductance Lrzero=Lrsigma/turnsRatio^2
        "Rotor zero sequence inductance w.r.t. rotor side"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Resistance Rr=0.04/turnsRatio^2
        "Rotor resistance per phase at TRef w.r.t. rotor side"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Temperature TrRef=293.15
        "Reference temperature of rotor resistance"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20
        alpha20r=0 "Temperature coefficient of rotor resistance at 20 degC"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Boolean useTurnsRatio=true
        "Use turnsRatio or calculate from locked-rotor voltage?";
      parameter Real turnsRatio(final min=Modelica.Constants.small)=VsNominal/VrLockedRotor*
        (2*pi*fsNominal*Lm)/sqrt(Rs^2 + (2*pi*fsNominal*(Lm + Lssigma))^2)
        "Effective number of stator turns / effective number of rotor turns"
        annotation (Dialog(enable=useTurnsRatio));
      parameter Modelica.SIunits.Voltage VrLockedRotor=VsNominal*
        (2*pi*fsNominal*Lm)/sqrt(Rs^2 + (2*pi*fsNominal*(Lm + Lssigma))^2)
        "Locked-rotor voltage per phase"
        annotation (Dialog(enable=not useTurnsRatio));
      parameter Modelica.Electrical.Machines.Losses.CoreParameters rotorCoreParameters(
        final m=3,
        PRef=0,
        VRef=VrLockedRotor*s,
        wRef=2*pi*fsNominal*s)
        "Rotor core loss parameter record; all parameters refer to rotor side"
        annotation (Dialog(tab="Losses"));
      annotation (
        defaultComponentName="imsData",
        defaultComponentPrefixes="parameter",
        Documentation(info="<html>
<p>Basic parameters of asynchronous induction machines with slip ring are predefined with default values.</p>
</html>"));
    end IM_SlipRingData;

    record SM_PermanentMagnetData "Parameters for synchronous machines with permanent magnets"
      extends SM_ReluctanceRotorData(machine="smpm",
        IsNominal=100,
        Lmd=0.3/(2*pi*fsNominal), Lmq=0.3/(2*pi*fsNominal));
      import Modelica.Constants.pi;
      parameter Modelica.SIunits.Voltage VsOpenCircuit=112.3
        "Open circuit RMS voltage per phase @ fsNominal";
      parameter
        Modelica.Electrical.Machines.Losses.PermanentMagnetLossParameters permanentMagnetLossParameters(
        PRef=0,
        IRef=IsNominal,
        wRef=wNominal) "Permanent magnet loss parameter record"
        annotation (Dialog(tab="Losses"));
      annotation (
        defaultComponentName="smpmData",
        defaultComponentPrefixes="parameter",
        Documentation(info="<html>
<p>Basic parameters of synchronous induction machines with permanent magnet are predefined with default values.</p>
</html>"));
    end SM_PermanentMagnetData;

    record SM_ElectricalExcitedData "Parameters for synchronous machines with electrical excitation"
      extends SM_ReluctanceRotorData(machine="smee",
        IsNominal=100,
        Lmd=1.5/(2*pi*fsNominal), Lmq=1.5/(2*pi*fsNominal));
      import Modelica.Constants.pi;
      parameter Modelica.SIunits.Current IeOpenCircuit=10
        "Open circuit excitation current @ nominal voltage and frequency"
        annotation (Dialog(tab="Excitation"));
      parameter Modelica.SIunits.Resistance Re=2.5
        "Excitation resistance at TRef" annotation (Dialog(tab="Excitation"));
      parameter Modelica.SIunits.Temperature TeRef=293.15
        "Reference temperature of excitation resistance"
        annotation (Dialog(tab="Excitation"));
      parameter Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20
        alpha20e=0 "Temperature coefficient of excitation resistance"
        annotation (Dialog(tab="Excitation"));
      parameter Real sigmae(
        min=0,
        max=0.99) = 0.025 "Stray fraction of total excitation inductance"
        annotation (Dialog(tab="Excitation"));
      parameter Real turnsRatio=sqrt(2)*VsNominal/(2*pi*fsNominal*Lmd*IeOpenCircuit)
        "Stator current / excitation current"
        annotation (Dialog(tab="Excitation", enable=false));
      parameter Modelica.SIunits.Inductance Le=Lmd*turnsRatio^2*3/2/(1 - sigmae)
        "Excitation inductance"
        annotation (Dialog(tab="Excitation", enable=false));
      parameter Modelica.Electrical.Machines.Losses.BrushParameters brushParameters(V=0,
          ILinear=0.01) "Brush loss parameter record"
        annotation (Dialog(tab="Losses"));
      annotation (
        defaultComponentName="smeeData",
        defaultComponentPrefixes="parameter",
        Documentation(info="<html>
<p>Basic parameters of synchronous induction machines with electrical excitation are predefined with default values.</p>
</html>"));
    end SM_ElectricalExcitedData;

    record SM_ReluctanceRotorData "Parameters for synchronous machines with reluctance rotor"
      extends InductionMachineData(machine="smr",
        final wNominal=2*pi*fsNominal/p,
        IsNominal=50,
        Lssigma=0.1/(2*pi*fsNominal));
      import Modelica.Constants.pi;
      parameter Modelica.SIunits.Inductance Lmd=2.9/(2*pi*fsNominal)
        "Stator main field inductance per phase in d-axis"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Inductance Lmq=0.9/(2*pi*fsNominal)
        "Stator main field inductance per phase in q-axis"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Boolean useDamperCage=true "Enable / disable damper cage"
        annotation (Evaluate=true,Dialog(tab=
              "Nominal resistances and inductances", group="DamperCage"));
      parameter Modelica.SIunits.Inductance Lrsigmad=0.05/(2*pi*fsNominal)
        "Damper stray inductance in d-axis" annotation (Dialog(
          tab="Nominal resistances and inductances",
          group="DamperCage",
          enable=useDamperCage));
      parameter Modelica.SIunits.Inductance Lrsigmaq=Lrsigmad
        "Damper stray inductance in q-axis" annotation (Dialog(
          tab="Nominal resistances and inductances",
          group="DamperCage",
          enable=useDamperCage));
      parameter Modelica.SIunits.Resistance Rrd=0.04
        "Damper resistance in d-axis at TRef" annotation (Dialog(
          tab="Nominal resistances and inductances",
          group="DamperCage",
          enable=useDamperCage));
      parameter Modelica.SIunits.Resistance Rrq=Rrd
        "Damper resistance in q-axis at TRef" annotation (Dialog(
          tab="Nominal resistances and inductances",
          group="DamperCage",
          enable=useDamperCage));
      parameter Modelica.SIunits.Temperature TrRef=293.15
        "Reference temperature of damper resistances in d- and q-axis"
        annotation (Dialog(
          tab="Nominal resistances and inductances",
          group="DamperCage",
          enable=useDamperCage));
      parameter
        Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20 alpha20r=0
        "Temperature coefficient of damper resistances in d- and q-axis"
        annotation (Dialog(
          tab="Nominal resistances and inductances",
          group="DamperCage",
          enable=useDamperCage));
      annotation (
        defaultComponentName="smrData",
        defaultComponentPrefixes="parameter",
        Documentation(info="<html>
<p>Basic parameters of synchronous induction machines with reluctance rotor are predefined with default values.</p>
</html>"));
    end SM_ReluctanceRotorData;

    record DcPermanentMagnetData "Parameters for DC machines with permanent magnet excitation"
      extends Modelica.Icons.Record;
      import Modelica.Constants.pi;
      parameter String machine="dcpm";
      parameter Modelica.SIunits.Inertia Jr=0.15 "Rotor's moment of inertia";
      parameter Modelica.SIunits.Inertia Js=Jr "Stator's moment of inertia";
      parameter Modelica.SIunits.Voltage VaNominal=100
        "Nominal armature voltage"
        annotation (Dialog(tab="Nominal parameters"));
      parameter Modelica.SIunits.Current IaNominal=100
        "Nominal armature current (>0..Motor, <0..Generator)"
        annotation (Dialog(tab="Nominal parameters"));
      parameter Modelica.SIunits.AngularVelocity wNominal(displayUnit="rev/min")=
           1425*2*pi/60 "Nominal speed"
        annotation (Dialog(tab="Nominal parameters"));
      parameter Modelica.SIunits.Temperature TaNominal=TaRef
        "Nominal armature temperature"
        annotation (Dialog(tab="Nominal parameters"));
      parameter Modelica.SIunits.Resistance Ra=0.05
        "Armature resistance at TRef"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Temperature TaRef=293.15
        "Reference temperature of armature resistance"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter
        Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20 alpha20a=0
        "Temperature coefficient of armature resistance"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Inductance La=0.0015 "Armature inductance"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.Electrical.Machines.Losses.FrictionParameters frictionParameters(PRef=0,
          wRef=wNominal) "Friction loss parameter record"
        annotation (Dialog(tab="Losses"));
      parameter Modelica.SIunits.Voltage ViNominal=VaNominal -
          Modelica.Electrical.Machines.Thermal.convertResistance(
                Ra,
                TaRef,
                alpha20a,
                TaNominal)*IaNominal -
          Modelica.Electrical.Machines.Losses.DCMachines.brushVoltageDrop(
          brushParameters,
          IaNominal);
      parameter Modelica.Electrical.Machines.Losses.CoreParameters coreParameters(
        final m=1,
        PRef=0,
        VRef=ViNominal,
        wRef=wNominal) "Armature core loss parameter record"
        annotation (Dialog(tab="Losses"));
      parameter Modelica.Electrical.Machines.Losses.StrayLoadParameters strayLoadParameters(
        PRef=0,
        IRef=IaNominal,
        wRef=wNominal) "Stray load losses" annotation (Dialog(tab="Losses"));
      parameter Modelica.Electrical.Machines.Losses.BrushParameters brushParameters(V=0,
          ILinear=0.01*IaNominal) "Brush loss parameter record"
        annotation (Dialog(tab="Losses"));
      annotation (
        defaultComponentName="dcpmData",
        defaultComponentPrefixes="parameter",
        Documentation(info="<html>
<p>Basic parameters of DC machines are predefined with default values.</p>
</html>"),
        Icon(graphics={Text(
              extent={{-100,0},{100,-50}},
              lineColor={28,108,200},
              textString="%machine")}));
    end DcPermanentMagnetData;

    record DcElectricalExcitedData "Parameters for DC machines with electrical excitation"
      extends DcPermanentMagnetData(machine="dcee");
      parameter Modelica.SIunits.Current IeNominal=1
        "Nominal excitation current" annotation (Dialog(tab="Excitation"));
      parameter Modelica.SIunits.Resistance Re=100
        "Field excitation resistance at TRef"
        annotation (Dialog(tab="Excitation"));
      parameter Modelica.SIunits.Temperature TeRef=293.15
        "Reference temperature of excitation resistance"
        annotation (Dialog(tab="Excitation"));
      parameter
        Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20 alpha20e=0
        "Temperature coefficient of excitation resistance"
        annotation (Dialog(tab="Excitation"));
      parameter Modelica.SIunits.Inductance Le=1
        "Total field excitation inductance"
        annotation (Dialog(tab="Excitation"));
      parameter Real sigmae(
        min=0,
        max=0.99) = 0 "Stray fraction of total excitation inductance"
        annotation (Dialog(tab="Excitation"));
      parameter Modelica.SIunits.Temperature TeNominal=TeRef
        "Nominal excitation temperature"
        annotation (Dialog(tab="Nominal parameters"));
      annotation (
        defaultComponentName="dceeData",
        defaultComponentPrefixes="parameter",
        Documentation(info="<html>
<p>Basic parameters of DC machines are predefined with default values.</p>
</html>"));
    end DcElectricalExcitedData;

    record DcSeriesExcitedData "Parameters for DC machines with series excitation"
      extends DcPermanentMagnetData(machine="dcse",
        wNominal=1410*2*pi/60,
        ViNominal=VaNominal -
          (Modelica.Electrical.Machines.Thermal.convertResistance(Ra, TaRef, alpha20a, TaNominal)
          +Modelica.Electrical.Machines.Thermal.convertResistance(Re, TeRef, alpha20e, TeNominal))*IaNominal -
          Modelica.Electrical.Machines.Losses.DCMachines.brushVoltageDrop(brushParameters,IaNominal));
      import Modelica.Constants.pi;
      parameter Modelica.SIunits.Resistance Re=0.01
        "Series excitation resistance at TRef"
        annotation (Dialog(tab="Excitation"));
      parameter Modelica.SIunits.Temperature TeRef=293.15
        "Reference temperature of excitation resistance"
        annotation (Dialog(tab="Excitation"));
      parameter
        Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20 alpha20e=0
        "Temperature coefficient of excitation resistance"
        annotation (Dialog(tab="Excitation"));
      parameter Modelica.SIunits.Inductance Le=0.0005
        "Total field excitation inductance"
        annotation (Dialog(tab="Excitation"));
      parameter Real sigmae(
        min=0,
        max=0.99) = 0 "Stray fraction of total excitation inductance"
        annotation (Dialog(tab="Excitation"));
      parameter Modelica.SIunits.Temperature TeNominal=TeRef
        "Nominal series excitation temperature"
        annotation (Dialog(tab="Nominal parameters"));
      annotation (
        defaultComponentName="dcseData",
        defaultComponentPrefixes="parameter",
        Documentation(info="<html>
<p>Basic parameters of DC machines are predefined with default values.</p>
</html>"));
    end DcSeriesExcitedData;

    record TransformerData "Common parameters for transformers"
      extends Modelica.Icons.Record;
      parameter Real n_phase=1
        "Ratio primary voltage per phase / secondary voltage per phase";
      parameter String C1="Y" "Choose primary connection" annotation (choices(
            choice="Y" "Star connection", choice="D" "Delta connection"));
      parameter String C2="y" "Choose secondary connection" annotation (
          choices(
          choice="y" "Star connection",
          choice="d" "Delta connection",
          choice="z" "Zig-zag connection"));
      parameter Real n=n_phase*(if C1 == "D" and (C2 == "y" or C2 == "z")
           then 1/sqrt(3) else if C1 == "Y" and C2 == "d" then sqrt(3) else 1)
        "Ratio primary voltage (line-to-line) / secondary voltage (line-to-line)"
        annotation (Dialog(enable=false));
      parameter Modelica.SIunits.Resistance R1=5E-3/3
        "Primary resistance per phase at TRef"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Temperature T1Ref=293.15
        "Reference temperature of primary resistance"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter
        Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20 alpha20_1=0
        "Temperature coefficient of primary resistance at 20 degC"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Inductance L1sigma=78E-6/3
        "Primary stray inductance per phase"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Resistance R2=5E-3/3
        "Secondary resistance per phase at TRef"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Temperature T2Ref=293.15
        "Reference temperature of secondary resistance"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter
        Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20 alpha20_2=0
        "Temperature coefficient of secondary resistance at 20 degC"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      parameter Modelica.SIunits.Inductance L2sigma=78E-6/3
        "Secondary stray inductance per phase"
        annotation (Dialog(tab="Nominal resistances and inductances"));
      annotation (
        defaultComponentName="transformerData",
        defaultComponentPrefixes="parameter",
        Documentation(info="<html>
<p>Basic parameters of transformers are predefined with default values.</p>
<p>Note: ratio n is defined between primary / secondary line-to-line voltage;
   therefore the user has to take into account primary and secondary connection!</p>
</html>"));
    end TransformerData;
  end ParameterRecords;
  annotation (version="0.9.0", versionDate="2018-12-27", uses(Modelica(version="3.2.2")),
    Icon(graphics={
        Rectangle(
          origin={2.835,10},
          fillColor={0,128,255},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-60,-60},{60,60}}),
        Rectangle(
          origin={2.835,10},
          fillColor={128,128,128},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-80,-60},{-60,60}}),
        Rectangle(
          origin={2.835,10},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          extent={{-60,50},{20,70}}),
        Rectangle(
          origin={2.835,10},
          fillColor={95,95,95},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{60,-10},{80,10}}),
        Polygon(
          origin={2.835,10},
          fillPattern=FillPattern.Solid,
          points={{-70,-90},{-60,-90},{-30,-20},{20,-20},{50,-90},{60,-90},{60,
              -100},{-70,-100},{-70,-90}})}),
    Documentation(info="<html>
<h4>Modelica library of machine models with parameter records.</h4>
<p>Have you ever been bored by propagating all the parameters for a new type of a machine used in your models? 
Here's the solution:
<ul>
<li>Build your own database of different machine parameters by extending from ElectricalMachines.ParameterRecords</li>
<li>Use the machine models from this library: they're extending from the machine models of the Modelica Standard Library</li>
<li>Propagate all necessary parameters with just one parameter record!</li>
<li>Change operational parameters in the machine model, if desired.</li>
</ul>
</p>
<h4>Note:</h4>
<p>
The parameter records ElectricalMachines.ParameterRecords extend from Modelica.Electrical.Machines.Utilities.ParameterRecords. 
They are intended to replace the parameter records in the Modelica Standard Library in the future.
</p>
<h4>License</h4>
<p>BSD-3</p>
<h4>Contact</h4>
<p>e-mail: a.haumer(at)edrives.eu</p>
</html>"));
end ElectricalMachines;
