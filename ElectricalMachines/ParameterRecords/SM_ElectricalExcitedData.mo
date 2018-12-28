within ElectricalMachines.ParameterRecords;
record SM_ElectricalExcitedData "Parameters for synchronous machines with electrical excitation"
  extends SM_ReluctanceRotorData(machine="smee",
    IsNominal=100,
    tauNominal=185.256354,
    gammaNominal=58.773623*pi/180,
    Lmd=1.5/(2*pi*fsNominal), Lmq=1.5/(2*pi*fsNominal));
  import Modelica.Constants.pi;
  //nominal parameter(s)
  parameter Modelica.SIunits.Current IeNominal=18.7107
    "Nominal excitation current"
    annotation (Dialog(tab="Nominal parameters"));
  parameter Modelica.SIunits.Temperature TeNominal=TeRef
    "Nominal excitation temperature"
    annotation (Dialog(tab="Nominal parameters", group="Nominal temperatures"));
  //excitation
  parameter Modelica.SIunits.Current IeOpenCircuit=10
    "Open circuit excitation current @ nominal voltage and frequency"
    annotation (Dialog(tab="Excitation"));
  parameter Modelica.SIunits.Resistance Re=2.5
    "Excitation resistance at TRef" annotation (Dialog(tab="Excitation"));
  parameter Modelica.SIunits.Temperature TeRef=293.15
    "Reference temperature of excitation resistance"
    annotation (Dialog(tab="Excitation"));
  parameter Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20
    alpha20e=0 "Temperature coefficient of excitation resistance"
    annotation (Dialog(tab="Excitation"));
  parameter Real sigmae(
    min=0,
    max=0.99) = 0.025 "Stray fraction of total excitation inductance"
    annotation (Dialog(tab="Excitation"));
  parameter Real turnsRatio=sqrt(2)*VsNominal/(2*pi*fsNominal*Lmd*IeOpenCircuit)
    "Stator current / excitation current"
    annotation (Dialog(tab="Excitation", enable=false));
  parameter Modelica.SIunits.Inductance Le=Lmd*turnsRatio^2*3/2/(1 - sigmae)
    "Excitation inductance"
    annotation (Dialog(tab="Excitation", enable=false));
  //losses
  parameter Modelica.Electrical.Machines.Losses.BrushParameters brushParameters(V=0,
      ILinear=0.01) "Brush loss parameter record"
    annotation (Dialog(tab="Losses"));
  annotation (
    defaultComponentName="smeeData",
    defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>Basic parameters of synchronous induction machines with electrical excitation are predefined with default values.</p>
</html>"));
end SM_ElectricalExcitedData;
