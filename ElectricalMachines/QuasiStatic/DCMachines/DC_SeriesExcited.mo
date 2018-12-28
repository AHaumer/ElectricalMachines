within ElectricalMachines.QuasiStatic.DCMachines;
model DC_SeriesExcited "Quasistatic dc machine with series excitation"
  extends ElectricalMachines.Transient.DCMachines.DC_SeriesExcited(final quasiStationary=true);
  extends Modelica.Electrical.Machines.Icons.QuasiStationaryMachine;
  annotation(defaultComponentName="dcse", Documentation(info="<html>
<p>
Quasistatic dc machine with series excitation and parameter record
</p>
</html>"));
end DC_SeriesExcited;
