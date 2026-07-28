import CategoricalLogicTopoiCanonicalLaneLean.ElementaryTopoi

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure BooleanToposPackage where
  elementaryTopos : ElementaryTopoiPackage
  excludedMiddle : Prop
  doubleNegationClosure : Prop
  excludedMiddleClosed : excludedMiddle
  doubleNegationClosureClosed : doubleNegationClosure

structure BooleanToposEvidence (B : BooleanToposPackage) where
  elementaryToposClosed : ElementaryTopoiClosed B.elementaryTopos
  excludedMiddleClosed : B.excludedMiddleClosed
  doubleNegationClosureClosed : B.doubleNegationClosureClosed

def BooleanToposClosed (B : BooleanToposPackage) : Prop :=
  ElementaryTopoiClosed B.elementaryTopos ∧ B.excludedMiddle ∧ B.doubleNegationClosure

theorem boolean_topos_closed_from_evidence
    (B : BooleanToposPackage) (E : BooleanToposEvidence B) :
    BooleanToposClosed B := by
  exact And.intro E.elementaryToposClosed
    (And.intro E.excludedMiddleClosed E.doubleNegationClosureClosed)

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse
