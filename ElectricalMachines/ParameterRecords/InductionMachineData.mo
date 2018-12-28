within ElectricalMachines.ParameterRecords;
record InductionMachineData "Common parameters for induction machines"
  extends Modelica.Icons.Record;
  import Modelica.Constants.pi;
  //common parameters
  parameter String machine="machine";
  parameter Integer m(final min=2)=3 "Number of phases (m=3 for SpacePhasor machines)";
  parameter Modelica.SIunits.Inertia Jr=0.29 "Rotor's moment of inertia";
  parameter Modelica.SIunits.Inertia Js=Jr "Stator's moment of inertia";
  parameter Integer p(min=1) = 2 "Number of pole pairs (Integer)";
  //nominal parameters
  parameter Modelica.SIunits.Frequency fsNominal=50 "Nominal frequency"
    annotation (Dialog(tab="Nominal parameters"));
  parameter Modelica.SIunits.Voltage VsNominal=100
    "Nominal stator voltage per phase"
    annotation (Dialog(tab="Nominal parameters"));
  parameter Modelica.SIunits.Current IsNominal=100
    "Nominal stator current per phase"
    annotation (Dialog(tab="Nominal parameters"));
  parameter Modelica.SIunits.AngularVelocity wNominal(displayUnit="rev/min")=2*pi*fsNominal/p
    "Nominal speed"
    annotation (Dialog(tab="Nominal parameters"));
  parameter Modelica.SIunits.Torque tauNominal
    "Nominal torque"
    annotation (Dialog(tab="Nominal parameters"));
  parameter Modelica.SIunits.Temperature TsNominal=TsRef
    "Nominal stator temperature"
    annotation (Dialog(tab="Nominal parameters"));
  //resistances and inductances
  parameter Modelica.SIunits.Resistance Rs=0.03
    "Stator resistance per phase at TRef"
    annotation (Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.Temperature TsRef=293.15
    "Reference temperature of stator resistance"
    annotation (Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20
    alpha20s=0 "Temperature coefficient of stator resistance at 20 degC"
    annotation (Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.Inductance Lszero=Lssigma
    "Stator zero sequence inductance"
    annotation (Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.Inductance Lssigma=3*(1 - sqrt(1 - 0.0667))/(2*pi*fsNominal)
    "Stator stray inductance per phase"
    annotation (Dialog(tab="Nominal resistances and inductances"));
  //losses
  parameter Modelica.Electrical.Machines.Losses.FrictionParameters frictionParameters(
    PRef=0, wRef=wNominal) "Friction loss parameter record"
    annotation (Dialog(tab="Losses"));
  parameter Modelica.Electrical.Machines.Losses.CoreParameters statorCoreParameters(
    final m=m,
    PRef=0,
    VRef=VsNominal,
    wRef=2*pi*fsNominal)
    "Stator core loss parameter record; all parameters refer to stator side"
    annotation (Dialog(tab="Losses"));
  parameter Modelica.Electrical.Machines.Losses.StrayLoadParameters strayLoadParameters(
    PRef=0,
    IRef=IsNominal,
    wRef=wNominal) "Stray load losses" annotation (Dialog(tab="Losses"));
  annotation (
    defaultComponentName="inductionMachineData",
    defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>Basic parameters of induction machines are predefined with default values.</p>
</html>"),
    Icon(graphics={Text(
          extent={{-100,0},{100,-50}},
          lineColor={28,108,200},
          textString="%machine")}));
end InductionMachineData;
