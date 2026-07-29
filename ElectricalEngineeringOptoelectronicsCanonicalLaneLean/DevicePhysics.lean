import Mathlib
import HautevilleHouse.ElectricalEngineeringOptoelectronicsCanonicalLaneLean.CarrierDynamics
import HautevilleHouse.ElectricalEngineeringOptoelectronicsCanonicalLaneLean.WaveguideOptics

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure OptoelectronicDevice where
  material : OptoelectronicMaterial
  carrierDynamics : CarrierDynamics material
  waveguideOptics : WaveguideOptics material
  deviceType : String
  emissionWavelength : ℝ
  wavelengthInRange : emissionWavelength > 0 ∧ workingWavelengthRange material

structure BandgapClosed (D : OptoelectronicDevice) : Prop where
  materialClosed : MaterialClosed D.material
  wavelengthInRange : D.emissionWavelength > 0 ∧ workingWavelengthRange D.material

structure CarrierStatisticsClosed (D : OptoelectronicDevice) : Prop where
  carrierDynamicsClosed : CarrierDynamicsClosed D.carrierDynamics
  mobilityPositive : D.carrierDynamics.mobilityPositive

def OptoelectronicsEvidence (D : OptoelectronicDevice) : Prop :=
  MaterialClosed D.material ∧ CarrierDynamicsClosed D.carrierDynamics ∧
  WaveguideOpticsClosed D.waveguideOptics ∧
  (D.emissionWavelength > 0 ∧ workingWavelengthRange D.material)

theorem optoelectronics_evidence_closed (D : OptoelectronicDevice) (E : OptoelectronicsEvidence D) :
    BandgapClosed D ∧ CarrierStatisticsClosed D := by
  rcases E with ⟨mc, cdc, wc, wl⟩
  exact And.intro (BandgapClosed.mk mc wl) (CarrierStatisticsClosed.mk cdc (by
    -- from CarrierDynamicsClosed we have mobilityPositive
    rcases cdc with ⟨_, mp⟩
    exact mp))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse