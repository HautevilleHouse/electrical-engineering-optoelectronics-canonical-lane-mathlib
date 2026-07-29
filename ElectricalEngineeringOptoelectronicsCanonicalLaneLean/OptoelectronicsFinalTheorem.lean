import ElectricalEngineeringOptoelectronicsCanonicalLaneLean.OptoelectronicsGateLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

def ConstrainedOptoelectronicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_optoelectronics_endgame (A : AdmissibleClass) :
    ConstrainedOptoelectronicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse