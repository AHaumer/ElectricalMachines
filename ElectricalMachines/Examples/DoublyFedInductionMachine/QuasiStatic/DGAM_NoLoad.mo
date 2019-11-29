within ElectricalMachines.Examples.DoublyFedInductionMachine.QuasiStatic;
model DGAM_NoLoad
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  parameter Real s=0.2 "Slip";
  parameter ParameterRecords.IM_SlipRingData imsData(useTurnsRatio=false,
      VrLockedRotor=imsData.VsNominal)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  ElectricalMachines.QuasiStatic.FundamentalWave.IM_SlipRing ims(
    data=imsData,
    gammas(fixed=false),
    gammar(fixed=false),
    phiMechanical(start=0, fixed=true),
    wMechanical(start=(1 - s)*imsData.wSyn))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Magnetic.QuasiStatic.FundamentalWave.Utilities.TerminalBox
    terminalBoxS(terminalConnection="Y")
    annotation (Placement(transformation(extent={{-10,6},{10,26}})));
  Utilities.QuasiStatic.Analyzer analyzerS annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,30})));
  Utilities.QuasiStatic.VoltageSource voltageSourceS(f=imsData.fsNominal, V=
        imsData.VsNominal) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={0,60})));
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
    useVoltageInput=true,
    f=s*imsData.fsNominal,
    V=s*imsData.VsNominal,
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
  Modelica.Blocks.Sources.Ramp ramp(
    height=0.2*s*imsData.VsNominal,
    duration=1,
    offset=0.9*s*imsData.VsNominal,
    startTime=0)
    annotation (Placement(transformation(extent={{-90,10},{-70,30}})));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed=(1
         - s)*imsData.wSyn)
    annotation (Placement(transformation(extent={{40,-10},{20,10}})));
equation
  connect(terminalBoxS.plug_sn, ims.plug_sn)
    annotation (Line(points={{-6,10},{-6,10}}, color={85,170,255}));
  connect(terminalBoxS.plug_sp, ims.plug_sp)
    annotation (Line(points={{6,10},{6,10}}, color={85,170,255}));
  connect(analyzerS.currentP, terminalBoxS.plugSupply)
    annotation (Line(points={{0,20},{0,12}}, color={85,170,255}));
  connect(voltageSourceS.plug_p, analyzerS.currentN)
    annotation (Line(points={{0,50},{0,40}}, color={85,170,255}));
  connect(starS.plug_p, voltageSourceS.plug_n) annotation (Line(points={{-10,
          70},{4.44089e-16,70}}, color={85,170,255}));
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
  connect(ramp.y, voltageSourceR.vRMS)
    annotation (Line(points={{-69,20},{-60,20},{-60,10}}, color={0,0,127}));
  annotation (experiment(Interval=0.001));
end DGAM_NoLoad;
