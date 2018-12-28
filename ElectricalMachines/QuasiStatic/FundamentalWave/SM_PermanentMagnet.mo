within ElectricalMachines.QuasiStatic.FundamentalWave;
model SM_PermanentMagnet "Quasistatic synchronous machine with permanent magnets"
  parameter ElectricalMachines.ParameterRecords.SM_PermanentMagnetData data "Machine parameters"
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  extends
    Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_PermanentMagnet(
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
    final Lssigma=data.Lssigma,
    final Lmd=data.Lmd,
    final Lmq=data.Lmq,
    final useDamperCage=UseDamperCage,
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
  parameter Boolean UseDamperCage=data.useDamperCage "Enable/disable damper cage";
  annotation(defaultComponentName="smpm", Documentation(info="<html>
<p>
Quasistatic synchronous machine with permanent magnets based on FundamentalWave theory and parameter record
</p>
</html>"));
end SM_PermanentMagnet;
