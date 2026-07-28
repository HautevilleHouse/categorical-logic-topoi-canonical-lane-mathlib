import canonicalLaneMathlib.AdmissibleClass
import CategoricalLogicTopoiCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure InternalLogicPackage where
  object : ToposObject
  subobjectClassifier : object.subobjectClassifier
  truthMorphism : TerminalMorphism object.category
  powersetFunctor : Functor object.category.op (Set.{max u v})
  comprehensionSchema : Prop
  internalLocalic : Prop

structure InternalLogicEvidence (I : InternalLogicPackage) where
  subobjectClassifierClosed : I.subobjectClassifier = I.object.subobjectClassifier
  truthMorphismClosed : I.truthMorphism = terminalMorphism I.object.category
  powersetFunctorClosed : I.powersetFunctor = subobjectFunctor I.object.category
  comprehensionSchemaClosed : I.comprehensionSchema
  internalLocalicClosed : I.internalLocalic

def InternalLogicClosed (I : InternalLogicPackage) : Prop :=
  I.comprehensionSchema ∧ I.internalLocalic

theorem internal_logic_closed_from_evidence (I : InternalLogicPackage)
    (Ev : InternalLogicEvidence I) : InternalLogicClosed I := by
  exhaustive

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse