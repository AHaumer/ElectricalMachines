within ElectricalMachines.Transient.FundamentalWave;
model SM_PermanentMagnet
  parameter ElectricalMachines.ParameterRecords.SM_PermanentMagnetData data
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  extends
    Modelica.Magnetic.FundamentalWave.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnet(
    TsOperational=data.TsNominal,
    TrOperational=data.TrNominal,
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
