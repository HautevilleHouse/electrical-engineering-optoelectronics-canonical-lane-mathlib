import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure OpticalAmplifierPackage where
  amplifierGainMedium : Type u
  gain : Prop
  noiseFigure : Prop
  saturationPower : Prop
  bandwidth : Prop

structure OpticalAmplifierEvidence (A : OpticalAmplifierPackage) where
  amplifierGainMediumClosed : A.amplifierGainMedium
  gainClosed : A.gain
  noiseFigureClosed : A.noiseFigure
  saturationPowerClosed : A.saturationPower
  bandwidthClosed : A.bandwidth

def OpticalAmplifierClosed (A : OpticalAmplifierPackage) : Prop :=
  A.amplifierGainMedium ∧ A.gain ∧ A.noiseFigure ∧ A.saturationPower ∧ A.bandwidth

theorem optical_amplifier_closed_from_evidence (A : OpticalAmplifierPackage)
    (E : OpticalAmplifierEvidence A) : OpticalAmplifierClosed A := by
  exact And.intro E.amplifierGainMediumClosed
    (And.intro E.gainClosed
      (And.intro E.noiseFigureClosed
        (And.intro E.saturationPowerClosed E.bandwidthClosed)))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse