within ElectricalMachines.Examples.DoublyFedInductionMachine.QuasiStatic;
model DGAM_OpenCircuitStator
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter ParameterRecords.IM_SlipRingData imsData(useTurnsRatio=false,
      VrLockedRotor=imsData.VsNominal)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  ElectricalMachines.QuasiStatic.FundamentalWave.IM_SlipRing ims(
    data=imsData,
    gammas(fixed=false),
    gammar(fixed=false))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
    terminalBoxS(terminalConnection="Y")
    annotation (Placement(transformation(extent={{-10,6},{10,26}})));
  Utilities.QuasiStatic.Analyzer analyzerS annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,30})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star starS annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-20,70})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundS
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,70})));
  Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox terminalBoxR(
      terminalConnection="Y") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-16,0})));
  Utilities.QuasiStatic.Analyzer analyzerR annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-30,0})));
  Utilities.QuasiStatic.VoltageSource voltageSourceR(
    useVoltageInput=false,
    f=imsData.fsNominal,
    V=imsData.VsNominal,
    makeRoot=false)        annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-60,0})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Star starR annotation (
     Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,-20})));
  Modelica.Electrical.QuasiStationary.SinglePhase.Basic.Ground groundR
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-50})));
  Modelica.Mechanics.Rotational.Sources.Speed speed(exact=true)
    annotation (Placement(transformation(extent={{40,-10},{20,10}})));
  Modelica.Blocks.Sources.Ramp ramp(height=-1.2*imsData.wSyn, duration=1)
    annotation (Placement(transformation(extent={{70,-10},{50,10}})));
  Modelica.Electrical.QuasiStationary.MultiPhase.Basic.Resistor resistor(R_ref=
        fill(1e6, 3))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={0,60})));
equation
  connect(terminalBoxS.plug_sn, ims.plug_sn)
    annotation (Line(points={{-6,10},{-6,10}}, color={85,170,255}));
  connect(terminalBoxS.plug_sp, ims.plug_sp)
    annotation (Line(points={{6,10},{6,10}}, color={85,170,255}));
  connect(analyzerS.currentP, terminalBoxS.plugSupply)
    annotation (Line(points={{0,20},{0,12}}, color={85,170,255}));
  connect(analyzerS.voltageN, starS.plug_p)
    annotation (Line(points={{-10,30},{-10,70}}, color={85,170,255}));
  connect(terminalBoxS.starpoint, starS.pin_n) annotation (Line(points={{-10,
          12},{-20,12},{-20,60},{-30,60},{-30,70}}, color={85,170,255}));
  connect(starS.pin_n, groundS.pin)
    annotation (Line(points={{-30,70},{-40,70}}, color={85,170,255}));
  connect(terminalBoxR.plug_sp, ims.plug_rp)
    annotation (Line(points={{-10,6},{-10,6}}, color={85,170,255}));
  connect(terminalBoxR.plug_sn, ims.plug_rn)
    annotation (Line(points={{-10,-6},{-10,-6}}, color={85,170,255}));
  connect(analyzerR.currentP, terminalBoxR.plugSupply)
    annotation (Line(points={{-20,0},{-12,0}}, color={85,170,255}));
  connect(voltageSourceR.plug_p, analyzerR.currentN)
    annotation (Line(points={{-50,0},{-40,0}}, color={85,170,255}));
  connect(voltageSourceR.plug_n, starR.plug_p)
    annotation (Line(points={{-70,0},{-70,-10}}, color={85,170,255}));
  connect(starR.pin_n, groundR.pin) annotation (Line(points={{-70,-30},{-70,
          -40},{-70,-40}}, color={85,170,255}));
  connect(starR.plug_p, analyzerR.voltageN)
    annotation (Line(points={{-70,-10},{-30,-10}}, color={85,170,255}));
  connect(terminalBoxR.starpoint, starR.pin_n) annotation (Line(points={{-12,
          -10},{-12,-20},{-60,-20},{-60,-30},{-70,-30}}, color={85,170,255}));
  connect(speed.flange, ims.flange)
    annotation (Line(points={{20,0},{10,0}}, color={0,0,0}));
  connect(ramp.y, speed.w_ref)
    annotation (Line(points={{49,0},{42,0}}, color={0,0,127}));
  connect(starS.plug_p, resistor.plug_n)
    annotation (Line(points={{-10,70},{1.77636e-15,70}}, color={85,170,255}));
  connect(analyzerS.currentN, resistor.plug_p)
    annotation (Line(points={{0,40},{0,50}}, color={85,170,255}));
  annotation (experiment(Interval=0.001));
end DGAM_OpenCircuitStator;
