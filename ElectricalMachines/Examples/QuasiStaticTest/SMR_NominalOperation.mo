within ElectricalMachines.Examples.QuasiStaticTest;
model SMR_NominalOperation "Nominal operation of synchronous machine with reluctance rotor"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  import Modelica.Utilities.Streams.print;
  import Modelica.SIunits.Conversions.to_deg;
  Real pf=powerSensor.y.re/powerSensor.abs_y "Power factor";
  ElectricalMachines.QuasiStatic.FundamentalWave.SM_ReluctanceRotor smr(gammar(
        fixed=true, start=pi/2 + smr.data.gammaNominal),
                                    wMechanical(fixed=true, start=smr.data.wNominal))
    annotation (Placement(transformation(extent={{-30,-20},{-10,0}})));
  Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
    terminalBox(m=smr.m, terminalConnection="Y")
    annotation (Placement(transformation(extent={{-30,-4},{-10,16}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentQuasiRMSSensor
    currentQuasiRMSSensor(m=smr.m) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,30})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource
    voltageSource(
    m=smr.m,
    gamma(fixed=true, start=0),
    f=smr.data.fsNominal,
    V=fill(smr.data.VsNominal, smr.m)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,30})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star(m=smr.m)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,0})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground
    annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
  Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{50,-20},{30,0}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor
    powerSensor(m=smr.m)
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Utilities.Controller controller(reference=smr.data.IsNominal, y0=smr.data.tauNominal)
    annotation (Placement(transformation(extent={{80,-20},{60,0}})));
equation
  when terminal() then
    print("gammar=" + String(to_deg(smr.gammar - pi/2), significantDigits=16) + "deg");
    print("tau   ="+String(multiSensor.tau, significantDigits=9)+"Nm");
    print("pf    ="+String(pf, significantDigits=9));
  end when;
  connect(terminalBox.plug_sn, smr.plug_sn)
    annotation (Line(points={{-26,0},{-26,0}},   color={85,170,255}));
  connect(terminalBox.plug_sp, smr.plug_sp)
    annotation (Line(points={{-14,0},{-14,0}},   color={85,170,255}));
  connect(currentQuasiRMSSensor.plug_n, terminalBox.plugSupply)
    annotation (Line(points={{-20,20},{-20,2}},  color={85,170,255}));
  connect(ground.pin, terminalBox.starpoint) annotation (Line(points={{-80,-20},
          {-70,-20},{-70,2},{-29,2}},   color={85,170,255}));
  connect(torque.flange, multiSensor.flange_b)
    annotation (Line(points={{30,-10},{20,-10}},
                                             color={0,0,0}));
  connect(smr.flange, multiSensor.flange_a)
    annotation (Line(points={{-10,-10},{0,-10}},
                                             color={0,0,0}));
  connect(star.pin_n, ground.pin)
    annotation (Line(points={{-80,-10},{-80,-20}}, color={85,170,255}));
  connect(voltageSource.plug_n, star.plug_p)
    annotation (Line(points={{-80,20},{-80,10}}, color={85,170,255}));
  connect(voltageSource.plug_p, powerSensor.currentP)
    annotation (Line(points={{-80,40},{-60,40}}, color={85,170,255}));
  connect(powerSensor.currentN, currentQuasiRMSSensor.plug_p)
    annotation (Line(points={{-40,40},{-20,40}}, color={85,170,255}));
  connect(powerSensor.currentP, powerSensor.voltageP)
    annotation (Line(points={{-60,40},{-60,50},{-50,50}}, color={85,170,255}));
  connect(voltageSource.plug_n, powerSensor.voltageN)
    annotation (Line(points={{-80,20},{-50,20},{-50,30}}, color={85,170,255}));
  connect(controller.y, torque.tau)
    annotation (Line(points={{59,-10},{52,-10}}, color={0,0,127}));
  connect(currentQuasiRMSSensor.I, controller.u) annotation (Line(points={{-10,30},
          {90,30},{90,-10},{82,-10}}, color={0,0,127}));
  annotation (experiment(Interval=0.001, Tolerance=1e-06), Documentation(info=
         "<html>
<p>
Nominal operation of quasistatic synchronous machine with reluctance rotor based on nominal stator current
</p>
</html>"));
end SMR_NominalOperation;
