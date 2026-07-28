import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

structure SheafToposPackage {A : AdmissibleClass} where
  site : Type u
  coverage : Coverage site
  sheafCategory : Type v
  sheafCategoryIsTopos : Prop
  equivalenceWithA : Prop

structure SheafToposEvidence {A : AdmissibleClass} (P : SheafToposPackage A) where
  sheafCategoryIsToposClosed : P.sheafCategoryIsTopos
  equivalenceWithAClosed : P.equivalenceWithA

def SheafToposClosed {A : AdmissibleClass} (P : SheafToposPackage A) : Prop :=
  P.sheafCategoryIsTopos ∧ P.equivalenceWithA

theorem sheaf_topos_closed_from_evidence {A : AdmissibleClass}
    (P : SheafToposPackage A) (E : SheafToposEvidence P) :
    SheafToposClosed P := by
  exact And.intro E.sheafCategoryIsToposClosed E.equivalenceWithAClosed

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse