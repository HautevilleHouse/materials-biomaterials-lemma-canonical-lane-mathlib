import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure BiomaterialsInterfacePackage where
  substrate : Type u
  coating : Type v
  adhesionStrength : Prop
  biocompatibility : Prop
  degradationRate : Prop
  adhesionStrengthTerm : adhesionStrength
  biocompatibilityTerm : biocompatibility
  degradationRateTerm : degradationRate

structure BiomaterialsInterfaceEvidence (B : BiomaterialsInterfacePackage) where
  adhesionStrengthClosed : B.adhesionStrength
  biocompatibilityClosed : B.biocompatibility
  degradationRateClosed : B.degradationRate

def BiomaterialsInterfaceClosed (B : BiomaterialsInterfacePackage) : Prop :=
  B.adhesionStrength ∧ B.biocompatibility ∧ B.degradationRate

theorem biomaterials_interface_closed_from_evidence (B : BiomaterialsInterfacePackage)
    (E : BiomaterialsInterfaceEvidence B) : BiomaterialsInterfaceClosed B := by
  exact And.intro E.adhesionStrengthClosed
    (And.intro E.biocompatibilityClosed E.degradationRateClosed)

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse