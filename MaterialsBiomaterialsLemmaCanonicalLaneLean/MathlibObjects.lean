import MaterialsBiomaterialsLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MaterialsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure MaterialsAdmittedObject where
  space : MaterialsSpace
  crystallineStructure : Prop
  mechanicalProperties : Prop
  model : Type
  modelTopology : TopologicalSpace model
  admissibleConclusion : Prop
  conclusion : admissibleConclusion

structure MaterialsEndgameState where
  object : MaterialsAdmittedObject

def MaterialsWitnessClosed (O : MaterialsAdmittedObject) : Prop :=
  O.admissibleConclusion

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse