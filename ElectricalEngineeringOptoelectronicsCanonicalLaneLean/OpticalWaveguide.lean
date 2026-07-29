import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure OpticalWaveguidePackage where
  coreMaterial : Type u
  claddingMaterial : Type u
  refractiveIndexContrast : Prop
  modeProfile : Prop
  propagationLoss : Prop

structure OpticalWaveguideEvidence (W : OpticalWaveguidePackage) where
  coreMaterialClosed : W.coreMaterial
  claddingMaterialClosed : W.claddingMaterial
  refractiveIndexContrastClosed : W.refractiveIndexContrast
  modeProfileClosed : W.modeProfile
  propagationLossClosed : W.propagationLoss

def OpticalWaveguideClosed (W : OpticalWaveguidePackage) : Prop :=
  W.coreMaterial ∧ W.claddingMaterial ∧ W.refractiveIndexContrast ∧ W.modeProfile ∧ W.propagationLoss

theorem optical_waveguide_closed_from_evidence (W : OpticalWaveguidePackage)
    (E : OpticalWaveguideEvidence W) : OpticalWaveguideClosed W := by
  exact And.intro E.coreMaterialClosed
    (And.intro E.claddingMaterialClosed
      (And.intro E.refractiveIndexContrastClosed
        (And.intro E.modeProfileClosed E.propagationLossClosed)))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse