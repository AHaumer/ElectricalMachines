within ElectricalMachines.Examples.Validation;
model IMC_NominalOperation
  "Validate nominal operation of induction machine with suirrel cage"
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  import Modelica.Utilities.Streams.print;
  import Modelica.SIunits.Conversions.to_rpm;
  Real pf=Utilities.ratio(powerSensor.P, powerSensor.S) "Power factor";
  ElectricalMachines.QuasiStatic.FundamentalWave.IM_SquirrelCage imc(
    data=data, gamma(fixed=true), wMechanical(fixed=true, start=imc.data.wNominal))
    annotation (Placement(transformation(extent={{-30,-20},{-10,0}})));
  Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
    terminalBox(m=imc.m, terminalConnection="Y")
    annotation (Placement(transformation(extent={{-30,-4},{-10,16}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentQuasiRMSSensor
    currentQuasiRMSSensor(m=imc.m) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-20,30})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource
    voltageSource(
    m=imc.m,
    gamma(fixed=true, start=0),
    f=imc.data.fsNominal,
    V=fill(imc.data.VsNominal, imc.m)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,30})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star(m=imc.m)
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
  Utilities.QsPowerSensor powerSensor(m=imc.m)
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  Utilities.Controller controller(reference=7500, y0=imc.data.tauNominal)
    annotation (Placement(transformation(extent={{80,-20},{60,0}})));
  parameter ParameterRecords.IMCdata.Imc132M04 data
    annotation (Placement(transformation(extent={{-30,-50},{-10,-30}})));
equation
  when terminal() then
    print("w  ="+String(to_rpm(multiSensor.w))+"rpm");
    print("tau="+String(multiSensor.tau)+"Nm");
    print("pf ="+String(pf));
    print("Is ="+String(currentQuasiRMSSensor.I));
    print("PlossCopper1 ="+String(imc.powerBalance.lossPowerStatorWinding));
    print("PlossCopper2 ="+String(imc.powerBalance.lossPowerRotorWinding));
    print("PlossStrayLd ="+String(imc.powerBalance.lossPowerStrayLoad));
    print("PlossCore    ="+String(imc.powerBalance.lossPowerStatorCore));
    print("PlossFriction="+String(imc.powerBalance.lossPowerFriction));
    print("PlossTotal   ="+String(imc.powerBalance.lossPowerTotal));
  end when;
  connect(terminalBox.plug_sn, imc.plug_sn)
    annotation (Line(points={{-26,0},{-26,0}},   color={85,170,255}));
  connect(terminalBox.plug_sp, imc.plug_sp)
    annotation (Line(points={{-14,0},{-14,0}},   color={85,170,255}));
  connect(currentQuasiRMSSensor.plug_n, terminalBox.plugSupply)
    annotation (Line(points={{-20,20},{-20,2}},  color={85,170,255}));
  connect(ground.pin, terminalBox.starpoint) annotation (Line(points={{-80,-20},
          {-70,-20},{-70,2},{-29,2}},   color={85,170,255}));
  connect(torque.flange, multiSensor.flange_b)
    annotation (Line(points={{30,-10},{20,-10}},
                                             color={0,0,0}));
  connect(imc.flange, multiSensor.flange_a)
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
  connect(multiSensor.power, controller.u) annotation (Line(points={{4,-21},{4,-30},
          {90,-30},{90,-10},{82,-10}}, color={0,0,127}));
  annotation (experiment(Interval=0.001, Tolerance=1e-06), Documentation(info=
       "<html>
<p>
Nominal operation of quasistatic induction machine with squirrel cage based on nominal mechanical output
</p>
</html>"));
end IMC_NominalOperation;
