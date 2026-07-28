import CategoricalLogicTopoiCanonicalLaneLean.MitchellBenabouLanguage

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure ForcingModelPackage where
  site : Type u
  sieve : Type v
  forcingExtension : Prop
  kripkeJoyalSoundness : Prop
  validFormulas : MitchellBenabouLanguagePackage → Prop
  forcingExtensionClosed : forcingExtension
  kripkeJoyalSoundnessClosed : kripkeJoyalSoundness

structure ForcingModelEvidence (F : ForcingModelPackage) where
  forcingExtensionClosed : F.forcingExtensionClosed
  kripkeJoyalSoundnessClosed : F.kripkeJoyalSoundnessClosed
  validFormulasClosed : ∀ L : MitchellBenabouLanguagePackage, F.validFormulas L → MitchellBenabouLanguageClosed L

def ForcingModelClosed (F : ForcingModelPackage) : Prop :=
  F.forcingExtension ∧ F.kripkeJoyalSoundness ∧
  ∀ L : MitchellBenabouLanguagePackage, F.validFormulas L → MitchellBenabouLanguageClosed L

theorem forcing_model_closed_from_evidence
    (F : ForcingModelPackage) (E : ForcingModelEvidence F) :
    ForcingModelClosed F := by
  refine And.intro E.forcingExtensionClosed
    (And.intro E.kripkeJoyalSoundnessClosed ?_)
  intro L h
  exact E.validFormulasClosed L h

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse
