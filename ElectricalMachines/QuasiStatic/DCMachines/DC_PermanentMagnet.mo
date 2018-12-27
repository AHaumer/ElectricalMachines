within ElectricalMachines.QuasiStatic.DCMachines;
model DC_PermanentMagnet
  extends ElectricalMachines.Transient.DCMachines.DC_PermanentMagnet(final quasiStationary=true);
  extends Modelica.Electrical.Machines.Icons.QuasiStationaryMachine;
   annotation(defaultComponentName="dcpm");
end DC_PermanentMagnet;
