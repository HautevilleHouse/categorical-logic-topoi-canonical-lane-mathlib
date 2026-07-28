import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure SubobjectClassifierPackage where
  trueMorphism : Type
  classifierObject : Type
  pullbackSquare : Prop
  characteristicMap : Prop
  uniqueness : Prop
  trueMorphismExists : Prop
  classifierObjectExists : Prop
  pullbackSquareClosed : Prop
  characteristicMapClosed : Prop
  uniquenessClosed : Prop

structure SubobjectClassifierEvidence (S : SubobjectClassifierPackage) where
  trueMorphismExistsClosed : S.trueMorphismExists
  classifierObjectExistsClosed : S.classifierObjectExists
  pullbackSquareClosedClosed : S.pullbackSquareClosed
  characteristicMapClosedClosed : S.characteristicMapClosed
  uniquenessClosedClosed : S.uniquenessClosed

def SubobjectClassifierClosed (S : SubobjectClassifierPackage) : Prop :=
  S.trueMorphismExists ∧ S.classifierObjectExists ∧ S.pullbackSquareClosed ∧
  S.characteristicMapClosed ∧ S.uniquenessClosed

theorem subobject_classifier_closed_from_evidence (S : SubobjectClassifierPackage) (E : SubobjectClassifierEvidence S) :
    SubobjectClassifierClosed S := by
  exact And.intro E.trueMorphismExistsClosed
    (And.intro E.classifierObjectExistsClosed
      (And.intro E.pullbackSquareClosedClosed
        (And.intro E.characteristicMapClosedClosed E.uniquenessClosedClosed)))

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse