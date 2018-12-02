within ;
package ElectricalMachines "Electrical machine models with Parameter records"
  extends Modelica.Icons.Package;
  package Transient "Transient Machine Models"
    extends Modelica.Icons.Package;
    package DCMachines "Transient DC machines"
      extends Modelica.Icons.Package;

      model DC_PermanentMagnet
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.DcPermanentMagnetData
          dcpmData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet(
        TaOperational=dcpmData.TaRef,
        final Jr=dcpmData.Jr,
        final Js=dcpmData.Js,
        final VaNominal=dcpmData.VaNominal,
        final IaNominal=dcpmData.IaNominal,
        final wNominal=dcpmData.wNominal,
        final TaNominal=dcpmData.TaNominal,
        final Ra=dcpmData.Ra,
        final TaRef=dcpmData.TaRef,
        final alpha20a=dcpmData.alpha20a,
        final La=dcpmData.La,
        final frictionParameters=dcpmData.frictionParameters,
        final coreParameters=dcpmData.coreParameters,
        final strayLoadParameters=dcpmData.strayLoadParameters,
        final brushParameters=dcpmData.brushParameters);
        annotation(defaultComponentName="dcpm");
      end DC_PermanentMagnet;

      model DC_ElectricalExcited
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.DcElectricalExcitedData
          dceeData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_ElectricalExcited(
        TaOperational=dceeData.TaRef,
        TeOperational=dceeData.TeRef,
        final Jr=dceeData.Jr,
        final Js=dceeData.Js,
        final VaNominal=dceeData.VaNominal,
        final IaNominal=dceeData.IaNominal,
        final wNominal=dceeData.wNominal,
        final TaNominal=dceeData.TaNominal,
        final Ra=dceeData.Ra,
        final TaRef=dceeData.TaRef,
        final alpha20a=dceeData.alpha20a,
        final La=dceeData.La,
        final frictionParameters=dceeData.frictionParameters,
        final coreParameters=dceeData.coreParameters,
        final strayLoadParameters=dceeData.strayLoadParameters,
        final brushParameters=dceeData.brushParameters,
        final IeNominal=dceeData.IeNominal,
        final Re=dceeData.Re,
        final TeRef=dceeData.TeRef,
        final alpha20e=dceeData.alpha20e,
        final Le=dceeData.Le,
        final sigmae=dceeData.sigmae);
        annotation(defaultComponentName="dcee");
      end DC_ElectricalExcited;

      model DC_SeriesExcited
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.DcSeriesExcitedData
          dcseData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_SeriesExcited(
        TaOperational=dcseData.TaRef,
        TeOperational=dcseData.TeRef,
        final Jr=dcseData.Jr,
        final Js=dcseData.Js,
        final VaNominal=dcseData.VaNominal,
        final IaNominal=dcseData.IaNominal,
        final wNominal=dcseData.wNominal,
        final TaNominal=dcseData.TaNominal,
        final TeNominal=dcseData.TeNominal,
        final Ra=dcseData.Ra,
        final TaRef=dcseData.TaRef,
        final alpha20a=dcseData.alpha20a,
        final La=dcseData.La,
        final frictionParameters=dcseData.frictionParameters,
        final coreParameters=dcseData.coreParameters,
        final strayLoadParameters=dcseData.strayLoadParameters,
        final brushParameters=dcseData.brushParameters,
        final Re=dcseData.Re,
        final TeRef=dcseData.TeRef,
        final alpha20e=dcseData.alpha20e,
        final Le=dcseData.Le,
        final sigmae=dcseData.sigmae);
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
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
          imcData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage(
        TsOperational=imcData.TsRef,
        TrOperational=imcData.TrRef,
        final p=imcData.p,
        final fsNominal=imcData.fsNominal,
        final Jr=imcData.Jr,
        final Js=imcData.Js,
        final Rs=imcData.Rs,
        final TsRef=imcData.TsRef,
        final alpha20s=imcData.alpha20s,
        final Lszero=imcData.Lszero,
        final Lssigma=imcData.Lssigma,
        final Lm=imcData.Lm,
        final Lrsigma=imcData.Lrsigma,
        final Rr=imcData.Rr,
        final TrRef=imcData.TrRef,
        final alpha20r=imcData.alpha20s,
        final frictionParameters=imcData.frictionParameters,
        final statorCoreParameters=imcData.statorCoreParameters,
        final strayLoadParameters=imcData.strayLoadParameters);
        annotation(defaultComponentName="imc");
      end IM_SquirrelCage;

      model IM_SlipRing
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.AIM_SlipRingData
          imsData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing(
        TsOperational=imsData.TsRef,
        TrOperational=imsData.TrRef,
        final p=imsData.p,
        final fsNominal=imsData.fsNominal,
        final useTurnsRatio=imsData.useTurnsRatio,
        final turnsRatio=imsData.turnsRatio,
        final VsNominal=imsData.VsNominal,
        final VrLockedRotor=imsData.VrLockedRotor,
        final Jr=imsData.Jr,
        final Js=imsData.Js,
        final Rs=imsData.Rs,
        final TsRef=imsData.TsRef,
        final alpha20s=imsData.alpha20s,
        final Lszero=imsData.Lszero,
        final Lssigma=imsData.Lssigma,
        final Lm=imsData.Lm,
        final Lrsigma=imsData.Lrsigma,
        final Lrzero=imsData.Lrzero,
        final Rr=imsData.Rr,
        final TrRef=imsData.TrRef,
        final alpha20r=imsData.alpha20s,
        final frictionParameters=imsData.frictionParameters,
        final statorCoreParameters=imsData.statorCoreParameters,
        final strayLoadParameters=imsData.strayLoadParameters,
        final rotorCoreParameters=imsData.rotorCoreParameters);
        annotation(defaultComponentName="ims");
      end IM_SlipRing;

      model SM_PermanentMagnet
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.SM_PermanentMagnetData
          smpmData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet(
        TsOperational=smpmData.TsRef,
        TrOperational=smpmData.TrRef,
        final p=smpmData.p,
        final fsNominal=smpmData.fsNominal,
        final VsOpenCircuit=smpmData.VsOpenCircuit,
        final Jr=smpmData.Jr,
        final Js=smpmData.Js,
        final Rs=smpmData.Rs,
        final TsRef=smpmData.TsRef,
        final alpha20s=smpmData.alpha20s,
        final Lszero=smpmData.Lszero,
        final Lssigma=smpmData.Lssigma,
        final Lmd=smpmData.Lmd,
        final Lmq=smpmData.Lmq,
        useDamperCage=smpmData.useDamperCage,
        final Lrsigmad=smpmData.Lrsigmad,
        final Lrsigmaq=smpmData.Lrsigmaq,
        final Rrd=smpmData.Rrd,
        final Rrq=smpmData.Rrq,
        final TrRef=smpmData.TrRef,
        final alpha20r=smpmData.alpha20s,
        final frictionParameters=smpmData.frictionParameters,
        final statorCoreParameters=smpmData.statorCoreParameters,
        final strayLoadParameters=smpmData.strayLoadParameters,
        final permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters);
        annotation(defaultComponentName="smpm");
      end SM_PermanentMagnet;

      model SM_ElectricalExcited
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.SM_ElectricalExcitedData
          smeeData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited(
        TsOperational=smeeData.TsRef,
        TrOperational=smeeData.TrRef,
        TeOperational=smeeData.TeRef,
        final p=smeeData.p,
        final fsNominal=smeeData.fsNominal,
        final Jr=smeeData.Jr,
        final Js=smeeData.Js,
        final Rs=smeeData.Rs,
        final TsRef=smeeData.TsRef,
        final alpha20s=smeeData.alpha20s,
        final Lszero=smeeData.Lszero,
        final Lssigma=smeeData.Lssigma,
        final Lmd=smeeData.Lmd,
        final Lmq=smeeData.Lmq,
        useDamperCage=smeeData.useDamperCage,
        final Lrsigmad=smeeData.Lrsigmad,
        final Lrsigmaq=smeeData.Lrsigmaq,
        final Rrd=smeeData.Rrd,
        final Rrq=smeeData.Rrq,
        final TrRef=smeeData.TrRef,
        final alpha20r=smeeData.alpha20s,
        final VsNominal=smeeData.VsNominal,
        final IeOpenCircuit=smeeData.IeOpenCircuit,
        final Re=smeeData.Re,
        final TeRef=smeeData.TeRef,
        final alpha20e=smeeData.alpha20e,
        final sigmae=smeeData.sigmae,
        final frictionParameters=smeeData.frictionParameters,
        final statorCoreParameters=smeeData.statorCoreParameters,
        final strayLoadParameters=smeeData.strayLoadParameters,
        final brushParameters=smeeData.brushParameters);
        annotation(defaultComponentName="smee");
      end SM_ElectricalExcited;

      model SM_ReluctanceRotor
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.SM_ReluctanceRotorData
          smrData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor(
        TsOperational=smrData.TsRef,
        TrOperational=smrData.TrRef,
        final p=smrData.p,
        final fsNominal=smrData.fsNominal,
        final Jr=smrData.Jr,
        final Js=smrData.Js,
        final Rs=smrData.Rs,
        final TsRef=smrData.TsRef,
        final alpha20s=smrData.alpha20s,
        final Lszero=smrData.Lszero,
        final Lssigma=smrData.Lssigma,
        final Lmd=smrData.Lmd,
        final Lmq=smrData.Lmq,
        useDamperCage=smrData.useDamperCage,
        final Lrsigmad=smrData.Lrsigmad,
        final Lrsigmaq=smrData.Lrsigmaq,
        final Rrd=smrData.Rrd,
        final Rrq=smrData.Rrq,
        final TrRef=smrData.TrRef,
        final alpha20r=smrData.alpha20s,
        final frictionParameters=smrData.frictionParameters,
        final statorCoreParameters=smrData.statorCoreParameters,
        final strayLoadParameters=smrData.strayLoadParameters);
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
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
          imcData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage(
        TsOperational=imcData.TsRef,
        TrOperational=imcData.TrRef,
        final p=imcData.p,
        final fsNominal=imcData.fsNominal,
        final Jr=imcData.Jr,
        final Js=imcData.Js,
        final Rs=imcData.Rs,
        final TsRef=imcData.TsRef,
        final alpha20s=imcData.alpha20s,
        final Lszero=imcData.Lszero,
        final Lssigma=imcData.Lssigma,
        final Lm=imcData.Lm,
        final Lrsigma=imcData.Lrsigma,
        final Rr=imcData.Rr,
        final TrRef=imcData.TrRef,
        final alpha20r=imcData.alpha20s,
        final frictionParameters=imcData.frictionParameters,
        final statorCoreParameters=imcData.statorCoreParameters,
        final strayLoadParameters=imcData.strayLoadParameters);
        annotation(defaultComponentName="imc");
      end IM_SquirrelCage;

      model IM_SlipRing
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.AIM_SlipRingData
          imsData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.FundamentalWave.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing(
        TsOperational=imsData.TsRef,
        TrOperational=imsData.TrRef,
        final p=imsData.p,
        final fsNominal=imsData.fsNominal,
        final useTurnsRatio=imsData.useTurnsRatio,
        final TurnsRatio=imsData.turnsRatio,
        final VsNominal=imsData.VsNominal,
        final VrLockedRotor=imsData.VrLockedRotor,
        final Jr=imsData.Jr,
        final Js=imsData.Js,
        final Rs=imsData.Rs,
        final TsRef=imsData.TsRef,
        final alpha20s=imsData.alpha20s,
        final Lszero=imsData.Lszero,
        final Lssigma=imsData.Lssigma,
        final Lm=imsData.Lm,
        final Lrsigma=imsData.Lrsigma,
        final Lrzero=imsData.Lrzero,
        final Rr=imsData.Rr,
        final TrRef=imsData.TrRef,
        final alpha20r=imsData.alpha20s,
        final frictionParameters=imsData.frictionParameters,
        final statorCoreParameters=imsData.statorCoreParameters,
        final strayLoadParameters=imsData.strayLoadParameters,
        final rotorCoreParameters=imsData.rotorCoreParameters);
        annotation(defaultComponentName="ims");
      end IM_SlipRing;

      model SM_PermanentMagnet
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.SM_PermanentMagnetData
          smpmData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet(
        TsOperational=smpmData.TsRef,
        TrOperational=smpmData.TrRef,
        final p=smpmData.p,
        final fsNominal=smpmData.fsNominal,
        final VsOpenCircuit=smpmData.VsOpenCircuit,
        final Jr=smpmData.Jr,
        final Js=smpmData.Js,
        final Rs=smpmData.Rs,
        final TsRef=smpmData.TsRef,
        final alpha20s=smpmData.alpha20s,
        final Lszero=smpmData.Lszero,
        final Lssigma=smpmData.Lssigma,
        final Lmd=smpmData.Lmd,
        final Lmq=smpmData.Lmq,
        useDamperCage=smpmData.useDamperCage,
        final Lrsigmad=smpmData.Lrsigmad,
        final Lrsigmaq=smpmData.Lrsigmaq,
        final Rrd=smpmData.Rrd,
        final Rrq=smpmData.Rrq,
        final TrRef=smpmData.TrRef,
        final alpha20r=smpmData.alpha20s,
        final frictionParameters=smpmData.frictionParameters,
        final statorCoreParameters=smpmData.statorCoreParameters,
        final strayLoadParameters=smpmData.strayLoadParameters,
        final permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters);
        annotation(defaultComponentName="smpm");
      end SM_PermanentMagnet;

      model SM_ElectricalExcited
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.SM_ElectricalExcitedData
          smeeData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcited(
        TsOperational=smeeData.TsRef,
        TrOperational=smeeData.TrRef,
        TeOperational=smeeData.TeRef,
        final p=smeeData.p,
        final fsNominal=smeeData.fsNominal,
        final Jr=smeeData.Jr,
        final Js=smeeData.Js,
        final Rs=smeeData.Rs,
        final TsRef=smeeData.TsRef,
        final alpha20s=smeeData.alpha20s,
        final Lszero=smeeData.Lszero,
        final Lssigma=smeeData.Lssigma,
        final Lmd=smeeData.Lmd,
        final Lmq=smeeData.Lmq,
        useDamperCage=smeeData.useDamperCage,
        final Lrsigmad=smeeData.Lrsigmad,
        final Lrsigmaq=smeeData.Lrsigmaq,
        final Rrd=smeeData.Rrd,
        final Rrq=smeeData.Rrq,
        final TrRef=smeeData.TrRef,
        final alpha20r=smeeData.alpha20s,
        final VsNominal=smeeData.VsNominal,
        final IeOpenCircuit=smeeData.IeOpenCircuit,
        final Re=smeeData.Re,
        final TeRef=smeeData.TeRef,
        final alpha20e=smeeData.alpha20e,
        final sigmae=smeeData.sigmae,
        final frictionParameters=smeeData.frictionParameters,
        final statorCoreParameters=smeeData.statorCoreParameters,
        final strayLoadParameters=smeeData.strayLoadParameters,
        final brushParameters=smeeData.brushParameters);
        annotation(defaultComponentName="smee");
      end SM_ElectricalExcited;

      model SM_ReluctanceRotor
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.SM_ReluctanceRotorData
          smrData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotor(
        TsOperational=smrData.TsRef,
        TrOperational=smrData.TrRef,
        final p=smrData.p,
        final fsNominal=smrData.fsNominal,
        final Jr=smrData.Jr,
        final Js=smrData.Js,
        final Rs=smrData.Rs,
        final TsRef=smrData.TsRef,
        final alpha20s=smrData.alpha20s,
        final Lszero=smrData.Lszero,
        final Lssigma=smrData.Lssigma,
        final Lmd=smrData.Lmd,
        final Lmq=smrData.Lmq,
        useDamperCage=smrData.useDamperCage,
        final Lrsigmad=smrData.Lrsigmad,
        final Lrsigmaq=smrData.Lrsigmaq,
        final Rrd=smrData.Rrd,
        final Rrq=smrData.Rrq,
        final TrRef=smrData.TrRef,
        final alpha20r=smrData.alpha20s,
        final frictionParameters=smrData.frictionParameters,
        final statorCoreParameters=smrData.statorCoreParameters,
        final strayLoadParameters=smrData.strayLoadParameters);
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
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.AIM_SquirrelCageData
          imcData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.InductionMachines.IM_SquirrelCage(
        TsOperational=imcData.TsRef,
        TrOperational=imcData.TrRef,
        final p=imcData.p,
        final fsNominal=imcData.fsNominal,
        final Jr=imcData.Jr,
        final Js=imcData.Js,
        final Rs=imcData.Rs,
        final TsRef=imcData.TsRef,
        final alpha20s=imcData.alpha20s,
        final Lssigma=imcData.Lssigma,
        final Lm=imcData.Lm,
        final Lrsigma=imcData.Lrsigma,
        final Rr=imcData.Rr,
        final TrRef=imcData.TrRef,
        final alpha20r=imcData.alpha20s,
        final frictionParameters=imcData.frictionParameters,
        final statorCoreParameters=imcData.statorCoreParameters,
        final strayLoadParameters=imcData.strayLoadParameters);
        annotation(defaultComponentName="imc");
      end IM_SquirrelCage;

      model IM_SlipRing
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.AIM_SlipRingData
          imsData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.InductionMachines.IM_SlipRing(
        TsOperational=imsData.TsRef,
        TrOperational=imsData.TrRef,
        final p=imsData.p,
        final fsNominal=imsData.fsNominal,
        final useTurnsRatio=imsData.useTurnsRatio,
        final TurnsRatio=imsData.turnsRatio,
        final VsNominal=imsData.VsNominal,
        final VrLockedRotor=imsData.VrLockedRotor,
        final Jr=imsData.Jr,
        final Js=imsData.Js,
        final Rs=imsData.Rs,
        final TsRef=imsData.TsRef,
        final alpha20s=imsData.alpha20s,
        final Lssigma=imsData.Lssigma,
        final Lm=imsData.Lm,
        final Lrsigma=imsData.Lrsigma,
        final Rr=imsData.Rr,
        final TrRef=imsData.TrRef,
        final alpha20r=imsData.alpha20s,
        final frictionParameters=imsData.frictionParameters,
        final statorCoreParameters=imsData.statorCoreParameters,
        final strayLoadParameters=imsData.strayLoadParameters,
        final rotorCoreParameters=imsData.rotorCoreParameters);
        annotation(defaultComponentName="ims");
      end IM_SlipRing;

      model SM_PermanentMagnet
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.SM_PermanentMagnetData
          smpmData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_PermanentMagnet(
        TsOperational=smpmData.TsRef,
        TrOperational=smpmData.TrRef,
        final p=smpmData.p,
        final fsNominal=smpmData.fsNominal,
        final VsOpenCircuit=smpmData.VsOpenCircuit,
        final Jr=smpmData.Jr,
        final Js=smpmData.Js,
        final Rs=smpmData.Rs,
        final TsRef=smpmData.TsRef,
        final alpha20s=smpmData.alpha20s,
        final Lssigma=smpmData.Lssigma,
        final Lmd=smpmData.Lmd,
        final Lmq=smpmData.Lmq,
        useDamperCage=smpmData.useDamperCage,
        final Lrsigmad=smpmData.Lrsigmad,
        final Lrsigmaq=smpmData.Lrsigmaq,
        final Rrd=smpmData.Rrd,
        final Rrq=smpmData.Rrq,
        final TrRef=smpmData.TrRef,
        final alpha20r=smpmData.alpha20s,
        final frictionParameters=smpmData.frictionParameters,
        final statorCoreParameters=smpmData.statorCoreParameters,
        final strayLoadParameters=smpmData.strayLoadParameters,
        final permanentMagnetLossParameters=smpmData.permanentMagnetLossParameters);
        annotation(defaultComponentName="smpm");
      end SM_PermanentMagnet;

      model SM_ElectricalExcited
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.SM_ElectricalExcitedData
          smeeData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_ElectricalExcited(
        TsOperational=smeeData.TsRef,
        TrOperational=smeeData.TrRef,
        TeOperational=smeeData.TeRef,
        final p=smeeData.p,
        final fsNominal=smeeData.fsNominal,
        final Jr=smeeData.Jr,
        final Js=smeeData.Js,
        final Rs=smeeData.Rs,
        final TsRef=smeeData.TsRef,
        final alpha20s=smeeData.alpha20s,
        final Lssigma=smeeData.Lssigma,
        final Lmd=smeeData.Lmd,
        final Lmq=smeeData.Lmq,
        useDamperCage=smeeData.useDamperCage,
        final Lrsigmad=smeeData.Lrsigmad,
        final Lrsigmaq=smeeData.Lrsigmaq,
        final Rrd=smeeData.Rrd,
        final Rrq=smeeData.Rrq,
        final TrRef=smeeData.TrRef,
        final alpha20r=smeeData.alpha20s,
        final VsNominal=smeeData.VsNominal,
        final IeOpenCircuit=smeeData.IeOpenCircuit,
        final Re=smeeData.Re,
        final TeRef=smeeData.TeRef,
        final alpha20e=smeeData.alpha20e,
        final frictionParameters=smeeData.frictionParameters,
        final statorCoreParameters=smeeData.statorCoreParameters,
        final strayLoadParameters=smeeData.strayLoadParameters,
        final brushParameters=smeeData.brushParameters);
        annotation(defaultComponentName="smee");
      end SM_ElectricalExcited;

      model SM_ReluctanceRotor
        parameter
          Modelica.Electrical.Machines.Utilities.ParameterRecords.SM_ReluctanceRotorData
          smrData
          annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
        extends
          Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_ReluctanceRotor(
        TsOperational=smrData.TsRef,
        TrOperational=smrData.TrRef,
        final p=smrData.p,
        final fsNominal=smrData.fsNominal,
        final Jr=smrData.Jr,
        final Js=smrData.Js,
        final Rs=smrData.Rs,
        final TsRef=smrData.TsRef,
        final alpha20s=smrData.alpha20s,
        final Lssigma=smrData.Lssigma,
        final Lmd=smrData.Lmd,
        final Lmq=smrData.Lmq,
        useDamperCage=smrData.useDamperCage,
        final Lrsigmad=smrData.Lrsigmad,
        final Lrsigmaq=smrData.Lrsigmaq,
        final Rrd=smrData.Rrd,
        final Rrq=smrData.Rrq,
        final TrRef=smrData.TrRef,
        final alpha20r=smrData.alpha20s,
        final frictionParameters=smrData.frictionParameters,
        final statorCoreParameters=smrData.statorCoreParameters,
        final strayLoadParameters=smrData.strayLoadParameters);
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
  annotation (uses(Modelica(version="3.2.2")), Icon(graphics={
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
<li>Build your own database of different machine parameters by extending from Modelica.Electrical.Machines.Utilities.ParameterRecords</li>
<li>Use the machine models from this library: they're extending from the machine models of the Modelica Standard Library</li>
<li>Propagate all necessary parameters with just one parameter record!</li>
<li>Change operational parameters in the machine model, if desired.</li>
</ul>
</p>
<h4>License</h4>
<p>BSD-3</p>
<h4>Contact</h4>
<p>e-mail: a.haumer(at)edrives.eu</p>
</html>"));
end ElectricalMachines;
