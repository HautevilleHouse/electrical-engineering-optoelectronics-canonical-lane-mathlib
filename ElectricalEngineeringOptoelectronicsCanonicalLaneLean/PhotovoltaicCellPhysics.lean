import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure PhotovoltaicCellPhysicsPackage where
  openCircuitVoltage : Type u
  shortCircuitCurrent : Type v
  fillFactor : Prop
  efficiency : Prop
  spectralResponse : Prop
  temperatureCoefficient : Prop

structure PhotovoltaicCellPhysicsEvidence (Epkg : PhotovoltaicCellPhysicsPackage) where
  openCircuitVoltageClosed : Epkg.openCircuitVoltage
  shortCircuitCurrentClosed : Epkg.shortCircuitCurrent
  fillFactorClosed : Epkg.fillFactor
  efficiencyClosed : Epkg.efficiency
  spectralResponseClosed : Epkg.spectralResponse
  temperatureCoefficientClosed : Epkg.temperatureCoefficient

def PhotovoltaicCellPhysicsClosed (Epkg : PhotovoltaicCellPhysicsPackage) : Prop :=
  Epkg.openCircuitVoltage ∧ Epkg.shortCircuitCurrent ∧ Epkg.fillFactor ∧ Epkg.efficiency ∧ Epkg.spectralResponse ∧ Epkg.temperatureCoefficient

theorem photovoltaic_cell_physics_closed_from_evidence
    (Epkg : PhotovoltaicCellPhysicsPackage) (E : PhotovoltaicCellPhysicsEvidence Epkg) :
    PhotovoltaicCellPhysicsClosed Epkg := by
  exact And.intro E.openCircuitVoltageClosed
    (And.intro E.shortCircuitCurrentClosed
      (And.intro E.fillFactorClosed
        (And.intro E.efficiencyClosed
          (And.intro E.spectralResponseClosed E.temperatureCoefficientClosed))))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse
