within ElectricalMachines.Transient.DCMachines;
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
