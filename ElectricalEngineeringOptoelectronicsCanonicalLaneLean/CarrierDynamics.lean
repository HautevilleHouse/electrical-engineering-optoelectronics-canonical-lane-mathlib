import Mathlib
import HautevilleHouse.ElectricalEngineeringOptoelectronicsCanonicalLaneLean.OptoelectronicMaterial

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure CarrierDynamics (M : OptoelectronicMaterial) where
  radiativeRecombinationRate : ℝ
  nonRadiativeRecombinationRate : ℝ
  carrierMobility : ℝ
  ratePositive : radiativeRecombinationRate ≥ 0 ∧ nonRadiativeRecombinationRate ≥ 0
  mobilityPositive : carrierMobility > 0

structure CarrierDynamicsEvidence {M : OptoelectronicMaterial} (C : CarrierDynamics M) where
  ratePositiveClosed : C.ratePositive
  mobilityPositiveClosed : C.mobilityPositive

def CarrierDynamicsClosed {M : OptoelectronicMaterial} (C : CarrierDynamics M) : Prop :=
  C.ratePositive ∧ C.mobilityPositive

theorem carrier_dynamics_closed_from_evidence {M : OptoelectronicMaterial}
    (C : CarrierDynamics M) (E : CarrierDynamicsEvidence C) :
    CarrierDynamicsClosed C := by
  exact And.intro E.ratePositiveClosed E.mobilityPositiveClosed

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse