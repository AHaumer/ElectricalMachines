within ElectricalMachines.Transient.DCMachines;
model DC_PermanentMagnet "Transient dc machine with permanent magnets"
  parameter ElectricalMachines.ParameterRecords.DcPermanentMagnetData data "Machine parameters"
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  extends
    Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet(
    TaOperational=data.TaNominal,
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
    final brushParameters=data.brushParameters);
  annotation(defaultComponentName="dcpm", Documentation(info="<html>
<p>
Transient dc machine with permanent magnets and parameter record
</p>
</html>"));
end DC_PermanentMagnet;
