within ElectricalMachines.Transient.SpacePhasor;
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