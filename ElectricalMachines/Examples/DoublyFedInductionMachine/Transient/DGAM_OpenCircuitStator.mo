within ElectricalMachines.Examples.DoublyFedInductionMachine.Transient;
model DGAM_OpenCircuitStator
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter ParameterRecords.IM_SlipRingData imsData(useTurnsRatio=false,
      VrLockedRotor=imsData.VsNominal)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  ElectricalMachines.Transient.SpacePhasor.IM_SlipRing ims(
    data=imsData)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBoxS(
      terminalConnection="Y")
    annotation (Placement(transformation(extent={{-10,6},{10,26}})));
  Utilities.Transient.Analyzer analyzerS annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,30})));
  Modelica.Electrical.MultiPhase.Basic.Star starS
    annotation (Placement(transformation(extent={{-10,60},{-30,80}})));
  Modelica.Electrical.Analog.Basic.Ground groundS annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-50,70})));

  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBoxR(
      terminalConnection="Y") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-16,0})));
  Utilities.Transient.Analyzer analyzerR annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,0})));
  Utilities.Transient.VoltageSource cosineVoltageR(V=imsData.VsNominal, f=
        imsData.fsNominal) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-60,0})));
  Modelica.Electrical.MultiPhase.Basic.Star starR annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-70,-20})));
  Modelica.Electrical.Analog.Basic.Ground groundR annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-70,-50})));
  Modelica.Mechanics.Rotational.Sources.Speed speed(exact=true)
    annotation (Placement(transformation(extent={{40,-10},{20,10}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=-1.2*imsData.wSyn,
    duration=3,
    startTime=3)
    annotation (Placement(transformation(extent={{70,-10},{50,10}})));
  Modelica.Electrical.MultiPhase.Basic.Resistor resistor(R=fill(1e6, 3))
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=270,
        origin={0,60})));
equation
  connect(terminalBoxS.plug_sn, ims.plug_sn)
    annotation (Line(points={{-6,10},{-6,10}}, color={0,0,255}));
  connect(terminalBoxS.plug_sp, ims.plug_sp)
    annotation (Line(points={{6,10},{6,10}}, color={0,0,255}));
  connect(terminalBoxR.plug_sp, ims.plug_rp)
    annotation (Line(points={{-10,6},{-10,6}}, color={0,0,255}));
  connect(terminalBoxR.plug_sn, ims.plug_rn)
    annotation (Line(points={{-10,-6},{-10,-6}}, color={0,0,255}));
  connect(terminalBoxS.plugSupply, analyzerS.plug_ni)
    annotation (Line(points={{0,12},{0,20}}, color={0,0,255}));
  connect(starS.plug_p, analyzerS.plug_nv)
    annotation (Line(points={{-10,70},{-10,30}}, color={0,0,255}));
  connect(groundS.p, starS.pin_n)
    annotation (Line(points={{-40,70},{-30,70}}, color={0,0,255}));
  connect(terminalBoxR.plugSupply, analyzerR.plug_ni)
    annotation (Line(points={{-12,0},{-20,0}}, color={0,0,255}));
  connect(analyzerR.plug_p, cosineVoltageR.plug_p)
    annotation (Line(points={{-40,0},{-50,0},{-50,-1.77636e-15},{-50,-1.77636e-15}},
                                               color={0,0,255}));
  connect(cosineVoltageR.plug_n, starR.plug_p)
    annotation (Line(points={{-70,0},{-70,-10}}, color={0,0,255}));
  connect(starR.plug_p, analyzerR.plug_nv)
    annotation (Line(points={{-70,-10},{-30,-10}}, color={0,0,255}));
  connect(starR.pin_n, groundR.p)
    annotation (Line(points={{-70,-30},{-70,-40}}, color={0,0,255}));
  connect(groundR.p, terminalBoxR.starpoint)
    annotation (Line(points={{-70,-40},{-12,-40},{-12,-9}}, color={0,0,255}));
  connect(speed.w_ref, ramp.y)
    annotation (Line(points={{42,0},{49,0}}, color={0,0,127}));
  connect(speed.flange, ims.flange)
    annotation (Line(points={{20,0},{10,0}}, color={0,0,0}));
  connect(starS.plug_p, resistor.plug_n)
    annotation (Line(points={{-10,70},{0,70}}, color={0,0,255}));
  connect(analyzerS.plug_p, resistor.plug_p)
    annotation (Line(points={{0,40},{0,50}}, color={0,0,255}));
  annotation (experiment(
      StopTime=3,
      Interval=0.001,
      Tolerance=1e-06), Diagram(graphics={Text(
          extent={{0,90},{100,80}},
          lineColor={28,108,200},
          textString="Simulate and Continue")}));
end DGAM_OpenCircuitStator;
