import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure ElectroOpticModulatorPackage where
  electroOpticMaterial : Type u
  modulationBandwidth : Prop
  extinctionRatio : Prop
  driveVoltage : Prop
  insertionLoss : Prop

structure ElectroOpticModulatorEvidence (M : ElectroOpticModulatorPackage) where
  electroOpticMaterialClosed : M.electroOpticMaterial
  modulationBandwidthClosed : M.modulationBandwidth
  extinctionRatioClosed : M.extinctionRatio
  driveVoltageClosed : M.driveVoltage
  insertionLossClosed : M.insertionLoss

def ElectroOpticModulatorClosed (M : ElectroOpticModulatorPackage) : Prop :=
  M.electroOpticMaterial ∧ M.modulationBandwidth ∧ M.extinctionRatio ∧ M.driveVoltage ∧ M.insertionLoss

theorem electro_optic_modulator_closed_from_evidence (M : ElectroOpticModulatorPackage)
    (E : ElectroOpticModulatorEvidence M) : ElectroOpticModulatorClosed M := by
  exact And.intro E.electroOpticMaterialClosed
    (And.intro E.modulationBandwidthClosed
      (And.intro E.extinctionRatioClosed
        (And.intro E.driveVoltageClosed E.insertionLossClosed)))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse