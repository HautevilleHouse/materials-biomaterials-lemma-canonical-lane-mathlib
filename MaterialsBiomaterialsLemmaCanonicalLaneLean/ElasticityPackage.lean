import MaterialsBiomaterialsLemmaCanonicalLaneLean.PhaseDiagramPackage

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure ElasticityPackage {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} {D : PhaseDiagramPackage P} (E : StressStrainPackage) where
  youngsModulusDerived : Prop
  poissonRatioDerived : Prop
  shearModulusDerived : Prop
  bulkModulusDerived : Prop
  isotropyConditionMet : Prop
  linearElasticityClosure : Prop

structure ElasticityEvidence {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} {D : PhaseDiagramPackage P} {E : StressStrainPackage} (El : ElasticityPackage E) where
  youngsModulusDerivedClosed : El.youngsModulusDerived
  poissonRatioDerivedClosed : El.poissonRatioDerived
  shearModulusDerivedClosed : El.shearModulusDerived
  bulkModulusDerivedClosed : El.bulkModulusDerived
  isotropyConditionMetClosed : El.isotropyConditionMet
  linearElasticityClosureClosed : El.linearElasticityClosure

def ElasticityClosed {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} {D : PhaseDiagramPackage P} {E : StressStrainPackage} (El : ElasticityPackage E) : Prop :=
  El.youngsModulusDerived ∧ El.poissonRatioDerived ∧ El.shearModulusDerived ∧ El.bulkModulusDerived ∧ El.isotropyConditionMet ∧ El.linearElasticityClosure

theorem elasticity_closed_from_evidence {G : GibbsEnergyPackage} {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} {C : CrystallographyPackage T} {P : PhaseStabilityPackage G} {D : PhaseDiagramPackage P} {E : StressStrainPackage} (El : ElasticityPackage E) (Ev : ElasticityEvidence El) : ElasticityClosed El := by
  exact And.intro Ev.youngsModulusDerivedClosed
    (And.intro Ev.poissonRatioDerivedClosed
      (And.intro Ev.shearModulusDerivedClosed
        (And.intro Ev.bulkModulusDerivedClosed
          (And.intro Ev.isotropyConditionMetClosed Ev.linearElasticityClosureClosed))))

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse