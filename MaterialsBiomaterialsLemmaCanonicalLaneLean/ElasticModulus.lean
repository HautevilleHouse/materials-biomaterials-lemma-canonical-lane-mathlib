import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsBiomaterialsLemmaCanonicalLaneLean.CrystalStructure

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure ElasticModulus where
  youngModulus : Float
  poissonRatio : Float
  shearModulus : Float
  bulkModulus : Float

default

structure ElasticModulusEvidence (E : ElasticModulus) where
  youngPositive : E.youngModulus > 0
  poissonInRange : -1 < E.poissonRatio ∧ E.poissonRatio < 0.5
  shearPositive : E.shearModulus > 0
  bulkPositive : E.bulkModulus > 0

def ElasticModulusClosed (E : ElasticModulus) : Prop :=
  E.youngModulus > 0 ∧ (-1 < E.poissonRatio ∧ E.poissonRatio < 0.5) ∧ E.shearModulus > 0 ∧ E.bulkModulus > 0

theorem elastic_modulus_closed_from_evidence (E : ElasticModulus) (Ev : ElasticModulusEvidence E) :
    ElasticModulusClosed E := by
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ ?_))
  · exact Ev.youngPositive
  · exact Ev.poissonInRange
  · exact Ev.shearPositive
  · exact Ev.bulkPositive

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse
