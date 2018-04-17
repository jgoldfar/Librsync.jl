@checked_lib librsync_constructors "/Users/jgoldfar/Documents/misc/julia/Librsync/deps/constructors.o"
function construct_rs_stats_t()
  ccall((:construct_rs_stats_t, librsync_constructors), Ptr{Librsync.rs_stats_t}, ())
end