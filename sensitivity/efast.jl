using GlobalSensitivity, Statistics, Plots

include("auxilary.jl")
include("model.jl")
using .Aux_variables
using .Ode_Model

#Bounds fro each parameter8
lb = p_predef-p_predef*1;
ub = p_predef+p_predef*1;

param_ranges = makeParamRange(lb,ub)

@time s = gsa(f1,eFAST(),param_ranges,samples=1500)


sobol_tot = s.ST[1,:]
sobol_dict = Dict(param_names.=>sobol_tot)
sorted = sort(collect(sobol_dict), by=x->x[2])
x = map(x->x[1],sorted)
y = map(x->x[2],sorted)

gr(size=(900,800), legend= false)
tot_only = bar(x,y,title="total Sobol indices of ULK1",titlefontsize=22,
                legend=false,rotation=45,xticks=:all,xtickfontsize=16,ytickfontsize=16)
savefig(tot_only,"./figs/efas_tot.png")
