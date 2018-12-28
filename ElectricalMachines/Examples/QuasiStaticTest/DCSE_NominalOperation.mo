within ElectricalMachines.Examples.QuasiStaticTest;
model DCSE_NominalOperation "Nominal operation of dc machine with series excitation"
  extends Modelica.Icons.Example;
  import Modelica.Utilities.Streams.print;
  import Modelica.SIunits.Conversions.to_rpm;
  .ElectricalMachines.QuasiStatic.DCMachines.DC_SeriesExcited dcse(
      phiMechanical(fixed=true), wMechanical(fixed=true, start=dcse.data.wNominal))
    annotation (Placement(transformation(extent={{-30,-20},{-10,0}})));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-14,30})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage armatureVoltage(V=dcse.data.VaNominal)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-80,30})));
  Modelica.Electrical.Analog.Basic.Ground                      ground
    annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
  Modelica.Mechanics.Rotational.Sensors.MultiSensor multiSensor
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Modelica.Mechanics.Rotational.Sources.Torque torque
    annotation (Placement(transformation(extent={{50,-20},{30,0}})));
  Utilities.Controller controller(reference=dcse.data.IaNominal, y0=dcse.data.tauNominal)
    annotation (Placement(transformation(extent={{82,-20},{62,0}})));
equation
  when terminal() then
    print("w  ="+String(to_rpm(multiSensor.w), significantDigits=16)+"rpm");
    print("tau="+String(multiSensor.tau, significantDigits=9)+"Nm");
  end when;
  connect(torque.flange, multiSensor.flange_b)
    annotation (Line(points={{30,-10},{20,-10}},
                                             color={0,0,0}));
  connect(dcse.flange, multiSensor.flange_a)
    annotation (Line(points={{-10,-10},{0,-10}},
                                             color={0,0,0}));
  connect(armatureVoltage.p, currentSensor.p)
    annotation (Line(points={{-80,40},{-14,40}}, color={0,0,255}));
  connect(currentSensor.n, dcse.pin_ap)
    annotation (Line(points={{-14,20},{-14,0}},  color={0,0,255}));
  connect(armatureVoltage.n, ground.p)
    annotation (Line(points={{-80,20},{-80,-20}}, color={0,0,255}));
  connect(ground.p, dcse.pin_en)
    annotation (Line(points={{-80,-20},{-30,-20},{-30,-16}},color={0,0,255}));
  connect(dcse.pin_an, dcse.pin_ep)
    annotation (Line(points={{-26,0},{-30,0},{-30,-4}},  color={0,0,255}));
  connect(controller.y, torque.tau)
    annotation (Line(points={{61,-10},{52,-10}}, color={0,0,127}));
  connect(currentSensor.i, controller.u) annotation (Line(points={{-4,30},{90,
          30},{90,-10},{84,-10}},
                              color={0,0,127}));
  annotation (experiment(Interval=0.001, Tolerance=1e-06), Documentation(info=
         "<html>
<p>
Nominal operation of quasistatic dc machine with series excitation based on nominal armature current
</p>
</html>"));
end DCSE_NominalOperation;
