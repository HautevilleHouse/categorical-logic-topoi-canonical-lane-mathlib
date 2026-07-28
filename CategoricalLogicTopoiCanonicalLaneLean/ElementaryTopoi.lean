import CategoricalLogicTopoiCanonicalLaneLean.SubobjectClassifier

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure ElementaryTopoiPackage where
  finiteLimits : Prop
  exponentials : Prop
  subobjectClassifier : SubobjectClassifierPackage
  finiteLimitsClosed : finiteLimits
  exponentialsClosed : exponentials

structure ElementaryTopoiEvidence (T : ElementaryTopoiPackage) where
  finiteLimitsClosed : T.finiteLimitsClosed
  exponentialsClosed : T.exponentialsClosed
  subobjectClassifierClosed : SubobjectClassifierClosed T.subobjectClassifier

def ElementaryTopoiClosed (T : ElementaryTopoiPackage) : Prop :=
  T.finiteLimits ∧ T.exponentials ∧ SubobjectClassifierClosed T.subobjectClassifier

theorem elementary_topoi_closed_from_evidence
    (T : ElementaryTopoiPackage) (E : ElementaryTopoiEvidence T) :
    ElementaryTopoiClosed T := by
  exact And.intro E.finiteLimitsClosed
    (And.intro E.exponentialsClosed E.subobjectClassifierClosed)

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse
