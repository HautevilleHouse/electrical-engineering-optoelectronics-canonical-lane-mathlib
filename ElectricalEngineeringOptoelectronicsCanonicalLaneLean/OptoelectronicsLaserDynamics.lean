import ElectricalEngineeringOptoelectronicsCanonicalLaneLean.OptoelectronicsAdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure LaserDynamicsPackage where
  rateEquations : Prop
  gainSaturation : Prop
  laserThreshold : Prop
  outputPower : Prop
  modeLocking : Prop

structure LaserDynamicsEvidence (L : LaserDynamicsPackage) where
  rateEquationsClosed : L.rateEquations
  gainSaturationClosed : L.gainSaturation
  laserThresholdClosed : L.laserThreshold
  outputPowerClosed : L.outputPower
  modeLockingClosed : L.modeLocking

def LaserDynamicsClosed (L : LaserDynamicsPackage) : Prop :=
  L.rateEquations ∧ L.gainSaturation ∧ L.laserThreshold ∧ L.outputPower ∧ L.modeLocking

theorem laser_dynamics_closed_from_evidence (L : LaserDynamicsPackage) (E : LaserDynamicsEvidence L) :
    LaserDynamicsClosed L := by
  exact And.intro E.rateEquationsClosed (And.intro E.gainSaturationClosed (And.intro E.laserThresholdClosed (And.intro E.outputPowerClosed E.modeLockingClosed)))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse