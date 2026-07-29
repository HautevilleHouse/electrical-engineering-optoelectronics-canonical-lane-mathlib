import ElectricalEngineeringOptoelectronicsCanonicalLaneLean.OptoelectronicsAdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure PhotonicCrystalPackage where
  photonicBandgap : Prop
  periodicDielectricStructure : Prop
  slowLightEffect : Prop
  nonlinearOpticalResponse : Prop

structure PhotonicCrystalEvidence (P : PhotonicCrystalPackage) where
  photonicBandgapClosed : P.photonicBandgap
  periodicDielectricStructureClosed : P.periodicDielectricStructure
  slowLightEffectClosed : P.slowLightEffect
  nonlinearOpticalResponseClosed : P.nonlinearOpticalResponse

def PhotonicCrystalClosed (P : PhotonicCrystalPackage) : Prop :=
  P.photonicBandgap ∧ P.periodicDielectricStructure ∧ P.slowLightEffect ∧ P.nonlinearOpticalResponse

theorem photonic_crystal_closed_from_evidence (P : PhotonicCrystalPackage) (E : PhotonicCrystalEvidence P) :
    PhotonicCrystalClosed P := by
  exact And.intro E.photonicBandgapClosed (And.intro E.periodicDielectricStructureClosed (And.intro E.slowLightEffectClosed E.nonlinearOpticalResponseClosed))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse