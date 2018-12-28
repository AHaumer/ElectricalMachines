within ElectricalMachines.QuasiStatic.FundamentalWave;
model IM_SquirrelCage "Quasistatic induction machine with squirrel cage"
  parameter ElectricalMachines.ParameterRecords.IM_SquirrelCageData data "Machine parameters"
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  extends
    Modelica.Magnetic.QuasiStatic.FundamentalWave.BasicMachines.InductionMachines.IM_SquirrelCage(
    TsOperational=data.TsNominal,
    TrOperational=data.TrNominal,
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
  annotation(defaultComponentName="imc", Documentation(info="<html>
<p>
Quasistatic induction machine with squirrel cage based on FundamentalWave theory and parameter record
</p>
</html>"));
end IM_SquirrelCage;
