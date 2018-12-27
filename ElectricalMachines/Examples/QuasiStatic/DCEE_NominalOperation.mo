within ElectricalMachines.Examples.QuasiStatic;
model DCEE_NominalOperation
  extends Modelica.Icons.Example;
  import Modelica.Utilities.Streams.print;
  import Modelica.SIunits.Conversions.to_rpm;
  parameter Modelica.SIunits.Voltage VeNominal=
    Modelica.Electrical.Machines.Thermal.convertResistance(
    dcee.data.Re, dcee.data.TeRef, dcee.data.alpha20e, dcee.data.TeNominal)*dcee.data.IeNominal
    "Nominal excitation voltage";
  parameter Modelica.SIunits.Torque tau0=
    dcee.data.ViNominal*dcee.data.IaNominal/dcee.data.wNominal
    "Estimated initial torque";
  .ElectricalMachines.QuasiStatic.DCMachines.DC_ElectricalExcited dcee(
      phiMechanical(fixed=true), wMechanical(fixed=true, start=dcee.data.wNominal))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={6,30})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage armatureVoltage(V=dcee.data.VaNominal)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,30})));
  Modelica.Electrical.Analog.Basic.Ground                      ground
    annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
  Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{70,-10},{50,10}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{20,50},{40,70}})));
  Modelica.Blocks.Sources.Constant const(k=dcee.data.IaNominal)
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Blocks.Continuous.Integrator integralController(
    k=1000,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=tau0)
    annotation (Placement(transformation(extent={{50,50},{70,70}})));
  Modelica.Blocks.Math.Gain gain(k=-1) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,30})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage excitationVoltage(V=
        VeNominal) annotation (Placement(transformation(
        extent={{10,10},{-10,-10}},
        rotation=90,
        origin={-30,-10})));
  Modelica.Electrical.Analog.Basic.Ground                      groundE
    annotation (Placement(transformation(extent={{-40,-50},{-20,-30}})));
equation
  when terminal() then
    print("w  ="+String(to_rpm(multiSensor.w), significantDigits=16)+"rpm");
    print("tau="+String(multiSensor.tau, significantDigits=9)+"Nm");
  end when;
  connect(torque.flange, multiSensor.flange_b)
    annotation (Line(points={{50,0},{40,0}}, color={0,0,0}));
  connect(dcee.flange, multiSensor.flange_a)
    annotation (Line(points={{10,0},{20,0}}, color={0,0,0}));
  connect(const.y, feedback.u1)
    annotation (Line(points={{11,60},{22,60}},color={0,0,127}));
  connect(feedback.y, integralController.u)
    annotation (Line(points={{39,60},{48,60}}, color={0,0,127}));
  connect(armatureVoltage.p, currentSensor.p)
    annotation (Line(points={{-80,40},{6,40}},   color={0,0,255}));
  connect(currentSensor.n, dcee.pin_ap)
    annotation (Line(points={{6,20},{6,10}},     color={0,0,255}));
  connect(armatureVoltage.n, ground.p)
    annotation (Line(points={{-80,20},{-80,-20}}, color={0,0,255}));
  connect(currentSensor.i, feedback.u2)
    annotation (Line(points={{16,30},{30,30},{30,52}}, color={0,0,127}));
  connect(integralController.y, gain.u)
    annotation (Line(points={{71,60},{80,60},{80,42}}, color={0,0,127}));
  connect(gain.y, torque.tau)
    annotation (Line(points={{80,19},{80,0},{72,0}}, color={0,0,127}));
  connect(armatureVoltage.n, dcee.pin_an)
    annotation (Line(points={{-80,20},{-6,20},{-6,10}}, color={0,0,255}));
  connect(excitationVoltage.p, dcee.pin_ep)
    annotation (Line(points={{-30,0},{-30,6},{-10,6}}, color={0,0,255}));
  connect(excitationVoltage.n, groundE.p)
    annotation (Line(points={{-30,-20},{-30,-30}},           color={0,0,255}));
  connect(excitationVoltage.n, dcee.pin_en)
    annotation (Line(points={{-30,-20},{-10,-20},{-10,-6}}, color={0,0,255}));
  annotation (experiment(Interval=0.001, Tolerance=1e-06));
end DCEE_NominalOperation;
