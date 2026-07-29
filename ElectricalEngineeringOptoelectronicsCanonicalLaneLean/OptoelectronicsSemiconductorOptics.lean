import ElectricalEngineeringOptoelectronicsCanonicalLaneLean.OptoelectronicsAdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure SemiconductorOpticsPackage where
  bandGapEnergy : Prop
  refractiveIndex : Prop
  absorptionCoefficient : Prop
  carrierDensity : Prop

structure SemiconductorOpticsEvidence (P : SemiconductorOpticsPackage) where
  bandGapEnergyClosed : P.bandGapEnergy
  refractiveIndexClosed : P.refractiveIndex
  absorptionCoefficientClosed : P.absorptionCoefficient
  carrierDensityClosed : P.carrierDensity

def SemiconductorOpticsClosed (P : SemiconductorOpticsPackage) : Prop :=
  P.bandGapEnergy ∧ P.refractiveIndex ∧ P.absorptionCoefficient ∧ P.carrierDensity

theorem semiconductor_optics_closed_from_evidence (P : SemiconductorOpticsPackage) (E : SemiconductorOpticsEvidence P) :
    SemiconductorOpticsClosed P := by
  exact And.intro E.bandGapEnergyClosed (And.intro E.refractiveIndexClosed (And.intro E.absorptionCoefficientClosed E.carrierDensityClosed))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse