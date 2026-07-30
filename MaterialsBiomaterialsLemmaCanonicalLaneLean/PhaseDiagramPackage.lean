import MaterialsBiomaterialsLemmaCanonicalLaneLean.CrystallographyPackage

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure PhaseDiagramPackage {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} (P : PhaseStabilityPackage G) where
  phaseBoundariesEnumerated : Prop
  invariantReactionsListed : Prop
  leverRuleApplied : Prop
  gibbsPhaseRuleSatisfied : Prop
  tieLineConstruction : Prop
  stabilityRegionsIdentified : Prop

structure PhaseDiagramEvidence {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} (D : PhaseDiagramPackage P) where
  phaseBoundariesEnumeratedClosed : D.phaseBoundariesEnumerated
  invariantReactionsListedClosed : D.invariantReactionsListed
  leverRuleAppliedClosed : D.leverRuleApplied
  gibbsPhaseRuleSatisfiedClosed : D.gibbsPhaseRuleSatisfied
  tieLineConstructionClosed : D.tieLineConstruction
  stabilityRegionsIdentifiedClosed : D.stabilityRegionsIdentified

def PhaseDiagramClosed {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} (D : PhaseDiagramPackage P) : Prop :=
  D.phaseBoundariesEnumerated ∧ D.invariantReactionsListed ∧ D.leverRuleApplied ∧ D.gibbsPhaseRuleSatisfied ∧ D.tieLineConstruction ∧ D.stabilityRegionsIdentified

theorem phase_diagram_closed_from_evidence {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} (D : PhaseDiagramPackage P) (E : PhaseDiagramEvidence D) : PhaseDiagramClosed D := by
  exact And.intro E.phaseBoundariesEnumeratedClosed
    (And.intro E.invariantReactionsListedClosed
      (And.intro E.leverRuleAppliedClosed
        (And.intro E.gibbsPhaseRuleSatisfiedClosed
          (And.intro E.tieLineConstructionClosed E.stabilityRegionsIdentifiedClosed))))

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse