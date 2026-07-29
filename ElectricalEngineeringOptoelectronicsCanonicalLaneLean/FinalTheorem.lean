import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringOptoelectronicsCanonicalLaneLean.SemiconductorOpticalGain
import HautevilleHouse.ElectricalEngineeringOptoelectronicsCanonicalLaneLean.LaserRateEquations
import HautevilleHouse.ElectricalEngineeringOptoelectronicsCanonicalLaneLean.OpticalCavityModes

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

def OptoelectronicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem optoelectronics_endgame (A : AdmissibleClass) :
    OptoelectronicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse