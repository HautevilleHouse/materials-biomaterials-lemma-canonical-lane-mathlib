import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure StressStrainTensor where
  stressTensor : Prop
  strainTensor : Prop
  constitutiveRelation : Prop
  linearElastic : Prop

structure ElasticityPackage where
  tensorPair : StressStrainTensor
  youngModulus : Prop
  poissonRatio : Prop
  bulkModulus : Prop
  elasticityTensorSymmetries : Prop
  compatibilityCondition : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  youngModulusClosed : E.youngModulus
  poissonRatioClosed : E.poissonRatio
  bulkModulusClosed : E.bulkModulus
  elasticityTensorSymmetriesClosed : E.elasticityTensorSymmetries
  compatibilityConditionClosed : E.compatibilityCondition

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.youngModulus ∧ E.poissonRatio ∧ E.bulkModulus ∧
  E.elasticityTensorSymmetries ∧ E.compatibilityCondition

theorem elasticity_closed_from_evidence (E : ElasticityPackage)
    (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.youngModulusClosed
    (And.intro Ev.poissonRatioClosed
      (And.intro Ev.bulkModulusClosed
        (And.intro Ev.elasticityTensorSymmetriesClosed Ev.compatibilityConditionClosed)))

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse