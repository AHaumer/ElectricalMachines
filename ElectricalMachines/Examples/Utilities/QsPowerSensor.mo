within ElectricalMachines.Examples.Utilities;
model QsPowerSensor "Power sensor"
  extends Modelica.Icons.RotationalSensor;
  parameter Integer m(min=1) = 3 "number of phases";
  Modelica.SIunits.AngularVelocity omega=der(currentP.reference.gamma);
  Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug currentP(final m=m)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug currentN(final m=m)
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug voltageP(final m=m)
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug voltageN(final m=m)
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));

  Modelica.SIunits.ApparentPower S=Modelica.ComplexMath.'abs'(powerSensor.y)
    "Magnitude of complex apparent power";
  Modelica.SIunits.Angle arg=Modelica.ComplexMath.arg(powerSensor.y)
    "Argument of complex apparent power";

  Modelica.Blocks.Interfaces.RealOutput P annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,-110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,-110})));
  Modelica.Blocks.Interfaces.RealOutput Q annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-110}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-110})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PowerSensor
    powerSensor(final m=m)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.ComplexBlocks.ComplexMath.ComplexToReal complexToReal annotation (
      Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-20,-50})));
equation
  connect(currentP, powerSensor.currentP)
    annotation (Line(points={{-100,0},{-10,0}}, color={85,170,255}));
  connect(powerSensor.voltageP, voltageP)
    annotation (Line(points={{0,10},{0,100}}, color={85,170,255}));
  connect(powerSensor.currentN, currentN)
    annotation (Line(points={{10,0},{100,0}}, color={85,170,255}));
  connect(powerSensor.voltageN, voltageN)
    annotation (Line(points={{0,-10},{0,-100}}, color={85,170,255}));
  connect(powerSensor.y, complexToReal.u) annotation (Line(points={{-8,-11},{-8,
          -20},{-20,-20},{-20,-38}}, color={85,170,255}));
  connect(complexToReal.re, P) annotation (Line(points={{-26,-62},{-26,-80},{-80,
          -80},{-80,-110}}, color={0,0,127}));
  connect(complexToReal.im, Q) annotation (Line(points={{-14,-62},{-14,-80},{80,
          -80},{80,-110}}, color={0,0,127}));
  annotation (
    Icon(graphics={
        Line(points={{0,100},{0,70}}, color={0,0,255}),
        Line(points={{0,-70},{0,-100}}, color={0,0,255}),
        Text(
          textColor={0,0,255},
          extent={{-100,110},{100,150}},
          textString="%name"),
        Line(points={{-100,0},{100,0}}, color={0,0,255}),
        Line(points={{-100,0},{-5.43854e-32,4.4409e-16}},
                                        color={0,0,255},
          origin={-80,0},
          rotation=90),
        Line(points={{-100,0},{-5.43854e-32,4.4409e-16}},
                                        color={0,0,255},
          origin={80,0},
          rotation=90),
        Text(
          extent={{-80,-60},{-40,-100}},
          lineColor={28,108,200},
          textString="P"),
        Text(
          extent={{40,-60},{80,-100}},
          lineColor={28,108,200},
          textString="Q")}),
    Documentation(info="<html>
<p>
This sensor can be used to measure complex apparent power values
</p>
</html>"));
end QsPowerSensor;
