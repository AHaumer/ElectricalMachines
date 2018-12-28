within ElectricalMachines.Transient;
package FundamentalWave "Transient AC machines based on the Fundamental Wave of rotating magnetic field"
  extends Modelica.Icons.Package;

  annotation (Icon(graphics={
        Rectangle(
          extent={{-60,70},{-80,-50}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={128,128,128}),
        Rectangle(
          extent={{-60,70},{60,-50}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={255,128,0}),
        Rectangle(
          extent={{-60,80},{20,60}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{60,20},{80,0}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={95,95,95}),
        Polygon(
          points={{-70,-80},{-60,-80},{-30,-10},{20,-10},{50,-80},{60,-80},
              {60,-90},{-70,-90},{-70,-80}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
Transient ac machine models with rotating magnetic field based on FundamentalWave models with parameter records
</p>
</html>"));
end FundamentalWave;
