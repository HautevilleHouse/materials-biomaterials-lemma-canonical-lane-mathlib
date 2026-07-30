import MaterialsBiomaterialsLemmaCanonicalLaneLean.FracturePackage

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure BiomaterialsPackage {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} {D : PhaseDiagramPackage P} {E : StressStrainPackage} {El : ElasticityPackage E} {F : StressIntensityPackage} {Fr : FracturePackage F} (B : BiocompatibilityPackage) where
  biocompatibilityAssessed : Prop
  degradationProfileModeled : Prop
  mechanicalMatchValidated : Prop
  bioactivityDemonstrated : Prop
  sterilizationCompatibility : Prop
  inVivoPerformancePredicted : Prop

structure BiomaterialsEvidence {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} {D : PhaseDiagramPackage P} {E : StressStrainPackage} {El : ElasticityPackage E} {F : StressIntensityPackage} {Fr : FracturePackage F} {B : BiocompatibilityPackage} (Bi : BiomaterialsPackage B) where
  biocompatibilityAssessedClosed : Bi.biocompatibilityAssessed
  degradationProfileModeledClosed : Bi.degradationProfileModeled
  mechanicalMatchValidatedClosed : Bi.mechanicalMatchValidated
  bioactivityDemonstratedClosed : Bi.bioactivityDemonstrated
  sterilizationCompatibilityClosed : Bi.sterilizationCompatibility
  inVivoPerformancePredictedClosed : Bi.inVivoPerformancePredicted

def BiomaterialsClosed {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} {D : PhaseDiagramPackage P} {E : StressStrainPackage} {El : ElasticityPackage E} {F : StressIntensityPackage} {Fr : FracturePackage F} {B : BiocompatibilityPackage} (Bi : BiomaterialsPackage B) : Prop :=
  Bi.biocompatibilityAssessed ∧ Bi.degradationProfileModeled ∧ Bi.mechanicalMatchValidated ∧ Bi.bioactivityDemonstrated ∧ Bi.sterilizationCompatibility ∧ Bi.inVivoPerformancePredicted

theorem biomaterials_closed_from_evidence {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} {D : PhaseDiagramPackage P} {E : StressStrainPackage} {El : ElasticityPackage E} {F : StressIntensityPackage} {Fr : FracturePackage F} {B : BiocompatibilityPackage} (Bi : BiomaterialsPackage B) (Ev : BiomaterialsEvidence Bi) : BiomaterialsClosed Bi := by
  exact And.intro Ev.biocompatibilityAssessedClosed
    (And.intro Ev.degradationProfileModeledClosed
      (And.intro Ev.mechanicalMatchValidatedClosed
        (And.intro Ev.bioactivityDemonstratedClosed
          (And.intro Ev.sterilizationCompatibilityClosed Ev.inVivoPerformancePredictedClosed))))

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse