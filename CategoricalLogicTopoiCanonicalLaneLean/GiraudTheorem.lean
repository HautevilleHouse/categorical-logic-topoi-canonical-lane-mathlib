import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure GiraudTheoremPackage where
  category : Type
  grothendieckTopos : Prop
  exactnessConditions : Prop
  generatingSet : Prop
  colimitPreservation : Prop
  subobjectClassifier : Prop
  equivalenceToSheafTopos : Prop

structure GiraudTheoremEvidence (G : GiraudTheoremPackage) where
  grothendieckToposClosed : G.grothendieckTopos
  exactnessConditionsClosed : G.exactnessConditions
  generatingSetClosed : G.generatingSet
  colimitPreservationClosed : G.colimitPreservation
  subobjectClassifierClosed : G.subobjectClassifier
  equivalenceToSheafToposClosed : G.equivalenceToSheafTopos

def GiraudTheoremClosed (G : GiraudTheoremPackage) : Prop :=
  G.grothendieckTopos ∧ G.exactnessConditions ∧ G.generatingSet ∧
  G.colimitPreservation ∧ G.subobjectClassifier ∧ G.equivalenceToSheafTopos

theorem giraud_theorem_closed_from_evidence (G : GiraudTheoremPackage) (E : GiraudTheoremEvidence G) :
    GiraudTheoremClosed G := by
  exact And.intro E.grothendieckToposClosed
    (And.intro E.exactnessConditionsClosed
      (And.intro E.generatingSetClosed
        (And.intro E.colimitPreservationClosed
          (And.intro E.subobjectClassifierClosed E.equivalenceToSheafToposClosed))))

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse