within ElectricalMachines.Examples.QuasiStatic;
model DCPM_NominalOperation
  extends Modelica.Icons.Example;
  import Modelica.Utilities.Streams.print;
  import Modelica.SIunits.Conversions.to_rpm;
  parameter Modelica.SIunits.Torque tau0=
    dcpm.data.ViNominal*dcpm.data.IaNominal/dcpm.data.wNominal
    "Estimated initial torque";
  .ElectricalMachines.QuasiStatic.DCMachines.DC_PermanentMagnet dcpm(
      phiMechanical(fixed=true), wMechanical(fixed=true, start=dcpm.data.wNominal))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={6,30})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage armatureVoltage(V=dcpm.data.VaNominal)
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
  Modelica.Blocks.Sources.Constant const(k=dcpm.data.IaNominal)
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
equation
  when terminal() then
    print("w  ="+String(to_rpm(multiSensor.w), significantDigits=16)+"rpm");
    print("tau="+String(multiSensor.tau, significantDigits=9)+"Nm");
  end when;
  connect(torque.flange, multiSensor.flange_b)
    annotation (Line(points={{50,0},{40,0}}, color={0,0,0}));
  connect(dcpm.flange, multiSensor.flange_a)
    annotation (Line(points={{10,0},{20,0}}, color={0,0,0}));
  connect(const.y, feedback.u1)
    annotation (Line(points={{11,60},{22,60}},color={0,0,127}));
  connect(feedback.y, integralController.u)
    annotation (Line(points={{39,60},{48,60}}, color={0,0,127}));
  connect(armatureVoltage.p, currentSensor.p)
    annotation (Line(points={{-80,40},{6,40}},   color={0,0,255}));
  connect(currentSensor.n, dcpm.pin_ap)
    annotation (Line(points={{6,20},{6,10}},     color={0,0,255}));
  connect(armatureVoltage.n, ground.p)
    annotation (Line(points={{-80,20},{-80,-20}}, color={0,0,255}));
  connect(currentSensor.i, feedback.u2)
    annotation (Line(points={{16,30},{30,30},{30,52}}, color={0,0,127}));
  connect(armatureVoltage.n, dcpm.pin_an)
    annotation (Line(points={{-80,20},{-6,20},{-6,10}},   color={0,0,255}));
  connect(integralController.y, gain.u)
    annotation (Line(points={{71,60},{80,60},{80,42}}, color={0,0,127}));
  connect(gain.y, torque.tau)
    annotation (Line(points={{80,19},{80,0},{72,0}}, color={0,0,127}));
  annotation (experiment(Interval=0.001, Tolerance=1e-06));
end DCPM_NominalOperation;
