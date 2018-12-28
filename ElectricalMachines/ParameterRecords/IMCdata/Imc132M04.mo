within ElectricalMachines.ParameterRecords.IMCdata;
record Imc132M04 "Induction machine with squirrel cage, frame size 132M, 4 poles, 7.5 kW"
  import Modelica.Constants.pi;
  import Modelica.Electrical.Machines.Thermal.Constants;
  extends IM_SquirrelCageData(
  machine="132M04_7.5",
  Jr=0.026,
  p=2,
  fsNominal=50,
  VsNominal=400/sqrt(3),
  IsNominal=14.171,
  wNominal=2*pi*1454.30/60,
  tauNominal=49.247,
  TsNominal=273.15+95,
  TrNominal=273.15+95,
  Rs=0.615,
  TsRef=293.15,
  alpha20s=Constants.alpha20Copper,
  Lssigma=1.41/(2*pi*fsNominal),
  Lm=42.80/(2*pi*fsNominal),
  Lrsigma=1.95/(2*pi*fsNominal),
  Rr=0.395,
  TrRef=293.15,
  alpha20r=Constants.alpha20Aluminium,
  frictionParameters(PRef=115),
  statorCoreParameters(PRef=160),
  strayLoadParameters(PRef=37.5));
  annotation(defaultComponentName="imcData", defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
Parameters of an induction machine with quirrel cage:
<ul>
<li>frame size 132M</li>
<li>4 poles</li>
<li>7.5 kW</li>
<li>400 V Y / 50 Hz</li>
</ul>
</p>
</html>"));
end Imc132M04;
