use v6;
use Kind;
use MetamodelX::ParametricSubset;
unit module Kind::Subset::Parametric:ver<0.0.5>:auth<github:Kaiepi>:api<0>;

my constant Subset = Kind[Metamodel::SubsetHOW:D];

#|[ Performs a mixin of MetamodelX::ParametricSubset on a subset. ]
multi sub trait_mod:<will>(Mu \T where Subset, &body_block, :parameterize($)! --> Nil) is export {
    T.HOW.^mixin: MetamodelX::ParametricSubset unless MetamodelX::ParametricSubset.ACCEPTS: T.HOW;
    T.^set_body_block: &body_block;
}
#=[ Given arbitrary type arguments, the body block should return a refinement
    with which to produce a parameterization for the provided subset. ]
