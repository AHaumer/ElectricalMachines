within ElectricalMachines.Examples.QuasiStaticTest;
model SMEE_NominalOperation "Nominal operation of synchronous machine with electrical excitation"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  import Modelica.Utilities.Streams.print;
  import Modelica.SIunits.Conversions.to_deg;
  Real pf=Utilities.ratio(powerSensor.P, powerSensor.S) "Power factor";
  ElectricalMachines.QuasiStatic.FundamentalWave.SM_ElectricalExcited smee(
    gammar(fixed=true, start=pi/2 + smee.data.gammaNominal),
    wMechanical(fixed=true, start=smee.data.wNominal))
    annotation (Placement(transformation(extent={{-30,-20},{-10,0}})));
  Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
    terminalBox(m=smee.m, terminalConnection="Y")
    annotation (Placement(transformation(extent={{-30,-4},{-10,16}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentQuasiRMSSensor
    currentQuasiRMSSensor(m=smee.m) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,30})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource
    voltageSource(
    m=smee.m,
    gamma(fixed=true, start=0),
    f=smee.data.fsNominal,
    V=fill(smee.data.VsNominal, smee.m)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,30})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star(m=smee.m)
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
  Utilities.QsPowerSensor powerSensor(m=smee.m)
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Modelica.Electrical.Analog.Basic.Ground groundE
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Electrical.Analog.Sources.ConstantCurrent excitationCurrent(I=smee.data.IeNominal)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-50,-20})));
  Utilities.Controller controller(reference=smee.data.IsNominal, y0=smee.data.tauNominal)
    annotation (Placement(transformation(extent={{80,-20},{60,0}})));
equation
  when terminal() then
    print("gammar=" + String(to_deg(smee.gammar - pi/2), significantDigits=16) + "deg");
    print("tau   ="+String(multiSensor.tau, significantDigits=9)+"Nm");
    print("pf    ="+String(pf, significantDigits=9));
  end when;
  connect(terminalBox.plug_sn, smee.plug_sn)
    annotation (Line(points={{-26,0},{-26,0}},   color={85,170,255}));
  connect(terminalBox.plug_sp, smee.plug_sp)
    annotation (Line(points={{-14,0},{-14,0}},   color={85,170,255}));
  connect(currentQuasiRMSSensor.plug_n, terminalBox.plugSupply)
    annotation (Line(points={{-20,20},{-20,2}},  color={85,170,255}));
  connect(ground.pin, terminalBox.starpoint) annotation (Line(points={{-80,-20},
          {-70,-20},{-70,2},{-29,2}},   color={85,170,255}));
  connect(torque.flange, multiSensor.flange_b)
    annotation (Line(points={{30,-10},{20,-10}},
                                             color={0,0,0}));
  connect(smee.flange, multiSensor.flange_a)
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
  connect(excitationCurrent.n, smee.pin_ep)
    annotation (Line(points={{-50,-10},{-50,-4},{-30,-4}},
                                                       color={0,0,255}));
  connect(excitationCurrent.p, smee.pin_en) annotation (Line(points={{-50,-30},{
          -30,-30},{-30,-16}},      color={0,0,255}));
  connect(groundE.p, excitationCurrent.p) annotation (Line(points={{-50,-40},{-50,
          -30}},                     color={0,0,255}));
  connect(controller.y, torque.tau)
    annotation (Line(points={{59,-10},{52,-10}}, color={0,0,127}));
  connect(currentQuasiRMSSensor.I, controller.u) annotation (Line(points={{-10,30},
          {90,30},{90,-10},{82,-10}}, color={0,0,127}));
  annotation (experiment(Interval=0.001, Tolerance=1e-06), Documentation(info=
         "<html>
<p>
Nominal operation of quasistatic synchronous machine with electrical excitation based on nominal stator current
</p>
</html>"));
end SMEE_NominalOperation;
