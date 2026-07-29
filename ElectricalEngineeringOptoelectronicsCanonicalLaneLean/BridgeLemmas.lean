import Mathlib
import HautevilleHouse.ElectricalEngineeringOptoelectronicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  bandgapClosed A.device

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.bandgapClosed

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse