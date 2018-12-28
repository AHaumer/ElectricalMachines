within ElectricalMachines.Examples.Utilities;
block Controller "Universal controller for iteration"
  extends Modelica.Blocks.Interfaces.SISO;
  parameter Real reference "Constant reference value";
  parameter Modelica.SIunits.Time Ti=1e-3 "Integral time constant";
  parameter Real y0 "Initial controller output";
  parameter Boolean invert=true "Invert controller output?";
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Modelica.Blocks.Continuous.Integrator integralController(
    k=1/Ti,
    initType=Modelica.Blocks.Types.Init.InitialOutput,
    y_start=y0)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Modelica.Blocks.Math.Gain gain(k=if invert then -1 else 1)
                                       annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,0})));
  Modelica.Blocks.Sources.Constant const(k=reference)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(const.y, feedback.u1)
    annotation (Line(points={{-39,0},{-18,0}}, color={0,0,127}));
  connect(feedback.y, integralController.u)
    annotation (Line(points={{-1,0},{18,0}}, color={0,0,127}));
  connect(integralController.y, gain.u)
    annotation (Line(points={{41,0},{58,0}}, color={0,0,127}));
  connect(gain.y, y)
    annotation (Line(points={{81,0},{110,0}}, color={0,0,127}));
  connect(u, feedback.u2) annotation (Line(points={{-120,0},{-80,0},{-80,-20},{-10,
          -20},{-10,-8}}, color={0,0,127}));
  annotation (Icon(graphics={
        Polygon(
          points={{-4,-36},{74,20},{74,-2},{-4,-58},{-4,-36}},
          lineColor={95,95,95},
          fillColor={175,175,175},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{8,-34},{28,-44},{20,-50},{0,-40},{8,-34}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{20,-50},{28,-44},{32,-52},{24,-58},{20,-50}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{24,-58},{32,-52},{32,-74},{24,-80},{24,-58}},
          lineColor={0,0,255},
          fillColor={255,255,127},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{0,-40},{20,-50},{24,-58},{24,-80},{22,-80},{22,-58},{20,-54},
              {0,-44},{0,-40}},
          lineColor={0,0,255},
          fillColor={191,191,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-14,44},{-18,36},{-10,42},{-8,48},{-14,44}},
          lineColor={128,128,128},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-18,36},{-10,42},{-10,18},{-18,12},{-18,36}},
          lineColor={0,0,255},
          fillColor={255,255,127},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-20,14},{-20,36},{-16,44},{4,34},{4,30},{-16,40},{-18,36},
              {-18,12},{-20,14}},
          lineColor={0,0,255},
          fillColor={191,191,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-8,50},{12,40},{4,34},{-16,44},{-8,50}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{28,-18},{48,-28},{40,-34},{20,-24},{28,-18}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{40,-34},{48,-28},{52,-36},{44,-42},{40,-34}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{44,-42},{52,-36},{52,-58},{44,-64},{44,-42}},
          lineColor={0,0,255},
          fillColor={255,255,127},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{20,-24},{40,-34},{44,-42},{44,-64},{42,-64},{42,-42},{40,-38},
              {20,-28},{20,-24}},
          lineColor={0,0,255},
          fillColor={191,191,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{48,-4},{68,-14},{60,-20},{40,-10},{48,-4}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{60,-20},{68,-14},{72,-22},{64,-28},{60,-20}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{64,-28},{72,-22},{72,-44},{64,-50},{64,-28}},
          lineColor={0,0,255},
          fillColor={255,255,127},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{40,-10},{60,-20},{64,-28},{64,-50},{62,-50},{62,-28},{60,-24},
              {40,-14},{40,-10}},
          lineColor={0,0,255},
          fillColor={191,191,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{68,10},{88,0},{80,-6},{60,4},{68,10}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{80,-6},{88,0},{92,-8},{84,-14},{80,-6}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{84,-14},{92,-8},{92,-30},{84,-36},{84,-14}},
          lineColor={0,0,255},
          fillColor={255,255,127},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{60,4},{80,-6},{84,-14},{84,-36},{82,-36},{82,-14},{80,-10},
              {60,0},{60,4}},
          lineColor={0,0,255},
          fillColor={191,191,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-34,30},{-38,22},{-30,28},{-28,34},{-34,30}},
          lineColor={128,128,128},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-38,22},{-30,28},{-30,4},{-38,-2},{-38,22}},
          lineColor={0,0,255},
          fillColor={255,255,127},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-40,0},{-40,22},{-36,30},{-16,20},{-16,16},{-36,26},{-38,
              22},{-38,-2},{-40,0}},
          lineColor={0,0,255},
          fillColor={191,191,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-28,36},{-8,26},{-16,20},{-36,30},{-28,36}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-54,16},{-58,8},{-50,14},{-48,20},{-54,16}},
          lineColor={128,128,128},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-58,8},{-50,14},{-50,-10},{-58,-16},{-58,8}},
          lineColor={0,0,255},
          fillColor={255,255,127},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-60,-14},{-60,8},{-56,16},{-36,6},{-36,2},{-56,12},{-58,8},
              {-58,-16},{-60,-14}},
          lineColor={0,0,255},
          fillColor={191,191,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-48,22},{-28,12},{-36,6},{-56,16},{-48,22}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-74,0},{-78,-8},{-70,-2},{-68,4},{-74,0}},
          lineColor={128,128,128},
          fillColor={128,128,128},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-78,-8},{-70,-2},{-70,-26},{-78,-32},{-78,-8}},
          lineColor={0,0,255},
          fillColor={255,255,127},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-80,-30},{-80,-8},{-76,0},{-56,-10},{-56,-14},{-76,-4},{-78,
              -8},{-78,-32},{-80,-30}},
          lineColor={0,0,255},
          fillColor={191,191,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-68,6},{-48,-4},{-56,-10},{-76,0},{-68,6}},
          lineColor={0,0,255},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-64,-4},{-4,-36},{-4,-58},{-64,-26},{-64,-4}},
          lineColor={95,95,95},
          fillColor={75,75,75},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-64,-4},{-4,-36},{74,20},{14,52},{-64,-4}},
          lineColor={95,95,95},
          fillColor={160,160,164},
          fillPattern=FillPattern.Solid)}));
end Controller;
