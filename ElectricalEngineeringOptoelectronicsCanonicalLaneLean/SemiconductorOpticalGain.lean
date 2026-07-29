import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure SemiconductorGainPackage where
  activeRegionMaterial : Type
  bandStructureParabolic : Prop
  gainSpectrumComputed : Prop
  transparencyCarrierDensity : Prop
  differentialGain : Prop

structure SemiconductorGainEvidence (G : SemiconductorGainPackage) where
  bandStructureParabolicClosed : G.bandStructureParabolic
  gainSpectrumComputedClosed : G.gainSpectrumComputed
  transparencyCarrierDensityClosed : G.transparencyCarrierDensity
  differentialGainClosed : G.differentialGain

def SemiconductorGainClosed (G : SemiconductorGainPackage) : Prop :=
  G.bandStructureParabolic ∧ G.gainSpectrumComputed ∧
  G.transparencyCarrierDensity ∧ G.differentialGain

theorem semiconductor_gain_closed_from_evidence
    (G : SemiconductorGainPackage) (E : SemiconductorGainEvidence G) :
    SemiconductorGainClosed G := by
  exact And.intro E.bandStructureParabolicClosed
    (And.intro E.gainSpectrumComputedClosed
      (And.intro E.transparencyCarrierDensityClosed E.differentialGainClosed))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse