import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CategoricalLogicTopoiCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  ToposWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CategoricalLogicTopoiCanonicalLaneLean
end HautevilleHouse