module Aux_variables
mutable struct param
    S::Float64
    ULK1T::Float64
    AMPKT::Float64
    mTORT::Float64
    REGT::Float64
    kaulk::Float64
    kaulk1::Float64
    kaulk2::Float64
    kiulk::Float64
    kiulk1::Float64
    Julk::Float64
    kaak::Float64
    kiak::Float64
    kiak1::Float64
    kiak2::Float64
    Jampk::Float64
    kamtor::Float64
    kimtor::Float64
    kimtor1::Float64
    kimtor3::Float64
    kimtor2::Float64
    Jreg::Float64
    kareg::Float64
    kareg1::Float64
    kireg::Float64
end

export param_names
export u0
export p_predef
export makeParamRange

function makeParamRange(lb,ub)
    tt = hcat(lb,ub);
    ttt = [[0.0,0.0]];
    map(y->push!(ttt,tt[y,:]),1:size(tt)[1]);
    param_ranges = ttt[2:end];
    param_ranges[1]=[0.0,1.0];
    return param_ranges
end


param_names = ["S","ULK1T","AMPKT","mTORT","REGT","kaulk","kaulk1","kaulk2","kiulk","kiulk1","Julk","kaak","kiak","kiak1","kiak2","Jampk","kamtor","kimtor","kimtor1","kimtor3","kimtor2","Jreg","kareg","kareg1","kireg"]

reg=param(0.0,1.0,1.0,1.0,1.0,0.101,25.0,0.03,0.1,20.0,0.001,0.2,0.1,3.0,10.0,0.01,0.0175,0.0125,10.0,0.1,0.1,0.02,0.01,10.0,20.0)
p_predef = [reg.S,reg.ULK1T,reg.AMPKT,reg.mTORT,reg.REGT,reg.kaulk,reg.kaulk1,reg.kaulk2,reg.kiulk,reg.kiulk1,reg.Julk,reg.kaak,reg.kiak,reg.kiak1,reg.kiak2,reg.Jampk,reg.kamtor,reg.kimtor,reg.kimtor1,reg.kimtor3,reg.kimtor2,reg.Jreg,reg.kareg,reg.kareg1,reg.kireg]
u0 = [0.001,0.00071,0.02075,0.001]

end
