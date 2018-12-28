within ElectricalMachines.ParameterRecords;
record DcElectricalExcitedData "Parameters for DC machines with electrical excitation"
  extends DcPermanentMagnetData(machine="dcee",
    tauNominal=63.6619772);
  //nominal parameter(s)
  parameter Modelica.SIunits.Temperature TeNominal=TeRef
    "Nominal excitation temperature"
    annotation (Dialog(tab="Nominal parameters"));
  //excitation
  parameter Modelica.SIunits.Current IeNominal=1
    "Nominal excitation current" annotation (Dialog(tab="Excitation"));
  parameter Modelica.SIunits.Resistance Re=100
    "Field excitation resistance at TRef"
    annotation (Dialog(tab="Excitation"));
  parameter Modelica.SIunits.Temperature TeRef=293.15
    "Reference temperature of excitation resistance"
    annotation (Dialog(tab="Excitation"));
  parameter
    Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20 alpha20e=0
    "Temperature coefficient of excitation resistance"
    annotation (Dialog(tab="Excitation"));
  parameter Modelica.SIunits.Inductance Le=1
    "Total field excitation inductance"
    annotation (Dialog(tab="Excitation"));
  parameter Real sigmae(
    min=0,
    max=0.99) = 0 "Stray fraction of total excitation inductance"
    annotation (Dialog(tab="Excitation"));
  annotation (
    defaultComponentName="dceeData",
    defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>Basic parameters of DC machines are predefined with default values.</p>
</html>"));
end DcElectricalExcitedData;
