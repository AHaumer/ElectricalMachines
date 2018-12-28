within ElectricalMachines.Transient.DCMachines;
model DC_ElectricalExcited "Transient dc machine with electrical excitation"
  parameter ElectricalMachines.ParameterRecords.DcElectricalExcitedData data "Machine parameters"
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  extends
    Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_ElectricalExcited(
    TaOperational=data.TaNominal,
    TeOperational=data.TeNominal,
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
  annotation(defaultComponentName="dcee", Documentation(info="<html>
<p>
Transient dc machine with electrical excitation and parameter record
</p>
</html>"));
end DC_ElectricalExcited;
