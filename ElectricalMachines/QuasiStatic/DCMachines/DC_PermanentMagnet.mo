within ElectricalMachines.QuasiStatic.DCMachines;
model DC_PermanentMagnet "Quasistatic dc machine with permanent magnets"
  extends ElectricalMachines.Transient.DCMachines.DC_PermanentMagnet(final quasiStationary=true);
  extends Modelica.Electrical.Machines.Icons.QuasiStationaryMachine;
   annotation(defaultComponentName="dcpm", Documentation(info="<html>
<p>
Quasistatic dc machine with permanent magnets and parameter record
</p>
</html>"));
end DC_PermanentMagnet;
