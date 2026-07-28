import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure LogicalToposPackage {A : AdmissibleClass} where
  internalLogic : Prop
  subobjectClassifier : Prop
  exponentiation : Prop
  powerObject : Prop

structure LogicalToposEvidence {A : AdmissibleClass} (L : LogicalToposPackage A) where
  internalLogicClosed : L.internalLogic
  subobjectClassifierClosed : L.subobjectClassifier
  exponentiationClosed : L.exponentiation
  powerObjectClosed : L.powerObject

def LogicalToposClosed {A : AdmissibleClass} (L : LogicalToposPackage A) : Prop :=
  L.internalLogic ∧ L.subobjectClassifier ∧ L.exponentiation ∧ L.powerObject

theorem logical_topos_closed_from_evidence {A : AdmissibleClass}
    (L : LogicalToposPackage A) (E : LogicalToposEvidence L) :
    LogicalToposClosed L := by
  exact And.intro E.internalLogicClosed
    (And.intro E.subobjectClassifierClosed
      (And.intro E.exponentiationClosed E.powerObjectClosed))

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse