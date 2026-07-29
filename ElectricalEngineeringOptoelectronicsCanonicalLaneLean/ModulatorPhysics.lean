import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure ElectroOpticModulator where
  halfWaveVoltage : ℝ
  phaseShift : ℝ → ℝ
  extinctionRatio : ℝ
  bandwidth : ℝ
  insertionLoss : ℝ
  modulationTransferFunction : Prop

structure ModulatorEvidence (M : ElectroOpticModulator) where
  halfWaveVoltagePositive : M.halfWaveVoltage > 0
  phaseShiftContinuous : Continuous M.phaseShift
  extinctionRatioPositive : M.extinctionRatio > 0
  bandwidthPositive : M.bandwidth > 0
  insertionLossNonnegative : M.insertionLoss ≥ 0
  modulationTransferFunctionClosed : M.modulationTransferFunction

def ModulatorClosed (M : ElectroOpticModulator) : Prop :=
  M.halfWaveVoltage > 0 ∧ Continuous M.phaseShift ∧ M.extinctionRatio > 0 ∧
  M.bandwidth > 0 ∧ M.insertionLoss ≥ 0 ∧ M.modulationTransferFunction

theorem modulator_closed_from_evidence (M : ElectroOpticModulator) (E : ModulatorEvidence M) :
    ModulatorClosed M := by
  exact And.intro E.halfWaveVoltagePositive
    (And.intro E.phaseShiftContinuous
      (And.intro E.extinctionRatioPositive
        (And.intro E.bandwidthPositive
          (And.intro E.insertionLossNonnegative E.modulationTransferFunctionClosed))))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse