import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure LaserDiodeCharacteristicsPackage where
  thresholdCurrent : Type u
  slopeEfficiency : Type v
  wavelength : Prop
  linewidth : Prop
  modulationResponse : Prop
  temperatureStability : Prop

structure LaserDiodeCharacteristicsEvidence (S : LaserDiodeCharacteristicsPackage) where
  thresholdCurrentClosed : S.thresholdCurrent
  slopeEfficiencyClosed : S.slopeEfficiency
  wavelengthClosed : S.wavelength
  linewidthClosed : S.linewidth
  modulationResponseClosed : S.modulationResponse
  temperatureStabilityClosed : S.temperatureStability

def LaserDiodeCharacteristicsClosed (S : LaserDiodeCharacteristicsPackage) : Prop :=
  S.thresholdCurrent ∧ S.slopeEfficiency ∧ S.wavelength ∧ S.linewidth ∧ S.modulationResponse ∧ S.temperatureStability

theorem laser_diode_characteristics_closed_from_evidence
    (S : LaserDiodeCharacteristicsPackage) (E : LaserDiodeCharacteristicsEvidence S) :
    LaserDiodeCharacteristicsClosed S := by
  exact And.intro E.thresholdCurrentClosed
    (And.intro E.slopeEfficiencyClosed
      (And.intro E.wavelengthClosed
        (And.intro E.linewidthClosed
          (And.intro E.modulationResponseClosed E.temperatureStabilityClosed))))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse
