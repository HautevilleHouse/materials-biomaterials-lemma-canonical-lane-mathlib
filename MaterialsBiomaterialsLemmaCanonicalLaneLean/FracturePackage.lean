import MaterialsBiomaterialsLemmaCanonicalLaneLean.ElasticityPackage

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure FracturePackage {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} {D : PhaseDiagramPackage P} {E : StressStrainPackage} {El : ElasticityPackage E} (F : StressIntensityPackage) where
  stressIntensityFactorDerived : Prop
  fractureToughnessMeasured : Prop
  parisLawCompliance : Prop
  griffithCriterionSatisfied : Prop
  crackPropagationSimulated : Prop
  fatigueLifePredicted : Prop
  failureEnvelopeConstructed : Prop

structure FractureEvidence {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} {D : PhaseDiagramPackage P} {E : StressStrainPackage} {El : ElasticityPackage E} {F : StressIntensityPackage} (Fr : FracturePackage F) where
  stressIntensityFactorDerivedClosed : Fr.stressIntensityFactorDerived
  fractureToughnessMeasuredClosed : Fr.fractureToughnessMeasured
  parisLawComplianceClosed : Fr.parisLawCompliance
  griffithCriterionSatisfiedClosed : Fr.griffithCriterionSatisfied
  crackPropagationSimulatedClosed : Fr.crackPropagationSimulated
  fatigueLifePredictedClosed : Fr.fatigueLifePredicted
  failureEnvelopeConstructedClosed : Fr.failureEnvelopeConstructed

def FractureClosed {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} {D : PhaseDiagramPackage P} {E : StressStrainPackage} {El : ElasticityPackage E} {F : StressIntensityPackage} (Fr : FracturePackage F) : Prop :=
  Fr.stressIntensityFactorDerived ∧ Fr.fractureToughnessMeasured ∧ Fr.parisLawCompliance ∧ Fr.griffithCriterionSatisfied ∧ Fr.crackPropagationSimulated ∧ Fr.fatigueLifePredicted ∧ Fr.failureEnvelopeConstructed

theorem fracture_closed_from_evidence {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} {D : PhaseDiagramPackage P} {E : StressStrainPackage} {El : ElasticityPackage E} {F : StressIntensityPackage} (Fr : FracturePackage F) (Ev : FractureEvidence Fr) : FractureClosed Fr := by
  exact And.intro Ev.stressIntensityFactorDerivedClosed
    (And.intro Ev.fractureToughnessMeasuredClosed
      (And.intro Ev.parisLawComplianceClosed
        (And.intro Ev.griffithCriterionSatisfiedClosed
          (And.intro Ev.crackPropagationSimulatedClosed
            (And.intro Ev.fatigueLifePredictedClosed Ev.failureEnvelopeConstructedClosed)))))

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse