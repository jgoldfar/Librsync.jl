using BinDeps
using Compat

@BinDeps.setup

const librsync = library_dependency("librsync", aliases=["librsync"])

const librsyncName = "librsync-2.0.1"
provides(Sources,
         URI("https://github.com/librsync/librsync/archive/v2.0.1.zip"),
         librsync,
         unpacked_dir = librsyncName)

const prefix = joinpath(BinDeps.depsdir(librsync), "usr")
const srcdir = joinpath(BinDeps.depsdir(librsync), "src", librsyncName)
const builddir = joinpath(srcdir, "build")
const doDebug = true
const debugArg = doDebug ? "-DCMAKE_BUILD_TYPE=Debug " : "-DCMAKE_BUILD_TYPE=Release "
const buildRdiff = true
const RdiffArg = buildRdiff ? "-DBUILD_RDIFF=ON " : "-DBUILD_RDIFF=OFF "

provides(SimpleBuild, 
  (@build_steps begin
    GetSources(librsync)
    CreateDirectory(builddir)
    @build_steps begin
      ChangeDirectory(builddir)
      `cmake -DCMAKE_INSTALL_PREFIX=$(prefix) $(debugArg)$(RdiffArg) ..`
      `make`
      `make check`
      `make install`
    end
  end),
  librsync,
  os = :Unix)

@BinDeps.install @compat Dict(:librsync => :librsync)