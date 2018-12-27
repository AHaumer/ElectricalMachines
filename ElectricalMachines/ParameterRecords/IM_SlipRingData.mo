within ElectricalMachines.ParameterRecords;
record IM_SlipRingData "Parameters for induction machines with slip ring rotor"
  extends InductionMachineData(machine="ims",
    wNominal=1440.4552325875*2*pi/60);
  import Modelica.Constants.pi;
  //common parameters
  parameter Integer mr(final min=2)=3 "Number of rotor phases (m=3 for SpacePhasor machines)";
  parameter Boolean useTurnsRatio=true
    "Use turnsRatio or calculate from locked-rotor voltage?";
  parameter Real turnsRatio(final min=Modelica.Constants.small)=VsNominal/VrLockedRotor*
    (2*pi*fsNominal*Lm)/sqrt(Rs^2 + (2*pi*fsNominal*(Lm + Lssigma))^2)
    "Effective number of stator turns / effective number of rotor turns"
    annotation (Dialog(enable=useTurnsRatio));
  parameter Modelica.SIunits.Voltage VrLockedRotor=VsNominal*
    (2*pi*fsNominal*Lm)/sqrt(Rs^2 + (2*pi*fsNominal*(Lm + Lssigma))^2)
    "Locked-rotor voltage per phase"
    annotation (Dialog(enable=not useTurnsRatio));
  //nominal parameter(s)
  parameter Real s=1 - wNominal/(2*pi*fsNominal/p) "Nominal slip"
    annotation (Dialog(tab="Nominal parameters", enable=false));
  //resistances and inductances
  parameter Modelica.SIunits.Inductance Lm=3*sqrt(1 - 0.0667)/(2*pi*fsNominal)
    "Stator main field inductance per phase"
    annotation (Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.Inductance Lrsigma=3*(1 - sqrt(1 - 0.0667))/(2*pi*fsNominal)/turnsRatio^2
    "Rotor stray inductance per phase w.r.t. rotor side"
    annotation (Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.Inductance Lrzero=Lrsigma/turnsRatio^2
    "Rotor zero sequence inductance w.r.t. rotor side"
    annotation (Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.Resistance Rr=0.04/turnsRatio^2
    "Rotor resistance per phase at TRef w.r.t. rotor side"
    annotation (Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.SIunits.Temperature TrRef=293.15
    "Reference temperature of rotor resistance"
    annotation (Dialog(tab="Nominal resistances and inductances"));
  parameter Modelica.Electrical.Machines.Thermal.LinearTemperatureCoefficient20
    alpha20r=0 "Temperature coefficient of rotor resistance at 20 degC"
    annotation (Dialog(tab="Nominal resistances and inductances"));
  //losses
  parameter Modelica.Electrical.Machines.Losses.CoreParameters rotorCoreParameters(
    final m=3,
    PRef=0,
    VRef=VrLockedRotor*s,
    wRef=2*pi*fsNominal*s)
    "Rotor core loss parameter record; all parameters refer to rotor side"
    annotation (Dialog(tab="Losses"));
  annotation (
    defaultComponentName="imsData",
    defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>Basic parameters of asynchronous induction machines with slip ring are predefined with default values.</p>
</html>"));
end IM_SlipRingData;
