within ElectricalMachines.QuasiStatic.DCMachines;
model DC_ElectricalExcited
  extends ElectricalMachines.Transient.DCMachines.DC_ElectricalExcited(final quasiStationary=true);
  extends Modelica.Electrical.Machines.Icons.QuasiStationaryMachine;
  annotation(defaultComponentName="dcee");
end DC_ElectricalExcited;
