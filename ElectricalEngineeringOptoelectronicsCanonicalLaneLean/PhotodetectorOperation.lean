import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure Photodetector where
  responsivity : ℝ
  darkCurrent : ℝ
  bandwidth : ℝ
  quantumEfficiency : ℝ
  noiseEquivalentPower : ℝ
  photocurrentGenerationModel : Prop

structure PhotodetectorEvidence (P : Photodetector) where
  responsivityPositive : P.responsivity > 0
  darkCurrentNonnegative : P.darkCurrent ≥ 0
  bandwidthPositive : P.bandwidth > 0
  quantumEfficiencyBetweenZeroOne : 0 < P.quantumEfficiency ∧ P.quantumEfficiency ≤ 1
  noiseEquivalentPowerPositive : P.noiseEquivalentPower > 0
  photocurrentGenerationModelClosed : P.photocurrentGenerationModel

def PhotodetectorClosed (P : Photodetector) : Prop :=
  P.responsivity > 0 ∧ P.darkCurrent ≥ 0 ∧ P.bandwidth > 0 ∧
  (0 < P.quantumEfficiency ∧ P.quantumEfficiency ≤ 1) ∧
  P.noiseEquivalentPower > 0 ∧ P.photocurrentGenerationModel

theorem photodetector_closed_from_evidence (P : Photodetector) (E : PhotodetectorEvidence P) :
    PhotodetectorClosed P := by
  exact And.intro E.responsivityPositive
    (And.intro E.darkCurrentNonnegative
      (And.intro E.bandwidthPositive
        (And.intro E.quantumEfficiencyBetweenZeroOne
          (And.intro E.noiseEquivalentPowerPositive E.photocurrentGenerationModelClosed))))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse