within ElectricalMachines.ParameterRecords.IMCdata;
record Imc112M04 "Induction machine with squirrel cage, frame size 112M, 4 poles, 4 kW"
  import Modelica.Constants.pi;
  import Modelica.Electrical.Machines.Thermal.Constants;
  extends IM_SquirrelCageData(
  machine="112M04_4.0",
  Jr=0.008,
  p=2,
  fsNominal=50,
  VsNominal=400/sqrt(3),
  IsNominal=8.493,
  wNominal=2*pi*1431.57/60,
  tauNominal=26.682,
  TsNominal=273.15+95,
  TrNominal=273.15+95,
  Rs=1.45,
  TsRef=293.15,
  alpha20s=Constants.alpha20Copper,
  Lssigma=2.25/(2*pi*fsNominal),
  Lm=49.65/(2*pi*fsNominal),
  Lrsigma=2.75/(2*pi*fsNominal),
  Rr=1.05,
  TrRef=293.15,
  alpha20r=Constants.alpha20Aluminium,
  frictionParameters(PRef=60),
  statorCoreParameters(PRef=90),
  strayLoadParameters(PRef=20));
  annotation(defaultComponentName="imcData", defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
Parameters of an induction machine with quirrel cage:
<ul>
<li>frame size 112M</li>
<li>4 poles</li>
<li>4 kW</li>
<li>400 V Y / 50 Hz</li>
</ul>
</p>
</html>"));
end Imc112M04;
