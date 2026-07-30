import MaterialsBiomaterialsLemmaCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MaterialsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse