import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure OpticalFiberPropagationPackage where
  attenuation : Type u
  dispersion : Type v
  nonlinearity : Prop
  modeProfile : Prop
  polarization : Prop
  couplingEfficiency : Prop

structure OpticalFiberPropagationEvidence (N : OpticalFiberPropagationPackage) where
  attenuationClosed : N.attenuation
  dispersionClosed : N.dispersion
  nonlinearityClosed : N.nonlinearity
  modeProfileClosed : N.modeProfile
  polarizationClosed : N.polarization
  couplingEfficiencyClosed : N.couplingEfficiency

def OpticalFiberPropagationClosed (N : OpticalFiberPropagationPackage) : Prop :=
  N.attenuation ∧ N.dispersion ∧ N.nonlinearity ∧ N.modeProfile ∧ N.polarization ∧ N.couplingEfficiency

theorem optical_fiber_propagation_closed_from_evidence
    (N : OpticalFiberPropagationPackage) (E : OpticalFiberPropagationEvidence N) :
    OpticalFiberPropagationClosed N := by
  exact And.intro E.attenuationClosed
    (And.intro E.dispersionClosed
      (And.intro E.nonlinearityClosed
        (And.intro E.modeProfileClosed
          (And.intro E.polarizationClosed E.couplingEfficiencyClosed))))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse
