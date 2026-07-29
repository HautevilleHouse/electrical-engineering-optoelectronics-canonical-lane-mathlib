import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure PhotodetectorEfficiencyPackage where
  responsivity : Type u
  quantumEfficiency : Type v
  darkCurrent : Prop
  bandwidth : Prop
  noiseEquivalentPower : Prop
  detectivity : Prop

structure PhotodetectorEfficiencyEvidence (F : PhotodetectorEfficiencyPackage) where
  responsivityClosed : Prop
  quantumEfficiencyClosed : F.quantumEfficiency
  darkCurrentClosed : F.darkCurrent
  bandwidthClosed : F.bandwidth
  noiseEquivalentPowerClosed : F.noiseEquivalentPower
  detectivityClosed : F.detectivity

def PhotodetectorEfficiencyClosed (F : PhotodetectorEfficiencyPackage) : Prop :=
  F.responsivity ∧ F.quantumEfficiency ∧ F.darkCurrent ∧ F.bandwidth ∧ F.noiseEquivalentPower ∧ F.detectivity

theorem photodetector_efficiency_closed_from_evidence
    (F : PhotodetectorEfficiencyPackage) (E : PhotodetectorEfficiencyEvidence F) :
    PhotodetectorEfficiencyClosed F := by
  exact And.intro E.responsivityClosed
    (And.intro E.quantumEfficiencyClosed
      (And.intro E.darkCurrentClosed
        (And.intro E.bandwidthClosed
          (And.intro E.noiseEquivalentPowerClosed E.detectivityClosed))))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse
