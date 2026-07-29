import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure DriftDiffusionModel where
  mobilityElectron : ℝ
  mobilityHole : ℝ
  diffusionCoeffElectron : ℝ
  diffusionCoeffHole : ℝ
  recombinationRate : ℝ → ℝ
  continuityEquationsSatisfied : Prop

structure DriftDiffusionEvidence (D : DriftDiffusionModel) where
  mobilityElectronPositive : D.mobilityElectron > 0
  mobilityHolePositive : D.mobilityHole > 0
  diffusionCoeffElectronPositive : D.diffusionCoeffElectron > 0
  diffusionCoeffHolePositive : D.diffusionCoeffHole > 0
  recombinationRateNonnegative : ∀ x, D.recombinationRate x ≥ 0
  continuityEquationsSatisfiedClosed : D.continuityEquationsSatisfied

def DriftDiffusionClosed (D : DriftDiffusionModel) : Prop :=
  D.mobilityElectron > 0 ∧ D.mobilityHole > 0 ∧ D.diffusionCoeffElectron > 0 ∧
  D.diffusionCoeffHole > 0 ∧ (∀ x, D.recombinationRate x ≥ 0) ∧
  D.continuityEquationsSatisfied

theorem drift_diffusion_closed_from_evidence (D : DriftDiffusionModel) (E : DriftDiffusionEvidence D) :
    DriftDiffusionClosed D := by
  exact And.intro E.mobilityElectronPositive
    (And.intro E.mobilityHolePositive
      (And.intro E.diffusionCoeffElectronPositive
        (And.intro E.diffusionCoeffHolePositive
          (And.intro E.recombinationRateNonnegative E.continuityEquationsSatisfiedClosed))))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse