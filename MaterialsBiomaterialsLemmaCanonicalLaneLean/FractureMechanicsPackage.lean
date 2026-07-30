import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure FractureMechanicsPackage where
  crackGeometry : Type u
  stressIntensityFactor : Type v
  fractureCriterion : Prop
  energyReleaseRate : Prop
  crackPropagationLaw : Prop
  fractureCriterionTerm : fractureCriterion
  energyReleaseRateTerm : energyReleaseRate
  crackPropagationLawTerm : crackPropagationLaw

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  fractureCriterionClosed : F.fractureCriterion
  energyReleaseRateClosed : F.energyReleaseRate
  crackPropagationLawClosed : F.crackPropagationLaw

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.fractureCriterion ∧ F.energyReleaseRate ∧ F.crackPropagationLaw

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage)
    (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  exact And.intro E.fractureCriterionClosed
    (And.intro E.energyReleaseRateClosed E.crackPropagationLawClosed)

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse