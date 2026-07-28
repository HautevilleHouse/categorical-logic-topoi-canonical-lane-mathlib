import CategoricalLogicTopoiCanonicalLaneLean.ElementaryTopoi

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure MitchellBenabouLanguagePackage where
  internalLanguage : Type u
  termFormation : Prop
  formulaFormation : Prop
  forcingRelation : Prop
  languageSoundness : Prop
  termFormationClosed : termFormation
  formulaFormationClosed : formulaFormation
  forcingRelationClosed : forcingRelation
  languageSoundnessClosed : languageSoundness

structure MitchellBenabouLanguageEvidence (L : MitchellBenabouLanguagePackage) where
  termFormationClosed : L.termFormationClosed
  formulaFormationClosed : L.formulaFormationClosed
  forcingRelationClosed : L.forcingRelationClosed
  languageSoundnessClosed : L.languageSoundnessClosed

def MitchellBenabouLanguageClosed (L : MitchellBenabouLanguagePackage) : Prop :=
  L.termFormation ∧ L.formulaFormation ∧ L.forcingRelation ∧ L.languageSoundness

theorem mitchell_benabou_language_closed_from_evidence
    (L : MitchellBenabouLanguagePackage) (E : MitchellBenabouLanguageEvidence L) :
    MitchellBenabouLanguageClosed L := by
  exact And.intro E.termFormationClosed
    (And.intro E.formulaFormationClosed
      (And.intro E.forcingRelationClosed E.languageSoundnessClosed))

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse
