import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsBiomaterialsLemmaCanonicalLaneLean.CrystalStructure

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure PhaseDiagram where
  components : List String
  phases : List String
  transitionTemperatures : List Float
  pressureRange : Float × Float

default

structure PhaseDiagramEvidence (P : PhaseDiagram) where
  componentsDefined : P.components ≠ []
  phasesDefined : P.phases ≠ []
  transitionTemperaturesDefined : P.transitionTemperatures ≠ []
  pressureRangeValid : P.pressureRange.1 < P.pressureRange.2

def PhaseDiagramClosed (P : PhaseDiagram) : Prop :=
  P.components ≠ [] ∧ P.phases ≠ [] ∧ P.transitionTemperatures ≠ [] ∧ P.pressureRange.1 < P.pressureRange.2

theorem phase_diagram_closed_from_evidence (P : PhaseDiagram) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ ?_))
  · exact E.componentsDefined
  · exact E.phasesDefined
  · exact E.transitionTemperaturesDefined
  · exact E.pressureRangeValid

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse
