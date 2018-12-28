within ElectricalMachines.QuasiStatic.DCMachines;
model DC_ElectricalExcited "Quasistatic dc machine with electrical excitation"
  extends ElectricalMachines.Transient.DCMachines.DC_ElectricalExcited(final quasiStationary=true);
  extends Modelica.Electrical.Machines.Icons.QuasiStationaryMachine;
  annotation(defaultComponentName="dcee", Documentation(info="<html>
<p>
Quasistatic dc machine with electrical excitation and parameter record
</p>
</html>"));
end DC_ElectricalExcited;
