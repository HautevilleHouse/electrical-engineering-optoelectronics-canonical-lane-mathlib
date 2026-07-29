import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure PhotodetectorPackage where
  absorptionMaterial : Type u
  responsivity : Prop
  darkCurrent : Prop
  bandwidth : Prop
  quantumEfficiency : Prop

structure PhotodetectorEvidence (P : PhotodetectorPackage) where
  absorptionMaterialClosed : P.absorptionMaterial
  responsivityClosed : P.responsivity
  darkCurrentClosed : P.darkCurrent
  bandwidthClosed : P.bandwidth
  quantumEfficiencyClosed : P.quantumEfficiency

def PhotodetectorClosed (P : PhotodetectorPackage) : Prop :=
  P.absorptionMaterial ∧ P.responsivity ∧ P.darkCurrent ∧ P.bandwidth ∧ P.quantumEfficiency

theorem photodetector_closed_from_evidence (P : PhotodetectorPackage)
    (E : PhotodetectorEvidence P) : PhotodetectorClosed P := by
  exact And.intro E.absorptionMaterialClosed
    (And.intro E.responsivityClosed
      (And.intro E.darkCurrentClosed
        (And.intro E.bandwidthClosed E.quantumEfficiencyClosed)))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse