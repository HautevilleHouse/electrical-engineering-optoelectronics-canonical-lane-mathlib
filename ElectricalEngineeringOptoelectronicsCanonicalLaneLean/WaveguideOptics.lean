import Mathlib
import HautevilleHouse.ElectricalEngineeringOptoelectronicsCanonicalLaneLean.OptoelectronicMaterial

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure WaveguideOptics (M : OptoelectronicMaterial) where
  coreIndex : ℝ
  claddingIndex : ℝ
  coreThickness : ℝ
  indexContrast : coreIndex > claddingIndex
  singleModeCondition : Prop

structure WaveguideOpticsEvidence {M : OptoelectronicMaterial} (W : WaveguideOptics M) where
  indexContrastClosed : W.indexContrast
  singleModeConditionClosed : W.singleModeCondition

def WaveguideOpticsClosed {M : OptoelectronicMaterial} (W : WaveguideOptics M) : Prop :=
  W.indexContrast ∧ W.singleModeCondition

theorem waveguide_optics_closed_from_evidence {M : OptoelectronicMaterial}
    (W : WaveguideOptics M) (E : WaveguideOpticsEvidence W) :
    WaveguideOpticsClosed W := by
  exact And.intro E.indexContrastClosed E.singleModeConditionClosed

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse