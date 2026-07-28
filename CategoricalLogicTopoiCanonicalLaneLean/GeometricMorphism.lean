import canonicalLaneMathlib.AdmissibleClass
import CategoricalLogicTopoiCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure GeometricMorphismPackage where
  source : ToposObject
  target : ToposObject
  directImage : Functor source.category target.category
  inverseImage : Functor target.category source.category
  adjointPair : Adjunction directImage inverseImage
  preservesFiniteLimits : InverseImagePreservesFiniteLimits inverseImage
  coherent : Prop

structure GeometricMorphismEvidence (G : GeometricMorphismPackage) where
  adjunctionClosed : G.adjointPair = Adjunction.mk G.directImage G.inverseImage
  preservesFiniteLimitsClosed : G.preservesFiniteLimits
  coherentClosed : G.coherent

def GeometricMorphismClosed (G : GeometricMorphismPackage) : Prop :=
  G.adjointPair.IsAdjunction ∧ G.preservesFiniteLimits ∧ G.coherent

theorem geometric_morphism_closed_from_evidence (G : GeometricMorphismPackage)
    (Ev : GeometricMorphismEvidence G) : GeometricMorphismClosed G := by
  exhaustive

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse