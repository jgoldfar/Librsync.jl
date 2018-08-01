using Librsync
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

@test Librsync.MD4_SUM_LENGTH > 0
@test Librsync.BLAKE2_SUM_LENGTH > 0