import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringOptoelectronicsCanonicalLaneLean.SemiconductorOpticalGain

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure LaserRateEquationsPackage {G : SemiconductorGainPackage}
    (Gain : SemiconductorGainPackage) where
  photonRateEquation : Prop
  carrierRateEquation : Prop
  couplingCoefficient : Prop
  steadyStateSolution : Prop
  smallSignalResponse : Prop

structure LaserRateEquationsEvidence {G : SemiconductorGainPackage}
    {Gain : SemiconductorGainPackage} (L : LaserRateEquationsPackage Gain) where
  photonRateEquationClosed : L.photonRateEquation
  carrierRateEquationClosed : L.carrierRateEquation
  couplingCoefficientClosed : L.couplingCoefficient
  steadyStateSolutionClosed : L.steadyStateSolution
  smallSignalResponseClosed : L.smallSignalResponse

def LaserRateEquationsClosed {G : SemiconductorGainPackage}
    {Gain : SemiconductorGainPackage} (L : LaserRateEquationsPackage Gain) : Prop :=
  L.photonRateEquation ∧ L.carrierRateEquation ∧
  L.couplingCoefficient ∧ L.steadyStateSolution ∧ L.smallSignalResponse

theorem laser_rate_equations_closed_from_evidence
    {G : SemiconductorGainPackage} {Gain : SemiconductorGainPackage}
    (L : LaserRateEquationsPackage Gain) (E : LaserRateEquationsEvidence L) :
    LaserRateEquationsClosed L := by
  exact And.intro E.photonRateEquationClosed
    (And.intro E.carrierRateEquationClosed
      (And.intro E.couplingCoefficientClosed
        (And.intro E.steadyStateSolutionClosed E.smallSignalResponseClosed)))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse