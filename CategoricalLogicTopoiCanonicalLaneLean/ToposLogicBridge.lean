import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure ToposLogicPackage where
  topos : Type u
  subobjectClassifier : Type v
  truthValueObject : Type w
  logicInternal : Prop
  soundness : Prop
  completeness : Prop
  soundnessTerm : soundness
  completenessTerm : completeness

structure ToposLogicEvidence (P : ToposLogicPackage) where
  logicInternalClosed : P.logicInternal
  soundnessClosed : P.soundness
  completenessClosed : P.completeness

def ToposLogicClosed (P : ToposLogicPackage) : Prop :=
  P.logicInternal ∧ P.soundness ∧ P.completeness

theorem topos_logic_closed_from_evidence (P : ToposLogicPackage)
    (E : ToposLogicEvidence P) : ToposLogicClosed P := by
  exact And.intro E.logicInternalClosed
    (And.intro E.soundnessClosed E.completenessClosed)

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse