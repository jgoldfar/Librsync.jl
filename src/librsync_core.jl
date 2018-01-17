# Julia wrapper for header: /Users/jgoldfar/Documents/misc/julia/librsync/gen/../deps/usr/include/librsync.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0

function rs_trace_set_level(level::rs_loglevel)
    ccall((:rs_trace_set_level, librsync), Void, (rs_loglevel,), level)
end

# TODO: Find out what this is meant to be
const rs_trace_fn_t = Void
function rs_trace_to(arg1)
    ccall((:rs_trace_to, librsync), Void, (Ptr{rs_trace_fn_t},), arg1)
end

function rs_trace_stderr(level::rs_loglevel, msg)
    ccall((:rs_trace_stderr, librsync), Void, (rs_loglevel, Cstring), level, msg)
end

function rs_supports_trace()
    ccall((:rs_supports_trace, librsync), Cint, ())
end

function rs_hexify(to_buf, from_buf, from_len::Cint)
    ccall((:rs_hexify, librsync), Void, (Cstring, Ptr{Void}, Cint), to_buf, from_buf, from_len)
end

function rs_unbase64(s)
    ccall((:rs_unbase64, librsync), Csize_t, (Cstring,), s)
end

function rs_base64(buf, n::Cint, out)
    ccall((:rs_base64, librsync), Void, (Ptr{Cuchar}, Cint, Cstring), buf, n, out)
end

function rs_strerror(r::rs_result)
    ccall((:rs_strerror, librsync), Cstring, (rs_result,), r)
end

function rs_mdfour(out, _in, arg1::Csize_t)
    ccall((:rs_mdfour, librsync), Void, (Ptr{Cuchar}, Ptr{Void}, Csize_t), out, _in, arg1)
end

function rs_mdfour_begin(md)
    ccall((:rs_mdfour_begin, librsync), Void, (Ptr{rs_mdfour_t},), md)
end

function rs_mdfour_update(md, in_void, n::Csize_t)
    ccall((:rs_mdfour_update, librsync), Void, (Ptr{rs_mdfour_t}, Ptr{Void}, Csize_t), md, in_void, n)
end

function rs_mdfour_result(md, out)
    ccall((:rs_mdfour_result, librsync), Void, (Ptr{rs_mdfour_t}, Ptr{Cuchar}), md, out)
end

function rs_format_stats(stats, buf, size::Csize_t)
    ccall((:rs_format_stats, librsync), Cstring, (Ptr{rs_stats_t}, Cstring, Csize_t), stats, buf, size)
end

function rs_log_stats(stats)
    ccall((:rs_log_stats, librsync), Cint, (Ptr{rs_stats_t},), stats)
end

function rs_free_sumset(arg1)
    ccall((:rs_free_sumset, librsync), Void, (Ptr{rs_signature_t},), arg1)
end

function rs_sumset_dump(arg1)
    ccall((:rs_sumset_dump, librsync), Void, (Ptr{rs_signature_t},), arg1)
end

function rs_job_iter(job, buffers)
    ccall((:rs_job_iter, librsync), rs_result, (Ptr{rs_job_t}, Ptr{rs_buffers_t}), job, buffers)
end

# TODO: Find out what the below is meant to be
const rs_driven_cb = Any
function rs_job_drive(job, buf, in_cb::rs_driven_cb, in_opaque, out_cb::rs_driven_cb, out_opaque)
    ccall((:rs_job_drive, librsync), rs_result, (Ptr{rs_job_t}, Ptr{rs_buffers_t}, rs_driven_cb, Ptr{Void}, rs_driven_cb, Ptr{Void}), job, buf, in_cb, in_opaque, out_cb, out_opaque)
end

function rs_job_statistics(job)
    ccall((:rs_job_statistics, librsync), Ptr{rs_stats_t}, (Ptr{rs_job_t},), job)
end

function rs_job_free(arg1)
    ccall((:rs_job_free, librsync), rs_result, (Ptr{rs_job_t},), arg1)
end

function rs_sig_begin(new_block_len::Csize_t, strong_sum_len::Csize_t, sig_magic::rs_magic_number)
    ccall((:rs_sig_begin, librsync), Ptr{rs_job_t}, (Csize_t, Csize_t, rs_magic_number), new_block_len, strong_sum_len, sig_magic)
end

function rs_delta_begin(arg1)
    ccall((:rs_delta_begin, librsync), Ptr{rs_job_t}, (Ptr{rs_signature_t},), arg1)
end

function rs_loadsig_begin(arg1)
    ccall((:rs_loadsig_begin, librsync), Ptr{rs_job_t}, (Ptr{Ptr{rs_signature_t}},), arg1)
end

function rs_build_hash_table(sums)
    ccall((:rs_build_hash_table, librsync), rs_result, (Ptr{rs_signature_t},), sums)
end

# TODO: Find out what the below is meant to be
const rs_copy_cb = Void
function rs_patch_begin(copy_cb, copy_arg)
    ccall((:rs_patch_begin, librsync), Ptr{rs_job_t}, (Ptr{rs_copy_cb}, Ptr{Void}), copy_cb, copy_arg)
end

# TODO: Unify this type with the RawFD
const FILE = Void
function rs_sig_file(old_file, sig_file, block_len, strong_len, sig_magic, stats)
    ccall((:rs_sig_file, librsync), rs_result, (Ptr{FILE}, Ptr{FILE}, Csize_t, Csize_t, ANONYMOUS_2#=rs_magic_number=#, Ptr{rs_stats_t}), old_file, sig_file, block_len, strong_len, sig_magic, stats)
end

function rs_loadsig_file(sig_file, sumset, stats)
    ccall((:rs_loadsig_file, librsync), rs_result, (Ptr{FILE}, Ptr{Ptr{rs_signature_t}}, Ptr{rs_stats_t}), sig_file, sumset, stats)
end

function rs_file_copy_cb(arg, pos::rs_long_t, len, buf)
    ccall((:rs_file_copy_cb, librsync), rs_result, (Ptr{Void}, rs_long_t, Ptr{Csize_t}, Ptr{Ptr{Void}}), arg, pos, len, buf)
end

function rs_delta_file(arg1, new_file, delta_file, arg2)
    ccall((:rs_delta_file, librsync), rs_result, (Ptr{rs_signature_t}, Ptr{FILE}, Ptr{FILE}, Ptr{rs_stats_t}), arg1, new_file, delta_file, arg2)
end

function rs_patch_file(basis_file, delta_file, new_file, arg1)
    ccall((:rs_patch_file, librsync), rs_result, (Ptr{FILE}, Ptr{FILE}, Ptr{FILE}, Ptr{rs_stats_t}), basis_file, delta_file, new_file, arg1)
end
