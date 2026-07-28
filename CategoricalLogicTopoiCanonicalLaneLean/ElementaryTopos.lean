import canonicalLaneMathlib.AdmissibleClass
import CategoricalLogicTopoiCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure ElementaryToposPackage where
  object : ToposObject
  hasAllFiniteLimits : Prop
  hasSubobjectClassifier : Prop
  hasExponentials : Prop
  isHeytingCategory : Prop

structure ElementaryToposEvidence (E : ElementaryToposPackage) where
  hasAllFiniteLimitsClosed : E.hasAllFiniteLimits
  hasSubobjectClassifierClosed : E.hasSubobjectClassifier
  hasExponentialsClosed : E.hasExponentials
  isHeytingCategoryClosed : E.isHeytingCategory

def ElementaryToposClosed (E : ElementaryToposPackage) : Prop :=
  E.hasAllFiniteLimits ∧ E.hasSubobjectClassifier ∧
  E.hasExponentials ∧ E.isHeytingCategory

theorem elementary_topos_closed_from_evidence (E : ElementaryToposPackage)
    (Ev : ElementaryToposEvidence E) : ElementaryToposClosed E := by
  exhaustive

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse