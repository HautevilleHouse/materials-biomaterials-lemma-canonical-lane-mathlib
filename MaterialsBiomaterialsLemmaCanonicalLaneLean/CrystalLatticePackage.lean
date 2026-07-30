import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure CrystalLatticePackage where
  unitCell : Type u
  bravaisLattice : Type v
  latticeConstants : Prop
  symmetryGroup : Prop
  braggCondition : Prop
  latticeConstantsTerm : latticeConstants
  symmetryGroupTerm : symmetryGroup
  braggConditionTerm : braggCondition

structure CrystalLatticeEvidence (C : CrystalLatticePackage) where
  latticeConstantsClosed : C.latticeConstants
  symmetryGroupClosed : C.symmetryGroup
  braggConditionClosed : C.braggCondition

def CrystalLatticeClosed (C : CrystalLatticePackage) : Prop :=
  C.latticeConstants ∧ C.symmetryGroup ∧ C.braggCondition

theorem crystal_lattice_closed_from_evidence (C : CrystalLatticePackage)
    (E : CrystalLatticeEvidence C) : CrystalLatticeClosed C := by
  exact And.intro E.latticeConstantsClosed
    (And.intro E.symmetryGroupClosed E.braggConditionClosed)

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse