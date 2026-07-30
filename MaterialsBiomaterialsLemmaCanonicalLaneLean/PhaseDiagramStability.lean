import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsLemmaCanonicalLaneLean

structure PhaseDiagram (T : Type) (P : Type) where
  temperatureDomain : Set ℝ
  pressureDomain : Set ℝ
  phases : List String
  transitionBoundaries : Prop

def phaseStabilityCondition (ΔG : ℝ) : Prop :=
  ΔG < 0

theorem stable_phase_condition (ΔG : ℝ) (h : ΔG < 0) : phaseStabilityCondition ΔG := h

end MaterialsBiomaterialsLemmaCanonicalLaneLean
end HautevilleHouse