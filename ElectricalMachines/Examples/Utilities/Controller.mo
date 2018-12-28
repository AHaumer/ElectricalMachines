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
end Controller;
