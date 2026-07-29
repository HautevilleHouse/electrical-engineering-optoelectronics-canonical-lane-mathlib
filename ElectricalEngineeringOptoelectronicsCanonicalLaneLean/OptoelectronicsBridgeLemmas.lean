import ElectricalEngineeringOptoelectronicsCanonicalLaneLean.OptoelectronicsAdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.activeSemiconductorRegion ∧ A.object.photonicCrystalStructure ∧ A.object.laserOscillationCondition

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse