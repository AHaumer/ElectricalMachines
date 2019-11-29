within ElectricalMachines.Examples.DoublyFedInductionMachine.Transient;
model DGAM_NoLoad
  extends Modelica.Icons.Example;
  import Modelica.Constants.pi;
  import Modelica.Electrical.Machines.SpacePhasors.Functions.Rotator;
  parameter Real s=0.2 "Slip";
  parameter ParameterRecords.IM_SlipRingData imsData(useTurnsRatio=false,
      VrLockedRotor=imsData.VsNominal)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  ElectricalMachines.Transient.SpacePhasor.IM_SlipRing ims(
    data=imsData,
    phiMechanical(start=0, fixed=true),
    wMechanical(start=(1 - s)*imsData.wSyn, fixed=true))
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBoxS(
      terminalConnection="Y")
    annotation (Placement(transformation(extent={{-10,6},{10,26}})));
  Utilities.Transient.Analyzer analyzerS annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,30})));
  Utilities.Transient.VoltageSource cosineVoltageS(V=imsData.VsNominal, f=
        imsData.fsNominal) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,60})));
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
  Utilities.Transient.VoltageSource cosineVoltageR(
    useVoltageInput=true,
    V=s*imsData.VsNominal,
    f=s*imsData.fsNominal) annotation (Placement(transformation(
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
  Modelica.Blocks.Sources.Ramp ramp(
    height=0.2*s*imsData.VsNominal,
    duration=3,
    offset=0.9*s*imsData.VsNominal,
    startTime=3)
    annotation (Placement(transformation(extent={{-90,10},{-70,30}})));
protected
  Modelica.SIunits.Angle phi=2*pi*imsData.fsNominal*time;
  Real RotationMatrix[2, 2]={{+cos(-phi),-sin(-phi)},{+sin(-phi),+cos(-phi)}};
  Modelica.SIunits.Current is[2]=RotationMatrix*ims.idq_ss;
  Modelica.SIunits.Current ir[2]=RotationMatrix*ims.idq_rs;
initial equation
  der(is)=zeros(2);
  der(ir)=zeros(2);
  ims.i_0_r=0;
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
  connect(analyzerS.plug_p, cosineVoltageS.plug_p)
    annotation (Line(points={{0,40},{0,50}}, color={0,0,255}));
  connect(cosineVoltageS.plug_n, starS.plug_p)
    annotation (Line(points={{0,70},{-10,70}}, color={0,0,255}));
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
  connect(ramp.y, cosineVoltageR.vRMS)
    annotation (Line(points={{-69,20},{-60,20},{-60,10}}, color={0,0,127}));
  annotation (experiment(StopTime=3, Interval=0.001), Diagram(graphics={Text(
          extent={{0,90},{100,80}},
          lineColor={28,108,200},
          textString="Simulate and Continue")}));
end DGAM_NoLoad;
