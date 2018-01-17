VERSION >= v"0.4.0-dev+6521" && __precompile__() 
module Librsync

const depsfile = joinpath(dirname(dirname(@__FILE__)), "deps", "deps.jl")
if isfile(depsfile)
  include(depsfile)
else
  error("Librsync not properly installed. Please run Pkg.build(\"Librsync\")")
end

include("librsync_types.jl")
include("librsync_core.jl")

# const librsync_version = unsafe_string(unsafe_load(cglobal((:rs_librsync_version, librsync), Ptr{Cchar})))
const MD4_SUM_LENGTH = unsafe_load(cglobal((:RS_MD4_SUM_LENGTH, Librsync.librsync), Cint))
const BLAKE2_SUM_LENGTH = unsafe_load(cglobal((:RS_BLAKE2_SUM_LENGTH, Librsync.librsync), Cint))
const inbuflen = unsafe_load(cglobal((:rs_inbuflen, Librsync.librsync), Cint))
const outbuflen = unsafe_load(cglobal((:rs_outbuflen, Librsync.librsync), Cint))

end # module
