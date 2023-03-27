module Ode_Model

using OrdinaryDiffEq, StatsBase
include("auxilary.jl")
using .Aux_variables

export f1
export f   

function f(u,p,t)
    ULK1, AMPK, mTOR, REG  = u
    S,ULK1T,AMPKT,mTORT,REGT,kaulk,kaulk1,kaulk2,kiulk,kiulk1,Julk,kaak,kiak,kiak1,kiak2,Jampk,kamtor,kimtor,kimtor1,kimtor3,kimtor2,Jreg,kareg,kareg1,kiatf = p
    ULK1 = u[1]
    AMPK = u[2]
    mTOR = u[3]
    REG = u[4]
    out = similar(u)
    # differential equations 
    # ULK1 represents the active form of ULK1
    out[1] = (kaulk + kaulk1*REG + kaulk2*AMPK)*(ULK1T-ULK1)/(Julk + ULK1T-ULK1) - (kiulk + kiulk1*mTOR)*ULK1/(Julk + ULK1)
    # AMPK represents the active form of AMPK
    out[2] = (kaak + S)*(AMPKT-AMPK)/(Jampk + AMPKT-AMPK) - (kiak + kiak1*ULK1 + kiak2*mTOR)*AMPK/(Jampk + AMPK)
    # mTOR represents the active form of mTOR
    out[3] = kamtor*(mTORT-mTOR)-(kimtor + kimtor1*AMPK + kimtor2*ULK1 +kimtor3*REG)*mTOR
    out[4] = (kareg + kareg1 * AMPK)*(REGT-REG)/(Jreg+REGT-REG) - kiatf*REG/(Jreg+REG)
    out
end

tspan = (0.0,10.0)
prob = ODEProblem(f,u0,tspan,p_predef)
t = collect(range(0, stop=10, length=200))

f1 = function (p)
    prob1 = remake(prob;p=p)
    sol = solve(prob1,Rosenbrock23();saveat=t)
    [mean(sol[1,:]),maximum(sol[1,:]),mad(sol[1,:])]
end

end
