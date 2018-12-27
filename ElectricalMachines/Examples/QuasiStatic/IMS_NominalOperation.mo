within ElectricalMachines.Examples.QuasiStatic;
model IMS_NominalOperation
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  import Modelica.Utilities.Streams.print;
  import Modelica.SIunits.Conversions.to_rpm;
  parameter Modelica.SIunits.Torque tau0=161.401185 "Estimated initial torque";
  Real pf=powerSensor.y.re/powerSensor.abs_y "Power factor";
  .ElectricalMachines.QuasiStatic.FundamentalWave.IM_SlipRing ims(gamma(
        fixed=true), wMechanical(fixed=true, start=ims.data.wNominal))
    annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
    terminalBox(m=ims.m, terminalConnection="Y")
    annotation (Placement(transformation(extent={{-10,-4},{10,16}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentQuasiRMSSensor
    currentQuasiRMSSensor(m=ims.m) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={0,30})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sources.VoltageSource
    voltageSource(
    m=ims.m,
    gamma(fixed=true, start=0),
    f=ims.data.fsNominal,
    V=fill(ims.data.VsNominal, ims.m)) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,30})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star star(m=ims.m)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,0})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground ground
    annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
  Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{70,-20},{50,0}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{20,50},{40,70}})));
  Modelica.Blocks.Sources.Constant const(k=ims.data.IsNominal)
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Blocks.Continuous.Integrator integralController(
    k=1000,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=tau0)
    annotation (Placement(transformation(extent={{50,50},{70,70}})));
  Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
    terminalBox1(m=ims.m, terminalConnection="Y")
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-16,-10})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star starR(m=ims.m)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,-20})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundR
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,30})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor
    powerSensor
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
equation
  when terminal() then
    print("w  ="+String(to_rpm(multiSensor.w), significantDigits=16)+"rpm");
    print("tau="+String(multiSensor.tau, significantDigits=9)+"Nm");
    print("pf ="+String(pf, significantDigits=9));
  end when;
  connect(terminalBox.plug_sn,ims. plug_sn)
    annotation (Line(points={{-6,0},{-6,0}},     color={85,170,255}));
  connect(terminalBox.plug_sp,ims. plug_sp)
    annotation (Line(points={{6,0},{6,0}},       color={85,170,255}));
  connect(currentQuasiRMSSensor.plug_n, terminalBox.plugSupply)
    annotation (Line(points={{0,20},{0,2}},      color={85,170,255}));
  connect(star.pin_n, ground.pin)
    annotation (Line(points={{-80,-10},{-80,-20}}, color={85,170,255}));
  connect(voltageSource.plug_n, star.plug_p)
    annotation (Line(points={{-80,20},{-80,10}}, color={85,170,255}));
  connect(ground.pin, terminalBox.starpoint) annotation (Line(points={{-80,-20},
          {-70,-20},{-70,2},{-9,2}},    color={85,170,255}));
  connect(torque.flange, multiSensor.flange_b)
    annotation (Line(points={{50,-10},{40,-10}},
                                             color={0,0,0}));
  connect(ims.flange, multiSensor.flange_a)
    annotation (Line(points={{10,-10},{20,-10}},
                                             color={0,0,0}));
  connect(currentQuasiRMSSensor.I, feedback.u2)
    annotation (Line(points={{10,30},{30,30},{30,52}},  color={0,0,127}));
  connect(const.y, feedback.u1)
    annotation (Line(points={{11,60},{22,60}},color={0,0,127}));
  connect(feedback.y, integralController.u)
    annotation (Line(points={{39,60},{48,60}}, color={0,0,127}));
  connect(terminalBox1.plug_sp, ims.plug_rp)
    annotation (Line(points={{-10,-4},{-10,-4}},
                                               color={85,170,255}));
  connect(terminalBox1.plug_sn, ims.plug_rn)
    annotation (Line(points={{-10,-16},{-10,-16}},
                                                 color={85,170,255}));
  connect(starR.plug_p, terminalBox1.plugSupply)
    annotation (Line(points={{-30,-10},{-12,-10}},
                                               color={85,170,255}));
  connect(starR.pin_n,groundR. pin)
    annotation (Line(points={{-30,-30},{-30,-40}}, color={85,170,255}));
  connect(groundR.pin, terminalBox1.starpoint) annotation (Line(points={{-30,-40},
          {-12,-40},{-12,-19}},         color={85,170,255}));
  connect(integralController.y, gain.u)
    annotation (Line(points={{71,60},{80,60},{80,42}}, color={0,0,127}));
  connect(gain.y, torque.tau)
    annotation (Line(points={{80,19},{80,-10},{72,-10}},
                                                     color={0,0,127}));
  connect(voltageSource.plug_p, powerSensor.currentP)
    annotation (Line(points={{-80,40},{-60,40}}, color={85,170,255}));
  connect(powerSensor.currentN, currentQuasiRMSSensor.plug_p)
    annotation (Line(points={{-40,40},{0,40}},   color={85,170,255}));
  connect(powerSensor.currentP, powerSensor.voltageP)
    annotation (Line(points={{-60,40},{-60,50},{-50,50}}, color={85,170,255}));
  connect(voltageSource.plug_n, powerSensor.voltageN)
    annotation (Line(points={{-80,20},{-50,20},{-50,30}}, color={85,170,255}));
  annotation (experiment(Interval=0.001, Tolerance=1e-06));
end IMS_NominalOperation;
