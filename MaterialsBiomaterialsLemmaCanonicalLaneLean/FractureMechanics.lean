import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure CrackGeometry where
  crackLength : Prop
  crackTipRadius : Prop
  stressIntensityFactor : Prop
  modeOfLoading : Prop

structure FractureMechanicsPackage where
  crack : CrackGeometry
  fractureToughness : Prop
  energyReleaseRate : Prop
  griffithCriterion : Prop
  fatigueCrackGrowth : Prop
  daNCurve : Prop

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  fractureToughnessClosed : F.fractureToughness
  energyReleaseRateClosed : F.energyReleaseRate
  griffithCriterionClosed : F.griffithCriterion
  fatigueCrackGrowthClosed : F.fatigueCrackGrowth
  daNCurveClosed : F.daNCurve

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.fractureToughness ∧ F.energyReleaseRate ∧
  F.griffithCriterion ∧ F.fatigueCrackGrowth ∧ F.daNCurve

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage)
    (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  exact And.intro E.fractureToughnessClosed
    (And.intro E.energyReleaseRateClosed
      (And.intro E.griffithCriterionClosed
        (And.intro E.fatigueCrackGrowthClosed E.daNCurveClosed)))

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse