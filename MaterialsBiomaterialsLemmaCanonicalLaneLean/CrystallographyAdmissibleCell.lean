import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure UnitCell (A : Type) where
  latticeVectors : List A
  volume : ℝ
  symmetryGroup : Nat
  primitive : Prop

def cellVolumeClosed (cell : UnitCell ℝ) : Prop :=
  cell.volume > 0

theorem cell_volume_positive (cell : UnitCell ℝ) (h : cell.primitive) :
    cellVolumeClosed cell := by
  exact h

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse