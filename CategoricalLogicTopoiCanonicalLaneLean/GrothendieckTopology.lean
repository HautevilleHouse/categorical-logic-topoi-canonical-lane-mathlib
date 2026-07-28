import CategoricalLogicTopoiCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure GrothendieckTopologyPackage where
  underlyingCategory : Type u
  coveringFamilies : underlyingCategory → Set (Set (Arrow underlyingCategory))
  pullbackStability : Prop
  localCharacter : Prop
  transitivity : Prop

structure GrothendieckTopologyEvidence (G : GrothendieckTopologyPackage) where
  pullbackStabilityClosed : G.pullbackStability
  localCharacterClosed : G.localCharacter
  transitivityClosed : G.transitivity

def GrothendieckTopologyClosed (G : GrothendieckTopologyPackage) : Prop :=
  G.pullbackStability ∧ G.localCharacter ∧ G.transitivity

theorem grothendieck_topology_closed_from_evidence
    (G : GrothendieckTopologyPackage) (E : GrothendieckTopologyEvidence G) :
    GrothendieckTopologyClosed G := by
  exact And.intro E.pullbackStabilityClosed
    (And.intro E.localCharacterClosed E.transitivityClosed)

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse