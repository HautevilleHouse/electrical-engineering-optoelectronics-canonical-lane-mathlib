import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure PNJunction where
  builtInVoltage : ℝ
  depletionWidth : ℝ → ℝ
  reverseBiasLeakage : ℝ
  breakdownVoltage : ℝ
  currentVoltageCharacteristic : ℝ → ℝ
  idealDiodeEquationHolds : Prop

structure PNJunctionEvidence (J : PNJunction) where
  builtInVoltagePositive : J.builtInVoltage > 0
  depletionWidthNonnegative : ∀ V, J.depletionWidth V ≥ 0
  reverseBiasLeakageSmall : J.reverseBiasLeakage < 1e-3
  breakdownVoltagePositive : J.breakdownVoltage > 0
  idealDiodeEquationHoldsClosed : J.idealDiodeEquationHolds

def PNJunctionClosed (J : PNJunction) : Prop :=
  J.builtInVoltage > 0 ∧ (∀ V, J.depletionWidth V ≥ 0) ∧ J.reverseBiasLeakage < 1e-3 ∧
  J.breakdownVoltage > 0 ∧ J.idealDiodeEquationHolds

theorem pn_junction_closed_from_evidence (J : PNJunction) (E : PNJunctionEvidence J) :
    PNJunctionClosed J := by
  exact And.intro E.builtInVoltagePositive
    (And.intro E.depletionWidthNonnegative
      (And.intro E.reverseBiasLeakageSmall
        (And.intro E.breakdownVoltagePositive E.idealDiodeEquationHoldsClosed)))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse