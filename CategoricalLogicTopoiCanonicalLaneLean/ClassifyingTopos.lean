import CategoricalLogicTopoiCanonicalLaneLean.SheafCondition

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure ClassifyingToposPackage (G : GrothendieckTopologyPackage)
    (S : SheafConditionPackage G) where
  theory : Type
  modelsInTopos : Prop
  universalProperty : Prop
  geometricMorphismExistence : Prop

structure ClassifyingToposEvidence {G : GrothendieckTopologyPackage}
    {S : SheafConditionPackage G} (C : ClassifyingToposPackage G S) where
  modelsInToposClosed : C.modelsInTopos
  universalPropertyClosed : C.universalProperty
  geometricMorphismExistenceClosed : C.geometricMorphismExistence

def ClassifyingToposClosed {G : GrothendieckTopologyPackage}
    {S : SheafConditionPackage G} (C : ClassifyingToposPackage G S) : Prop :=
  C.modelsInTopos ∧ C.universalProperty ∧ C.geometricMorphismExistence

theorem classifying_topos_closed_from_evidence
    {G : GrothendieckTopologyPackage} {S : SheafConditionPackage G}
    (C : ClassifyingToposPackage G S) (E : ClassifyingToposEvidence C) :
    ClassifyingToposClosed C := by
  exact And.intro E.modelsInToposClosed
    (And.intro E.universalPropertyClosed E.geometricMorphismExistenceClosed)

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse