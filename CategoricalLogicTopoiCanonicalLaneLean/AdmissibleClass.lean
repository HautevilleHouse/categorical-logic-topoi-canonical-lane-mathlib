import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ToposObject where
  carrier : Type u
  category : Category.{max u v} carrier
  finiteLimits : HasFiniteLimits category
  subobjectClassifier : SubobjectClassifier category
  exponentiation : CartesianClosed category

structure ToposAdmittedObject where
  object : ToposObject
  subobjectClassifierProp : Prop
  exponentiationProp : Prop
  conclusion : subobjectClassifierProp ∧ exponentiationProp

structure ToposEndgameState where
  object : ToposAdmittedObject

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse