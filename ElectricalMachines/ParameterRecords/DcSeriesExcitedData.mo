within ElectricalMachines.ParameterRecords;
record DcSeriesExcitedData "Parameters for DC machines with series excitation"
  extends DcPermanentMagnetData(machine="dcse",
    wNominal=1410*2*pi/60,
    tauNominal=63.6619772,
    ViNominal=VaNominal -
      (Modelica.Electrical.Machines.Thermal.convertResistance(Ra, TaRef, alpha20a, TaNominal) +
       Modelica.Electrical.Machines.Thermal.convertResistance(Re, TeRef, alpha20e, TeNominal))*IaNominal -
      Modelica.Electrical.Machines.Losses.DCMachines.brushVoltageDrop(brushParameters,IaNominal));
  import Modelica.Constants.pi;
  //nominal parameter(s)
  parameter Modelica.SIunits.Temperature TeNominal=TeRef
    "Nominal series excitation temperature"
    annotation (Dialog(tab="Nominal parameters"));
  //series excitation
  parameter Modelica.SIunits.Resistance Re=0.01
    "Series excitation resistance at TRef"
    annotation (Dialog(tab="Excitation"));
  parameter Modelica.SIunits.Temperature TeRef=293.15
    "Reference temperature of excitation resistance"
    annotation (Dialog(tab="Excitation"));
  parameter
    Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20 alpha20e=0
    "Temperature coefficient of excitation resistance"
    annotation (Dialog(tab="Excitation"));
  parameter Modelica.SIunits.Inductance Le=0.0005
    "Total field excitation inductance"
    annotation (Dialog(tab="Excitation"));
  parameter Real sigmae(
    min=0,
    max=0.99) = 0 "Stray fraction of total excitation inductance"
    annotation (Dialog(tab="Excitation"));
  annotation (
    defaultComponentName="dcseData",
    defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>Basic parameters of DC machines are predefined with default values.</p>
</html>"));
end DcSeriesExcitedData;
