import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure CrystalStructure where
  latticeType : String
  basisVectors : List (Float × Float × Float)
  symmetryGroup : String
  unitCellVolume : Float

default

structure CrystalStructureEvidence (C : CrystalStructure) where
  latticeTypeDetermined : Prop
  basisVectorsDetermined : Prop
  symmetryGroupDetermined : Prop
  unitCellVolumePositive : C.unitCellVolume > 0

def CrystalStructureClosed (C : CrystalStructure) : Prop :=
  C.latticeType ≠ "" ∧ C.basisVectors ≠ [] ∧ C.symmetryGroup ≠ "" ∧ C.unitCellVolume > 0

theorem crystal_structure_closed_from_evidence (C : CrystalStructure) (E : CrystalStructureEvidence C) :
    CrystalStructureClosed C := by
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ ?_))
  · exact E.latticeTypeDetermined
  · exact E.basisVectorsDetermined
  · exact E.symmetryGroupDetermined
  · exact E.unitCellVolumePositive

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse
