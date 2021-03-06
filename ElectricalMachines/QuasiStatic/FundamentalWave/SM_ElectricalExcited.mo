within ElectricalMachines.QuasiStatic.FundamentalWave;
model SM_ElectricalExcited "Quasistatic synchronous machine with electrical excitation"
  parameter ElectricalMachines.ParameterRecords.SM_ElectricalExcitedData data "Machine parameters"
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  extends
    Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.SynchronousMachines.SM_ElectricalExcited(
    TsOperational=data.TsNominal,
    TrOperational=data.TrNominal,
    TeOperational=data.TeNominal,
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
    final useDamperCage=UseDamperCage,
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
  parameter Boolean UseDamperCage=data.useDamperCage "Enable/disable damper cage";
  annotation(defaultComponentName="smee", Documentation(info="<html>
<p>
Quasistatic synchronous machine with electrical excitation based on FundamentalWave theory and parameter record
</p>
</html>"));
end SM_ElectricalExcited;
