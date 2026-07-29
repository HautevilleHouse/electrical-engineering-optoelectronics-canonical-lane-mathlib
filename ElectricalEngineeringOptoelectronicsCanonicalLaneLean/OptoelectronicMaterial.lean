import Mathlib

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure OptoelectronicMaterial where
  bandgap : ℝ
  electronAffinity : ℝ
  permittivity : ℝ
  bandgapPositive : bandgap > 0
  workingWavelengthRange : Prop

structure MaterialEvidence (M : OptoelectronicMaterial) where
  bandgapPositiveClosed : M.bandgapPositive
  workingWavelengthRangeClosed : M.workingWavelengthRange

def MaterialClosed (M : OptoelectronicMaterial) : Prop :=
  M.bandgapPositive ∧ M.workingWavelengthRange

theorem material_closed_from_evidence (M : OptoelectronicMaterial) (E : MaterialEvidence M) :
    MaterialClosed M := by
  exact And.intro E.bandgapPositiveClosed E.workingWavelengthRangeClosed

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse