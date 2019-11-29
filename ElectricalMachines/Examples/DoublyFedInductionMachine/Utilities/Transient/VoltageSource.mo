within ElectricalMachines.Examples.DoublyFedInductionMachine.Utilities.Transient;
model VoltageSource "Multiphase cosine voltage source"
  extends Modelica.Electrical.MultiPhase.Interfaces.OnePort;
  import Modelica.Constants.pi;
  parameter Boolean useVoltageInput=false
    "Enable / disable voltage input"
    annotation(Evaluate=true);
  parameter Modelica.SIunits.Voltage V(start=1)
    "RMS of cosine waves"
    annotation(Dialog(enable=not useVoltageInput));
  parameter Modelica.SIunits.Frequency f(start=1)
    "Frequency of cosine waves";
  parameter Modelica.SIunits.Angle phase[m]=-
      Modelica.Electrical.MultiPhase.Functions.symmetricOrientation(m)
    "Phases of cosine waves";
  parameter Modelica.SIunits.Voltage offset=0 "Voltage offset";
  parameter Modelica.SIunits.Time startTime=0 "Time offset";
 Modelica.Blocks.Interfaces.RealInput vRMS=internalVRMS if useVoltageInput
    annotation (Placement(transformation(
        origin={0,100},
        extent={{-10,-10},{10,10}},
        rotation=270)));
protected
  Modelica.SIunits.Voltage internalVRMS;
equation
  if not useVoltageInput then
    internalVRMS = V;
  end if;
  v = {offset + (if time < startTime then 0 else sqrt(2)*internalVRMS*
       cos(2*pi*f*(time - startTime) + phase[k])) for k in 1:m};
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Line(points={{-90,0},{-50,0}},
          color={0,0,255}),Line(points={{50,0},{90,0}}, color={0,0,255}),
          Ellipse(
              extent={{-50,50},{50,-50}},
              lineColor={0,0,255},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),Line(points={{-50,0},{50,0}},
          color={0,0,255}),Text(
              extent={{-100,-100},{100,-60}},
              textString="%name",
              lineColor={0,0,255}),Text(
              extent={{-100,100},{100,60}},
              lineColor={0,0,0},
              textString="m=%m"),Text(
              extent={{30,60},{110,0}},
              lineColor={0,0,255},
              textString="-"),Text(
              extent={{-110,60},{-30,0}},
              lineColor={0,0,255},
              textString="+"),Line(
              points={{-71,70},{-68.4,69.8},{-63.5,67},{-58.6,61},{-53.6,52},
            {-48,38.6},{-40.98,18.6},{-26.21,-26.9},{-19.9,-44},{-14.2,-56.2},
            {-9.3,-64},{-4.4,-68.6},{0.5,-70},{5.5,-67.9},{10.4,-62.5},{
            15.3,-54.1},{20.9,-41.3},{28,-21.7},{35,0}},
              color={192,192,192},
              smooth=Smooth.Bezier),Line(points={{35,0},{44.8,29.9},{51.2,
          46.5},{56.8,58.1},{61.7,65.2},{66.7,69.2},{71.6,69.8}}, color={
          192,192,192})}), Documentation(info="<html>
<p>
Contains m cosine voltage sources (Modelica.Electrical.Analog.Sources.CosineVoltage)
with a default phase shift determined by
<a href=\"modelica://Modelica.Electrical.MultiPhase.Functions.symmetricOrientation\">symmetricOrientation</a>.
</p>
</html>"));
end VoltageSource;
