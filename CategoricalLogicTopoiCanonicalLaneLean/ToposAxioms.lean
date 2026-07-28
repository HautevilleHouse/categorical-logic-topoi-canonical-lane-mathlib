import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure ToposAxiomsPackage where
  finiteLimits : Prop
  exponentials : Prop
  subobjectClassifier : Prop
  terminalObject : Prop
  pullbacks : Prop
  exponentiationExists : Prop
  classifierExists : Prop

structure ToposAxiomsEvidence (T : ToposAxiomsPackage) where
  finiteLimitsClosed : T.finiteLimits
  exponentialsClosed : T.exponentials
  subobjectClassifierClosed : T.subobjectClassifier
  terminalObjectClosed : T.terminalObject
  pullbacksClosed : T.pullbacks
  exponentiationExistsClosed : T.exponentiationExists
  classifierExistsClosed : T.classifierExists

def ToposAxiomsClosed (T : ToposAxiomsPackage) : Prop :=
  T.finiteLimits ∧ T.exponentials ∧ T.subobjectClassifier ∧
  T.terminalObject ∧ T.pullbacks ∧ T.exponentiationExists ∧ T.classifierExists

theorem topos_axioms_closed_from_evidence (T : ToposAxiomsPackage) (E : ToposAxiomsEvidence T) :
    ToposAxiomsClosed T := by
  exact And.intro E.finiteLimitsClosed
    (And.intro E.exponentialsClosed
      (And.intro E.subobjectClassifierClosed
        (And.intro E.terminalObjectClosed
          (And.intro E.pullbacksClosed
            (And.intro E.exponentiationExistsClosed E.classifierExistsClosed)))))

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse