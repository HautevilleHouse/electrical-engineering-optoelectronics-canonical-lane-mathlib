import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure ModulatorTransferFunctionPackage where
  insertionLoss : Type u
  extinctionRatio : Type v
  bandwidth : Prop
  driveVoltage : Prop
  chirpParameter : Prop
  operatingWavelength : Prop

structure ModulatorTransferFunctionEvidence (U : ModulatorTransferFunctionPackage) where
  insertionLossClosed : U.insertionLoss
  extinctionRatioClosed : U.extinctionRatio
  bandwidthClosed : U.bandwidth
  driveVoltageClosed : U.driveVoltage
  chirpParameterClosed : U.chirpParameter
  operatingWavelengthClosed : U.operatingWavelength

def ModulatorTransferFunctionClosed (U : ModulatorTransferFunctionPackage) : Prop :=
  U.insertionLoss ∧ U.extinctionRatio ∧ U.bandwidth ∧ U.driveVoltage ∧ U.chirpParameter ∧ U.operatingWavelength

theorem modulator_transfer_function_closed_from_evidence
    (U : ModulatorTransferFunctionPackage) (E : ModulatorTransferFunctionEvidence U) :
    ModulatorTransferFunctionClosed U := by
  exact And.intro E.insertionLossClosed
    (And.intro E.extinctionRatioClosed
      (And.intro E.bandwidthClosed
        (And.intro E.driveVoltageClosed
          (And.intro E.chirpParameterClosed E.operatingWavelengthClosed))))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse
