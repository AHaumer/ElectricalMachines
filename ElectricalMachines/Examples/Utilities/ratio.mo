within ElectricalMachines.Examples.Utilities;
function ratio "ratio with protection against division by zero"
  extends Modelica.Icons.Function;
  input Real u1 "Nominator";
  input Real u2 "Denominator";
  output Real y "Ratio";
algorithm
  y:=if noEvent(abs(u2)>Modelica.Constants.eps) then u1/u2 else 0;
  annotation (Inline=true, Documentation(info="<html>
<p>
Calculates nominator/denominator with protection against division by zero.
</p>
</html>"));
end ratio;
