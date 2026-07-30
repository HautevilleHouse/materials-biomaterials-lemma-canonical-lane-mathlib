import MaterialsBiomaterialsLemmaCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure CrystallographyPackage {L : LatticeStructurePackage} {S : SpaceGroupPackage} (T : TransformationGroupPackage S) where
  bravaisLatticeClassified : Prop
  spaceGroupDetermined : Prop
  wyckoffPositionsEnumerated : Prop
  systematicAbsencesComputed : Prop

structure CrystallographyEvidence {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} (C : CrystallographyPackage T) where
  bravaisLatticeClassifiedClosed : C.bravaisLatticeClassified
  spaceGroupDeterminedClosed : C.spaceGroupDetermined
  wyckoffPositionsEnumeratedClosed : C.wyckoffPositionsEnumerated
  systematicAbsencesComputedClosed : C.systematicAbsencesComputed

def CrystallographyClosed {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} (C : CrystallographyPackage T) : Prop :=
  C.bravaisLatticeClassified ∧ C.spaceGroupDetermined ∧ C.wyckoffPositionsEnumerated ∧ C.systematicAbsencesComputed

theorem crystallography_closed_from_evidence {L : LatticeStructurePackage} {S : SpaceGroupPackage} {T : TransformationGroupPackage S} (C : CrystallographyPackage T) (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.bravaisLatticeClassifiedClosed
    (And.intro E.spaceGroupDeterminedClosed
      (And.intro E.wyckoffPositionsEnumeratedClosed E.systematicAbsencesComputedClosed))

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse