within ElectricalMachines.QuasiStatic.DCMachines;
model DC_SeriesExcited
  extends ElectricalMachines.Transient.DCMachines.DC_SeriesExcited(final quasiStationary=true);
  extends Modelica.Electrical.Machines.Icons.QuasiStationaryMachine;
  annotation(defaultComponentName="dcse");
end DC_SeriesExcited;
