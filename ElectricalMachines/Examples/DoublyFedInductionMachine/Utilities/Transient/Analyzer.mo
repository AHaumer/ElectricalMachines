within ElectricalMachines.Examples.DoublyFedInductionMachine.Utilities.Transient;
model Analyzer
  extends Modelica.Icons.RotationalSensor;
  constant Integer m(final min=1) = 3 "Number of phases";
  import Modelica.Constants.small;
  import Modelica.Constants.pi;
  Modelica.Blocks.Interfaces.RealOutput P(final quantity="Power", final unit="W")
    annotation (Placement(transformation(
        origin={-50,110},
        extent={{10,-10},{-10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealOutput Q(final quantity="Power", final unit="var")
    annotation (Placement(transformation(
        origin={50,110},
        extent={{10,-10},{-10,10}},
        rotation=270)));
  Modelica.Blocks.Interfaces.RealOutput vRMS(final quantity="Voltage", final unit="V") annotation (Placement(transformation(
        origin={-110,60},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealOutput iRMS(final quantity="Current", final unit="A") annotation (Placement(transformation(
        origin={110,60},
        extent={{10,-10},{-10,10}},
        rotation=180)));
  Modelica.Blocks.Interfaces.RealOutput f(final quantity="Frequency", final unit="Hz")
    annotation (Placement(transformation(
        origin={-110,-60},
        extent={{10,-10},{-10,10}},
        rotation=0)));
  Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p(final m=m)
    annotation (Placement(transformation(extent={{-110,-10},{-90,10}})));
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_ni(final m=m)
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
  Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_nv(final m=m)
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
protected
  parameter Modelica.SIunits.Angle phi[m]=
      Modelica.Electrical.MultiPhase.Functions.symmetricOrientation(m);
  parameter Real TransformationMatrix[2, m]=2/m*{+cos(+phi),+sin(+phi)};
  Modelica.SIunits.Voltage v_[2];
  Modelica.SIunits.Current i_[2];
  Modelica.SIunits.Angle arg;
equation
  plug_p.pin.v = plug_ni.pin.v;
  plug_p.pin.i + plug_ni.pin.i = zeros(m);
  plug_nv.pin.i = zeros(m);
  v_ = TransformationMatrix*(plug_p.pin.v - plug_nv.pin.v)/sqrt(2);
  i_ = TransformationMatrix*(plug_p.pin.i)/sqrt(2);
  1/3*P = +v_[1]*i_[1] + v_[2]*i_[2];
  1/3*Q = -v_[1]*i_[2] + v_[2]*i_[1];
  vRMS=sqrt(v_[1]^2 + v_[2]^2);
  iRMS=sqrt(i_[1]^2 + i_[2]^2);
  arg = if noEvent(v_[1] <= small) then 0 else Modelica.Math.atan2(v_[2], v_[1]);
  2*pi*f = if noEvent(vRMS <= small) then 0 else sqrt((der(v_[1]) - der(vRMS)*cos(arg))^2 + (der(v_[2]) - der(vRMS)*sin(arg))^2)/vRMS;
end Analyzer;
