within ElectricalMachines.ParameterRecords;
record SM_PermanentMagnetData "Parameters for synchronous machines with permanent magnets"
  extends SM_ReluctanceRotorData(machine="smpm",
    IsNominal=100,
    tauNominal=181.4447,
    gammaNominal=20.756097*pi/180,
    Lmd=0.3/(2*pi*fsNominal), Lmq=0.3/(2*pi*fsNominal));
  import Modelica.Constants.pi;
  //common parameter(s)
  parameter Modelica.SIunits.Voltage VsOpenCircuit=112.3
    "Open circuit RMS voltage per phase @ fsNominal";
  //nominal parameter(s)
  parameter Modelica.SIunits.Temperature TrNominal=TrRef
    "Nominal rotor temperature"
    annotation (Dialog(tab="Nominal parameters", group="Nominal temperatures", enable=useDamperCage));
  //losses
  parameter
    Modelica.Electrical.Machines.Losses.PermanentMagnetLossParameters permanentMagnetLossParameters(
    PRef=0,
    IRef=IsNominal,
    wRef=wNominal) "Permanent magnet loss parameter record"
    annotation (Dialog(tab="Losses"));
  annotation (
    defaultComponentName="smpmData",
    defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>Basic parameters of synchronous induction machines with permanent magnet are predefined with default values.</p>
</html>"));
end SM_PermanentMagnetData;
