import Mathlib
import HautevilleHouse.ElectricalEngineeringOptoelectronicsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.bandgapClosed ∨ A.carrierStatisticsClosed

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse