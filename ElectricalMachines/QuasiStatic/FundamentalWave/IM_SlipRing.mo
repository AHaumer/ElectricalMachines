within ElectricalMachines.QuasiStatic.FundamentalWave;
model IM_SlipRing
  parameter ElectricalMachines.ParameterRecords.IM_SlipRingData data
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  extends
    Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.InductionMachines.IM_SlipRing(
    TsOperational=data.TsRef,
    TrOperational=data.TrRef,
    final m=data.m,
    final mr=data.mr,
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