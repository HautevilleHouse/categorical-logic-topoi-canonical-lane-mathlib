import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure LogicalMorphismPackage where
  sourceTopos : Type u
  targetTopos : Type v
  functor : Type w
  preservesFiniteLimits : Prop
  preservesExponentials : Prop
  preservesSubobjectClassifier : Prop
  preservesFiniteLimitsTerm : preservesFiniteLimits
  preservesExponentialsTerm : preservesExponentials
  preservesSubobjectClassifierTerm : preservesSubobjectClassifier

structure LogicalMorphismEvidence (L : LogicalMorphismPackage) where
  preservesFiniteLimitsClosed : L.preservesFiniteLimits
  preservesExponentialsClosed : L.preservesExponentials
  preservesSubobjectClassifierClosed : L.preservesSubobjectClassifier

def LogicalMorphismClosed (L : LogicalMorphismPackage) : Prop :=
  L.preservesFiniteLimits ∧ L.preservesExponentials ∧ L.preservesSubobjectClassifier

theorem logical_morphism_closed_from_evidence (L : LogicalMorphismPackage)
    (E : LogicalMorphismEvidence L) : LogicalMorphismClosed L := by
  exact And.intro E.preservesFiniteLimitsClosed
    (And.intro E.preservesExponentialsClosed E.preservesSubobjectClassifierClosed)

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse