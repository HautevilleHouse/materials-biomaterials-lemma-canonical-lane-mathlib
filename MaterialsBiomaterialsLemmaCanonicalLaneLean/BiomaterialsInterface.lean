import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure SurfaceChemistry where
  surfaceFunctionalGroups : Prop
  adsorptionEnergy : Prop
  chargeState : Prop
  wettability : Prop

structure ProteinInteraction where
  proteinAttachment : Prop
  conformationChange : Prop
  cellBinding : Prop

structure BiomaterialsInterfacePackage where
  surface : SurfaceChemistry
  protein : ProteinInteraction
  biocompatibility : Prop
  immuneResponse : Prop
  degradationRate : Prop

structure BiomaterialsInterfaceEvidence (B : BiomaterialsInterfacePackage) where
  biocompatibilityClosed : B.biocompatibility
  immuneResponseClosed : B.immuneResponse
  degradationRateClosed : B.degradationRate

def BiomaterialsInterfaceClosed (B : BiomaterialsInterfacePackage) : Prop :=
  B.biocompatibility ∧ B.immuneResponse ∧ B.degradationRate

theorem biomaterials_interface_closed_from_evidence (B : BiomaterialsInterfacePackage)
    (E : BiomaterialsInterfaceEvidence B) : BiomaterialsInterfaceClosed B := by
  exact And.intro E.biocompatibilityClosed
    (And.intro E.immuneResponseClosed E.degradationRateClosed)

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse