import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure CrystallographicUnitCell where
  latticeVectors : Type u
  basisAtoms : Type v
  unitCellVolume : Prop
  bravaisLatticeType : Prop
  fractionalCoordinates : Prop

structure CrystallographyPackage where
  cell : CrystallographicUnitCell
  spaceGroupSymmetry : Prop
  diffractionPattern : Prop
  crystalSystem : Prop
  pointGroup : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  spaceGroupSymmetryClosed : C.spaceGroupSymmetry
  diffractionPatternClosed : C.diffractionPattern
  crystalSystemClosed : C.crystalSystem
  pointGroupClosed : C.pointGroup

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.spaceGroupSymmetry ∧ C.diffractionPattern ∧
  C.crystalSystem ∧ C.pointGroup

theorem crystallography_closed_from_evidence (C : CrystallographyPackage)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.spaceGroupSymmetryClosed
    (And.intro E.diffractionPatternClosed
      (And.intro E.crystalSystemClosed E.pointGroupClosed))

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse