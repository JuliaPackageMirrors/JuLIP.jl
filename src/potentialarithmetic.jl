


# # scalars as potentials
# evaluate(x::Real, r::Float64) = x
# evaluate_d(x::Real, r::Float64) = 0.0
#
#
# "basic building block to generate potentials"
# type r_Pot <: PairPotential end
# evaluate(p::r_Pot, r) = r
# evaluate_d(p::r_Pot, r) = 1
#
#
# "sum of two pair potentials"
# type sum_Pot{P1, P2}
#    p1::P1
#    p2::P2
# end
#
# typealias PPorNum Union{PairPotential, Real}
#
# (Base.+)(p1::PairPotential, p2::PPorNum) = sum_Pot(p1, p2)
# (Base.+)(p2::PPorNum, p1::PairPotential) = sum_Pot(p1, p2)
#
# evaluate(p::sum_Pot, r) = p.p1(r) + p.p2(r)
# evaluate_d(p::sum_Pot, r) = (@D p.p1(r)) + (@D p.p2(r))
#
# "product of two pair potentials"
# type prod_Pot{P1, P2}
#    p1::P1
#    p2::P2
# end
#
# (Base.*)(p1::PairPotential, p2::PPorNum) = prod(p1, p2)
# (Base.*)(p1::PPorNum, p2::PairPotential) = prod(p1, p2)
#
# evaluate(p::prod_Pot, r) = p.p1(r) * p.p2(r)
# evaluate_d(p::prod_Pot, r) = p.p1(r) * (@D p.p2(r)) + (@D p.p1(r)) * p.p2(r)
#
#
# # "product of two pair potentials"
# # type exp_Pot{P1}
# #    p1::P1
# # end
# #
# # Base.exp(p1::PairPotential) = exp_Pot(p1)
# #
# # evaluate(p::exp_Pot, r) = exp(p.p1(r)))
# # evaluate_d(p::exp_Pot, r) = exp(p.p1(r)) * (@D p.p1(r))
#
#
# const r = r_Pot()