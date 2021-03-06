# Electrcal Machines
Modelica library of machine models with parameter records.

# License
BSD-3 (see License)

# Development and contribution
Have you ever been bored by propagating all the parameters for a new type of a machine used in your models?
Here's the solution:
* Build your own database of different machine parameters by extending from ElectricalMachines.ParameterRecords
* Use the machine models from this library: they're extending from the machine models of the Modelica Standard Library
* Propagate all necessary parameters with just one parameter record!
* Change operational parameters in the machine model, if desired.

# Note
The parameter records ElectricalMachines.ParameterRecords extend from Modelica.Electrical.Machines.Utilities.ParameterRecords.
They are intended to replace the parameter records in the Modelica Standard Library in the future.

# Contact
e-mail: a.haumer(at)edrives.eu
