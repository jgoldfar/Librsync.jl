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
# const debugprefix = joinpath(BinDeps.depsdir(librsync), "usr-debug")
# const debugbuilddir = joinpath(srcdir, "Debug")

provides(SimpleBuild, (@build_steps begin
                         GetSources(librsync)
                         CreateDirectory(builddir)
                         @build_steps begin
                           ChangeDirectory(builddir)
                           `cmake -D CMAKE_INSTALL_PREFIX=$(prefix) -D CMAKE_BUILD_TYPE=Debug -D BUILD_RDIFF=OFF ..`
                           `make`
                           `make install`
                         end
                        #  CreateDirectory(debugbuilddir)
                        #  @build_steps begin
                        #    ChangeDirectory(debugbuilddir)
                        #    `cmake -D CMAKE_INSTALL_PREFIX=$(debugprefix) -D CMAKE_BUILD_TYPE=Debug -D BUILD_RDIFF=OFF ..`
                        #    `make`
                        #    `make install`
                        #  end
                       end),
         librsync,
         os = :Unix)

@BinDeps.install @compat Dict(:librsync => :librsync)