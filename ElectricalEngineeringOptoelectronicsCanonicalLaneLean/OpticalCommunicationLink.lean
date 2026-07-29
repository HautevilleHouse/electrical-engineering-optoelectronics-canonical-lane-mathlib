import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringOptoelectronicsCanonicalLaneLean

structure OpticalCommunicationLinkPackage where
  transmitter : Type u
  receiver : Type u
  fiberChannel : Type u
  bitRate : Prop
  transmissionReach : Prop
  signalToNoiseRatio : Prop

structure OpticalCommunicationLinkEvidence (L : OpticalCommunicationLinkPackage) where
  transmitterClosed : L.transmitter
  receiverClosed : L.receiver
  fiberChannelClosed : L.fiberChannel
  bitRateClosed : L.bitRate
  transmissionReachClosed : L.transmissionReach
  signalToNoiseRatioClosed : L.signalToNoiseRatio

def OpticalCommunicationLinkClosed (L : OpticalCommunicationLinkPackage) : Prop :=
  L.transmitter ∧ L.receiver ∧ L.fiberChannel ∧ L.bitRate ∧ L.transmissionReach ∧ L.signalToNoiseRatio

theorem optical_communication_link_closed_from_evidence (L : OpticalCommunicationLinkPackage)
    (E : OpticalCommunicationLinkEvidence L) : OpticalCommunicationLinkClosed L := by
  exact And.intro E.transmitterClosed
    (And.intro E.receiverClosed
      (And.intro E.fiberChannelClosed
        (And.intro E.bitRateClosed
          (And.intro E.transmissionReachClosed E.signalToNoiseRatioClosed))))

end ElectricalEngineeringOptoelectronicsCanonicalLaneLean
end HautevilleHouse