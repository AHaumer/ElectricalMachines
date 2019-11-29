within ElectricalMachines.Examples.DoublyFedInductionMachine.Utilities.QuasiStatic;
model Analyzer "Power sensor"
  extends Modelica.Icons.RotationalSensor;
  parameter Integer m(min=1) = 3 "number of phases";
  Modelica.SIunits.AngularVelocity omega=der(currentP.reference.gamma);
  Modelica.Blocks.Interfaces.RealOutput P(final quantity="Power", final unit="W")
                annotation (Placement(transformation(
        origin={-50,110},
        extent={{10,-10},{-10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealOutput Q(final quantity="Power", final unit="var")
                  annotation (Placement(transformation(
        origin={50,110},
        extent={{10,-10},{-10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealOutput vRMS(final quantity="Voltage", final
      unit="V") annotation (Placement(transformation(
        origin={-110,60},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput iRMS(final quantity="Current", final
      unit="A") annotation (Placement(transformation(
        origin={110,60},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug currentP(final m=m)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug currentN(final m=m)
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug voltageN(final m=m)
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_p plugToPinsCurrentP(final m=m)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_n plugToPinsCurrentN(final m=m)
    annotation (Placement(transformation(extent={{80,-10},{60,10}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.PlugToPins_n plugToPinsVoltageN(final m=m)
    annotation (Placement(transformation(
        origin={0,-70},
        extent={{-10,10},{10,-10}},
        rotation=90)));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor powerSensor[m]
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.ComplexBlocks.ComplexMath.Sum sumS(final nin=m) annotation (
      Placement(transformation(
        origin={0,40},
        extent={{-10,-10},{10,10}},
        rotation=90)));
  Modelica.ComplexBlocks.ComplexMath.ComplexToReal complexToReal annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,70})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.CurrentSensor
    currentSensor[m]
    annotation (Placement(transformation(extent={{40,10},{60,-10}})));
  Modelica.ComplexBlocks.ComplexMath.ComplexToPolar complexToPolarI[m]
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,30})));
  Modelica.Blocks.Math.Sum sumI(nin=m, k=fill(1/m, m))
    annotation (Placement(transformation(extent={{70,50},{90,70}})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.VoltageSensor
    voltageSensor[m] annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-30,-30})));
  Modelica.ComplexBlocks.ComplexMath.ComplexToPolar complexToPolarV[m]
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-50,30})));
  Modelica.Blocks.Math.Sum sumV(nin=m, k=fill(1/m, m))
    annotation (Placement(transformation(extent={{-70,50},{-90,70}})));

  Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.FrequencySensor
    frequencySensor annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-68,-30})));
  Modelica.Blocks.Interfaces.RealOutput f(final quantity="Frequency", final
      unit="Hz") annotation (Placement(transformation(
        origin={-110,-60},
        extent={{10,-10},{-10,10}},
        rotation=0)));
equation
  connect(plugToPinsCurrentP.plug_p, currentP) annotation (Line(points={{-72,
          0},{-79,0},{-86,0},{-100,0}}, color={85,170,255}));
  connect(currentN, plugToPinsCurrentN.plug_n) annotation (Line(points={{
          100,0},{93,0},{86,0},{72,0}}, color={85,170,255}));
  connect(plugToPinsVoltageN.plug_n, voltageN) annotation (Line(points={{0,
          -72},{0,-72},{0,-100}}, color={85,170,255}));
  connect(plugToPinsCurrentP.pin_p, powerSensor.currentP) annotation (Line(
        points={{-68,0},{-53.5,0},{-53.5,0},{-39,0},{-39,0},{-10,0}}, color=
         {85,170,255}));
  connect(powerSensor.voltageN, plugToPinsVoltageN.pin_n) annotation (Line(
        points={{0,-10},{0,-10},{0,-68},{0,-68}}, color={85,170,255}));
  connect(powerSensor.currentP, powerSensor.voltageP)
    annotation (Line(points={{-10,0},{-10,10},{0,10}}, color={85,170,255}));
  connect(powerSensor.y, sumS.u) annotation (Line(points={{-8,-11},{-8,-22},{-20,
          -22},{-20,20},{0,20},{0,28}}, color={85,170,255}));
  connect(powerSensor.currentN, currentSensor.pin_p)
    annotation (Line(points={{10,0},{40,0}}, color={85,170,255}));
  connect(currentSensor.pin_n, plugToPinsCurrentN.pin_n)
    annotation (Line(points={{60,0},{68,0}}, color={85,170,255}));
  connect(complexToPolarI.len, sumI.u)
    annotation (Line(points={{44,42},{44,60},{68,60}}, color={0,0,127}));
  connect(sumI.y, iRMS)
    annotation (Line(points={{91,60},{110,60}}, color={0,0,127}));
  connect(plugToPinsVoltageN.pin_n, voltageSensor.pin_n) annotation (Line(
        points={{0,-68},{-30,-68},{-30,-40}}, color={85,170,255}));
  connect(plugToPinsCurrentP.pin_p, voltageSensor.pin_p)
    annotation (Line(points={{-68,0},{-30,0},{-30,-20}}, color={85,170,255}));
  connect(vRMS, sumV.y)
    annotation (Line(points={{-110,60},{-91,60}}, color={0,0,127}));
  connect(voltageSensor.y, complexToPolarV.u) annotation (Line(points={{-41,-30},
          {-50,-30},{-50,18}}, color={85,170,255}));
  connect(complexToPolarV.len, sumV.u) annotation (Line(points={{-44,42},{-44,60},
          {-68,60},{-68,60}}, color={0,0,127}));
  connect(complexToPolarI.u, currentSensor.y)
    annotation (Line(points={{50,18},{50,11}}, color={85,170,255}));
  connect(complexToReal.u, sumS.y)
    annotation (Line(points={{0,58},{0,51}}, color={85,170,255}));
  connect(complexToReal.re, P) annotation (Line(points={{-6,82},{-6,90},{-50,90},
          {-50,110}}, color={0,0,127}));
  connect(complexToReal.im, Q) annotation (Line(points={{6,82},{6,90},{50,90},{50,
          110}}, color={0,0,127}));
  connect(plugToPinsCurrentP.pin_p[1], frequencySensor.pin) annotation (Line(
        points={{-68,0},{-68,-20},{-68,-20}}, color={85,170,255}));
  connect(frequencySensor.y, f) annotation (Line(points={{-68,-41},{-68,-60},{
          -110,-60}}, color={0,0,127}));
  annotation (
    Documentation(info="<html>

<p>
This sensor can be used to measure <i>m</i> complex apparent power values, using <i>m</i>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor\">single phase PowerSensors</a>.
</p>

<h4>See also</h4>

<p>
<a href=\"modelica://Modelica.Electrical.QuasiStationary.SinglePhase.Sensors.PowerSensor\">SinglePhase.PowerSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.PotentialSensor\">PotentialSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.VoltageSensor\">VoltageSensor</a>,
<a href=\"modelica://Modelica.Electrical.QuasiStationary.MultiPhase.Sensors.CurrentSensor\">CurrentSensor</a>
</p>

</html>"));
end Analyzer;
