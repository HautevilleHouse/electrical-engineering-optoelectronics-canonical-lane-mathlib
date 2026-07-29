import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure OptoelectronicAdmittedObject where
  carrier : Type
  topology : TopologicalSpace carrier
  activeSemiconductorRegion : Prop
  photonicCrystalStructure : Prop
  laserOscillationCondition : Prop
  conclusion : activeSemiconductorRegion ∧ photonicCrystalStructure ∧ laserOscillationCondition

structure AdmissibleClass where
  object : OptoelectronicAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.object.activeSemiconductorRegion ∧ A.object.photonicCrystalStructure ∧ A.object.laserOscillationCondition) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse