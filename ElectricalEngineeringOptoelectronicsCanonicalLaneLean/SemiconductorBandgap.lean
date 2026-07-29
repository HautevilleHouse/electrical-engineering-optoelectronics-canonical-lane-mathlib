import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure SemiconductorBandgapPackage where
  material : Type u
  bandgapEnergy : Type v
  directBandgap : Prop
  indirectBandgap : Prop
  temperatureDependence : Prop
  alloyCompositionDependence : Prop

structure SemiconductorBandgapEvidence (G : SemiconductorBandgapPackage) where
  directBandgapClosed : G.directBandgap
  indirectBandgapClosed : G.indirectBandgap
  temperatureDependenceClosed : G.temperatureDependence
  alloyCompositionDependenceClosed : G.alloyCompositionDependence

def SemiconductorBandgapClosed (G : SemiconductorBandgapPackage) : Prop :=
  G.directBandgap ∧ G.indirectBandgap ∧ G.temperatureDependence ∧ G.alloyCompositionDependence

theorem semiconductor_bandgap_closed_from_evidence
    (G : SemiconductorBandgapPackage) (E : SemiconductorBandgapEvidence G) :
    SemiconductorBandgapClosed G := by
  exact And.intro E.directBandgapClosed
    (And.intro E.indirectBandgapClosed
      (And.intro E.temperatureDependenceClosed E.alloyCompositionDependenceClosed))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse
