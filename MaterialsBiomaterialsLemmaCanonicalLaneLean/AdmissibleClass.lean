import MaterialsBiomaterialsLemmaCanonicalLaneLean.Crystallography
import MaterialsBiomaterialsLemmaCanonicalLaneLean.PhaseDiagram
import MaterialsBiomaterialsLemmaCanonicalLaneLean.Elasticity
import MaterialsBiomaterialsLemmaCanonicalLaneLean.FractureMechanics
import MaterialsBiomaterialsLemmaCanonicalLaneLean.BiomaterialsInterface

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure MaterialsAdmittedObject where
  crystal : CrystallographyPackage
  phase : PhaseDiagramPackage
  elastic : ElasticityPackage
  fracture : FractureMechanicsPackage
  bio : BiomaterialsInterfacePackage
  conclusion : CrystallographyClosed crystal ∧ PhaseDiagramClosed phase ∧
    ElasticityClosed elastic ∧ FractureMechanicsClosed fracture ∧
    BiomaterialsInterfaceClosed bio

structure AdmissibleClass where
  object : MaterialsAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse