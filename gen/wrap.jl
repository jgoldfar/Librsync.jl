# This file is not an active part of the package. This is the code
# that uses the Clang.jl package to wrap Librsync using the headers.

# Find all headers
# To run the script from Julia console:
# include(joinpath(Pkg.dir("Librsync"), "src", "wrap.jl"));
const llvmpath = "/usr/local/Cellar/llvm/5.0.0"
push!(Libdl.DL_LOAD_PATH, joinpath(llvmpath, "lib"))
using Clang.wrap_c
const wdir = dirname(@__FILE__)
const pkgbasedir = joinpath(wdir, "..")

# `outpath` specifies, where the julian wrappers would be generated.
# If the generated .jl files are ok, they have to be copied to the "src" folder
# overwriting the old ones
const outpath = joinpath(pkgbasedir, "new")
rm(outpath, recursive = true, force = true)
mkpath(outpath)

const incpath = joinpath(pkgbasedir, "deps", "usr", "include")
if !isdir(incpath)
  error("Run Pkg.build(\"Librsync\") before trying to wrap C headers.")
end

info("Scanning Librsync headers in $incpath...")
const Librsync_header_files = ["librsync"]
const Librsync_headers =[joinpath(incpath, y) for y in (string(x, ".h") for x in Librsync_header_files)]

const clang_path = joinpath(llvmpath, "lib", "clang", "5.0.0") # change to your clang location
const includes = [
    joinpath(clang_path, "include"),
    incpath
]

function find_outfile(s)
    joinpath(outpath, string(first(splitext(basename(s))), ".jl"))
end
find_libfile(s) = "librsync"

const context = wrap_c.init(
    headers = Librsync_headers,
    common_file = joinpath(outpath, "Librsync_types.jl"),
    clang_args = [
        "-D", "__STDC_LIMIT_MACROS",
        "-D", "__STDC_CONSTANT_MACROS",
        # "-v"
    ],
    clang_diagnostics = true,
    header_library = find_libfile,
    header_outputfile = find_outfile,
    clang_includes = includes,
)

info("Generating .jl wrappers for Librsync in $outpath...")
run(context)
info("Done generating .jl wrappers for Librsync in $outpath")
