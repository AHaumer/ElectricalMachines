within ElectricalMachines.Transient.SpacePhasor;
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