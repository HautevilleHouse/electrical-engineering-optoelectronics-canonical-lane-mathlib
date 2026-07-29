import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure OpticalWaveguide where
  coreRefractiveIndex : ℝ
  claddingRefractiveIndex : ℝ
  wavelength : ℝ
  modeFieldProfile : ℝ → ℂ
  effectiveIndex : ℝ
  confinementFactor : ℝ
  singleModeCondition : Prop

structure WaveguideEvidence (W : OpticalWaveguide) where
  coreIndexPositive : W.coreRefractiveIndex > 0
  claddingIndexPositive : W.claddingRefractiveIndex > 0
  wavelengthPositive : W.wavelength > 0
  effectiveIndexBetween : W.claddingRefractiveIndex < W.effectiveIndex ∧ W.effectiveIndex < W.coreRefractiveIndex
  confinementFactorPositive : W.confinementFactor > 0
  singleModeConditionClosed : W.singleModeCondition

def WaveguideClosed (W : OpticalWaveguide) : Prop :=
  W.coreRefractiveIndex > 0 ∧ W.claddingRefractiveIndex > 0 ∧ W.wavelength > 0 ∧
  (W.claddingRefractiveIndex < W.effectiveIndex ∧ W.effectiveIndex < W.coreRefractiveIndex) ∧
  W.confinementFactor > 0 ∧ W.singleModeCondition

theorem waveguide_closed_from_evidence (W : OpticalWaveguide) (E : WaveguideEvidence W) :
    WaveguideClosed W := by
  exact And.intro E.coreIndexPositive
    (And.intro E.claddingIndexPositive
      (And.intro E.wavelengthPositive
        (And.intro E.effectiveIndexBetween
          (And.intro E.confinementFactorPositive E.singleModeConditionClosed))))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse