import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure ElasticityTensorPackage where
  strain : Type u
  stress : Type v
  stiffnessTensor : Type w
  hookesLawLinear : Prop
  symmetryConditions : Prop
  positiveDefiniteness : Prop

structure ElasticityTensorEvidence (E : ElasticityTensorPackage) where
  hookesLawLinearClosed : E.hookesLawLinear
  symmetryConditionsClosed : E.symmetryConditions
  positiveDefinitenessClosed : E.positiveDefiniteness

def ElasticityTensorClosed (E : ElasticityTensorPackage) : Prop :=
  E.hookesLawLinear ∧ E.symmetryConditions ∧ E.positiveDefiniteness

theorem elasticity_tensor_closed_from_evidence (E : ElasticityTensorPackage) (Ev : ElasticityTensorEvidence E) : ElasticityTensorClosed E := by
  exact And.intro Ev.hookesLawLinearClosed (And.intro Ev.symmetryConditionsClosed Ev.positiveDefinitenessClosed)

end HautevilleHouse
namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse