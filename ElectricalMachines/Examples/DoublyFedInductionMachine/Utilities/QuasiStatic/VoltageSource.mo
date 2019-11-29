within ElectricalMachines.Examples.DoublyFedInductionMachine.Utilities.QuasiStatic;
model VoltageSource "Constant multiphase AC voltage"
  import Modelica.Constants.pi;
  import Modelica.ComplexMath.j;
  import Modelica.ComplexMath.exp;
  parameter Integer m(min=1) = 3 "Number of phases";
  parameter Boolean useVoltageInput=false
    "Enable / disable voltage input"
    annotation(Evaluate=true);
  parameter Modelica.SIunits.Voltage V(start=1)
    "RMS of cosine waves"
    annotation(Dialog(enable=not useVoltageInput));
  parameter Modelica.SIunits.Frequency f(start=1) "Frequency of the source";
  parameter Modelica.SIunits.Angle phi[m]=-
    Modelica.Electrical.MultiPhase.Functions.symmetricOrientation(m)
    "Phase shift of the source";
  parameter Boolean makeRoot=true
    "Make source a root"
    annotation(Evaluate=true);
  Modelica.Blocks.Interfaces.RealInput vRMS=internalVRMS if useVoltageInput
    annotation (Placement(transformation(
        origin={0,100},
        extent={{-10,-10},{10,10}},
        rotation=270)));
  Modelica.SIunits.ComplexVoltage v[m] "Complex voltage";
  Modelica.SIunits.Voltage abs_v[m]=Modelica.ComplexMath.'abs'(v)
    "Magnitude of complex voltage";
  Modelica.SIunits.Angle arg_v[m]=Modelica.ComplexMath.arg(v)
    "Argument of complex voltage";
  Modelica.SIunits.ComplexCurrent i[m] "Complex current";
  Modelica.SIunits.Current abs_i[m]=Modelica.ComplexMath.'abs'(i)
    "Magnitude of complex current";
  Modelica.SIunits.Angle arg_i[m]=Modelica.ComplexMath.arg(i)
    "Argument of complex current";
  Modelica.SIunits.ActivePower P[m]={Modelica.ComplexMath.real(v[k]*
      Modelica.ComplexMath.conj(i[k])) for k in 1:m} "Active power";
  Modelica.SIunits.ActivePower P_total=sum(P) "Total active power";
  Modelica.SIunits.ReactivePower Q[m]={Modelica.ComplexMath.imag(v[k]*
      Modelica.ComplexMath.conj(i[k])) for k in 1:m} "Reactive power";
  Modelica.SIunits.ReactivePower Q_total=sum(Q) "Total reactive power";
  Modelica.SIunits.ApparentPower S[m]={Modelica.ComplexMath.'abs'(v[k]*
      Modelica.ComplexMath.conj(i[k])) for k in 1:m}
    "Magnitude of complex apparent power";
  Modelica.SIunits.ApparentPower S_total=sqrt(P_total^2 + Q_total^2)
    "Magnitude of total complex apparent power";
  Real pf[m]={cos(Modelica.ComplexMath.arg(Complex(P[k], Q[k]))) for k in 1
      :m} "Power factor";
  Modelica.SIunits.AngularVelocity omega
    "Angular velocity of reference frame";
  Modelica.SIunits.Angle gamma(start=0);
  Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.PositivePlug plug_p(final m=m)
    "Positive quasi stationary multi phase plug" annotation (Placement(
        transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Interfaces.NegativePlug plug_n(final m=m)
    "Negative quasi stationary multi phase plug" annotation (Placement(
        transformation(extent={{90,-10},{110,10}})));
protected
  Modelica.SIunits.Voltage internalVRMS;
equation
  Connections.branch(plug_p.reference, plug_n.reference);
  plug_p.reference.gamma = plug_n.reference.gamma;
  Connections.root(plug_p.reference);
  gamma = plug_p.reference.gamma;
  omega = der(gamma);
  v = plug_p.pin.v - plug_n.pin.v;
  i = plug_p.pin.i;
  plug_p.pin.i + plug_n.pin.i = fill(Complex(0), m);
  omega = 2*Modelica.Constants.pi*f;
  if not useVoltageInput then
    internalVRMS = V;
  end if;
  v = {internalVRMS*exp(j*phi[k]) for k in 1:m};
  annotation (
    Icon(graphics={Line(points={{50,0},{-50,0}}),Text(
              extent={{-120,50},{-20,0}},
              lineColor={0,0,255},
              textString="+"),Text(
              extent={{20,50},{120,0}},
              lineColor={0,0,255},
              textString="-"),
                   Ellipse(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
                                   Line(points={{-90,0},{-50,0}}, color={0,
          0,0}),Line(points={{50,0},{90,0}}),Text(
              extent={{100,-100},{-100,-60}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              textString="m=%m"),            Text(
              extent={{100,60},{-100,100}},
              textString="%name",
              lineColor={0,0,255})}),
    Documentation(info="<html>
<p>
connect(A,B);<br>
Defines breakable branches from the overdetermined type or record instances in connector instance A to the corresponding overdetermined type or record instances in connector instance B for a virtual connection graph.
</p>
<p>
Connections.branch(A.R,B.R);<br>
Defines a non-breakable branch from the overdetermined type or record instance R in connector instance A to the corresponding overdetermined type or record instance R in connector instance B for a virtual connection graph. This function can be used at all places where a connect(..) statement is allowed.
</p>
<p>
Connections.root(A.R);<br>
The overdetermined type or record instance R in connector instance A is a (definite) root node in a virtual connection graph.
</p>
<p>
Connections.potentialRoot(A.R);<br>
The overdetermined type or record instance R in connector instance A is a potential root node in a virtual connection graph.
</p>
</html>"));
end VoltageSource;
