import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure SemiconductorLaserPackage where
  gainMedium : Type u
  cavityResonance : Prop
  thresholdCurrent : Prop
  outputPower : Prop
  linewidth : Prop

structure SemiconductorLaserEvidence (L : SemiconductorLaserPackage) where
  gainMediumClosed : L.gainMedium
  cavityResonanceClosed : L.cavityResonance
  thresholdCurrentClosed : L.thresholdCurrent
  outputPowerClosed : L.outputPower
  linewidthClosed : L.linewidth

def SemiconductorLaserClosed (L : SemiconductorLaserPackage) : Prop :=
  L.gainMedium ∧ L.cavityResonance ∧ L.thresholdCurrent ∧ L.outputPower ∧ L.linewidth

theorem semiconductor_laser_closed_from_evidence (L : SemiconductorLaserPackage)
    (E : SemiconductorLaserEvidence L) : SemiconductorLaserClosed L := by
  exact And.intro E.gainMediumClosed
    (And.intro E.cavityResonanceClosed
      (And.intro E.thresholdCurrentClosed
        (And.intro E.outputPowerClosed E.linewidthClosed)))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse