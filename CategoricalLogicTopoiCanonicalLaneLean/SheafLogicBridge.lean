import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure SheafLogicPackage where
  site : Type u
  coverage : Type v
  sheafCondition : Prop
  internalLogic : Prop
  sheafification : Prop
  sheafConditionTerm : sheafCondition
  internalLogicTerm : internalLogic
  sheafificationTerm : sheafification

structure SheafLogicEvidence (S : SheafLogicPackage) where
  sheafConditionClosed : S.sheafCondition
  internalLogicClosed : S.internalLogic
  sheafificationClosed : S.sheafification

def SheafLogicClosed (S : SheafLogicPackage) : Prop :=
  S.sheafCondition ∧ S.internalLogic ∧ S.sheafification

theorem sheaf_logic_closed_from_evidence (S : SheafLogicPackage)
    (E : SheafLogicEvidence S) : SheafLogicClosed S := by
  exact And.intro E.sheafConditionClosed
    (And.intro E.internalLogicClosed E.sheafificationClosed)

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse