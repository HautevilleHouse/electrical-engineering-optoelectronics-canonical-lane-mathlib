import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringOptoelectronicsCanonicalLaneLean.LaserRateEquations

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure OpticalCavityPackage {G : SemiconductorGainPackage}
    {Gain : SemiconductorGainPackage} {L : LaserRateEquationsPackage Gain}
    (RateEqns : LaserRateEquationsPackage Gain) where
  modeProfile : Prop
  resonanceFrequency : Prop
  qualityFactor : Prop
  modeVolume : Prop
  freeSpectralRange : Prop

structure OpticalCavityEvidence {G : SemiconductorGainPackage}
    {Gain : SemiconductorGainPackage} {L : LaserRateEquationsPackage Gain}
    {RateEqns : LaserRateEquationsPackage Gain} (C : OpticalCavityPackage RateEqns) where
  modeProfileClosed : C.modeProfile
  resonanceFrequencyClosed : C.resonanceFrequency
  qualityFactorClosed : C.qualityFactor
  modeVolumeClosed : C.modeVolume
  freeSpectralRangeClosed : C.freeSpectralRange

def OpticalCavityClosed {G : SemiconductorGainPackage}
    {Gain : SemiconductorGainPackage} {L : LaserRateEquationsPackage Gain}
    {RateEqns : LaserRateEquationsPackage Gain} (C : OpticalCavityPackage RateEqns) : Prop :=
  C.modeProfile ∧ C.resonanceFrequency ∧ C.qualityFactor ∧
  C.modeVolume ∧ C.freeSpectralRange

theorem optical_cavity_closed_from_evidence
    {G : SemiconductorGainPackage} {Gain : SemiconductorGainPackage}
    {L : LaserRateEquationsPackage Gain} {RateEqns : LaserRateEquationsPackage Gain}
    (C : OpticalCavityPackage RateEqns) (E : OpticalCavityEvidence C) :
    OpticalCavityClosed C := by
  exact And.intro E.modeProfileClosed
    (And.intro E.resonanceFrequencyClosed
      (And.intro E.qualityFactorClosed
        (And.intro E.modeVolumeClosed E.freeSpectralRangeClosed)))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse