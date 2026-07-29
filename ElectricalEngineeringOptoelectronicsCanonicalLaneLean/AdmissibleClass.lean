import Mathlib

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

-- Admissible class for optoelectronics: a device structure with known bandgap and carrier statistics.
structure AdmissibleClass where
  device : OptoelectronicDevice
  bandgapClosed : Prop
  carrierStatisticsClosed : Prop
  gateWitness : bandgapClosed ∨ carrierStatisticsClosed

def admittedClosure (A : AdmissibleClass) : Prop :=
  bandgapClosed A.device ∧ (A.bandgapClosed ∨ A.carrierStatisticsClosed)

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse