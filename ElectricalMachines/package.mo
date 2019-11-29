within ;
package ElectricalMachines "Electrical machine models with Parameter records"
  extends Modelica.Icons.Package;

  annotation (version="0.9.1", versionDate="2019-11-29", uses(Modelica(version="3.2.3")),
    Icon(graphics={
        Rectangle(
          origin={2.835,10},
          fillColor={0,128,255},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-60,-60},{60,60}}),
        Rectangle(
          origin={2.835,10},
          fillColor={128,128,128},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-80,-60},{-60,60}}),
        Rectangle(
          origin={2.835,10},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid,
          extent={{-60,50},{20,70}}),
        Rectangle(
          origin={2.835,10},
          fillColor={95,95,95},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{60,-10},{80,10}}),
        Polygon(
          origin={2.835,10},
          fillPattern=FillPattern.Solid,
          points={{-70,-90},{-60,-90},{-30,-20},{20,-20},{50,-90},{60,-90},{60,
              -100},{-70,-100},{-70,-90}})}),
    Documentation(info="<html>
<h4>Modelica library of machine models with parameter records.</h4>
<p>Have you ever been bored by propagating all the parameters for a new type of a machine used in your models? 
Here's the solution:
<ul>
<li>Build your own database of different machine parameters by extending from ElectricalMachines.ParameterRecords</li>
<li>Use the machine models from this library: they're extending from the machine models of the Modelica Standard Library</li>
<li>Propagate all necessary parameters with just one parameter record!</li>
<li>Change operational parameters in the machine model, if desired.</li>
</ul>
</p>
<h4>Note:</h4>
<p>
The parameter records ElectricalMachines.ParameterRecords extend from Modelica.Electrical.Machines.Utilities.ParameterRecords. 
They are intended to replace the parameter records in the Modelica Standard Library in the future.
</p>
<h4>License</h4>
<p>BSD-3</p>
<h4>Contact</h4>
<p>e-mail: a.haumer(at)edrives.eu</p>
</html>"));
end ElectricalMachines;
