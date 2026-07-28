import CategoricalLogicTopoiCanonicalLaneLean.GrothendieckTopology

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure SheafConditionPackage (G : GrothendieckTopologyPackage) where
  presheaf : Type u → Type v
  matchingFamilies : Prop
  amalgamationProperty : Prop
  uniqueness : Prop

structure SheafConditionEvidence {G : GrothendieckTopologyPackage}
    (S : SheafConditionPackage G) where
  matchingFamiliesClosed : S.matchingFamilies
  amalgamationPropertyClosed : S.amalgamationProperty
  uniquenessClosed : S.uniqueness

def SheafConditionClosed {G : GrothendieckTopologyPackage}
    (S : SheafConditionPackage G) : Prop :=
  S.matchingFamilies ∧ S.amalgamationProperty ∧ S.uniqueness

theorem sheaf_condition_closed_from_evidence
    {G : GrothendieckTopologyPackage} (S : SheafConditionPackage G)
    (E : SheafConditionEvidence S) : SheafConditionClosed S := by
  exact And.intro E.matchingFamiliesClosed
    (And.intro E.amalgamationPropertyClosed E.uniquenessClosed)

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse