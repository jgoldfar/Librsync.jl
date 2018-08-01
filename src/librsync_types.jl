# Automatically generated using Clang.jl wrap_c, version 0.0.0

const OBJC_NEW_PROPERTIES = 1

# Skipping MacroDefinition: USER_ADDR_NULL ( ( user_addr_t ) 0 )
# Skipping MacroDefinition: CAST_USER_ADDR_T ( a_ptr ) ( ( user_addr_t ) ( ( uintptr_t ) ( a_ptr ) ) )

# const LITTLE_ENDIAN = __DARWIN_LITTLE_ENDIAN
# const BIG_ENDIAN = __DARWIN_BIG_ENDIAN
# const PDP_ENDIAN = __DARWIN_PDP_ENDIAN
# const BYTE_ORDER = __DARWIN_BYTE_ORDER

# Skipping MacroDefinition: ntohs ( x ) __DARWIN_OSSwapInt16 ( x )
# Skipping MacroDefinition: htons ( x ) __DARWIN_OSSwapInt16 ( x )
# Skipping MacroDefinition: ntohl ( x ) __DARWIN_OSSwapInt32 ( x )
# Skipping MacroDefinition: htonl ( x ) __DARWIN_OSSwapInt32 ( x )
# Skipping MacroDefinition: ntohll ( x ) __DARWIN_OSSwapInt64 ( x )
# Skipping MacroDefinition: htonll ( x ) __DARWIN_OSSwapInt64 ( x )
# Skipping MacroDefinition: NTOHL ( x ) ( x ) = ntohl ( ( __uint32_t ) x )
# Skipping MacroDefinition: NTOHS ( x ) ( x ) = ntohs ( ( __uint16_t ) x )
# Skipping MacroDefinition: NTOHLL ( x ) ( x ) = ntohll ( ( __uint64_t ) x )
# Skipping MacroDefinition: HTONL ( x ) ( x ) = htonl ( ( __uint32_t ) x )
# Skipping MacroDefinition: HTONS ( x ) ( x ) = htons ( ( __uint16_t ) x )
# Skipping MacroDefinition: HTONLL ( x ) ( x ) = htonll ( ( __uint64_t ) x )
# Skipping MacroDefinition: major ( x ) ( ( int32_t ) ( ( ( u_int32_t ) ( x ) >> 24 ) & 0xff ) )
# Skipping MacroDefinition: minor ( x ) ( ( int32_t ) ( ( x ) & 0xffffff ) )
# Skipping MacroDefinition: makedev ( x , y ) ( ( dev_t ) ( ( ( x ) << 24 ) | ( y ) ) )

# const NBBY = __DARWIN_NBBY
# const NFDBITS = __DARWIN_NFDBITS

# Skipping MacroDefinition: howmany ( x , y ) __DARWIN_howmany ( x , y )

# const FD_SETSIZE = __DARWIN_FD_SETSIZE

# Skipping MacroDefinition: FD_SET ( n , p ) __DARWIN_FD_SET ( n , p )
# Skipping MacroDefinition: FD_CLR ( n , p ) __DARWIN_FD_CLR ( n , p )
# Skipping MacroDefinition: FD_ZERO ( p ) __DARWIN_FD_ZERO ( p )
# Skipping MacroDefinition: FD_ISSET ( n , p ) __DARWIN_FD_ISSET ( n , p )
# Skipping MacroDefinition: FD_COPY ( f , t ) __DARWIN_FD_COPY ( f , t )

# const NULL = __DARWIN_NULL
# const RENAME_SECLUDE = 0x00000001
# const RENAME_SWAP = 0x00000002
# const RENAME_EXCL = 0x00000004
# const BUFSIZ = 1024
# const EOF = -1
# const FOPEN_MAX = 20
# const FILENAME_MAX = 1024
# const P_tmpdir = "/var/tmp/"
# const L_tmpnam = 1024
# const TMP_MAX = 308915776
# const SEEK_SET = 0
# const SEEK_CUR = 1
# const SEEK_END = 2
# const stdin = __stdinp
# const stdout = __stdoutp
# const stderr = __stderrp
# const L_ctermid = 1024

# Skipping MacroDefinition: getc_unlocked ( fp ) __sgetc ( fp )
# Skipping MacroDefinition: putc_unlocked ( x , fp ) __sputc ( x , fp )
# Skipping MacroDefinition: getchar_unlocked ( ) getc_unlocked ( stdin )
# Skipping MacroDefinition: putchar_unlocked ( x ) putc_unlocked ( x , stdout )
# Skipping MacroDefinition: fropen ( cookie , fn ) funopen ( cookie , fn , 0 , 0 , 0 )
# Skipping MacroDefinition: fwopen ( cookie , fn ) funopen ( cookie , 0 , fn , 0 , 0 )
# Skipping MacroDefinition: feof_unlocked ( p ) __sfeof ( p )
# Skipping MacroDefinition: ferror_unlocked ( p ) __sferror ( p )
# Skipping MacroDefinition: clearerr_unlocked ( p ) __sclearerr ( p )
# Skipping MacroDefinition: fileno_unlocked ( p ) __sfileno ( p )
# Skipping MacroDefinition: sprintf ( str , ... ) __builtin___sprintf_chk ( str , 0 , __darwin_obsz ( str ) , __VA_ARGS__ )
# Skipping MacroDefinition: snprintf ( str , len , ... ) __builtin___snprintf_chk ( str , len , 0 , __darwin_obsz ( str ) , __VA_ARGS__ )
# Skipping MacroDefinition: vsprintf ( str , format , ap ) __builtin___vsprintf_chk ( str , 0 , __darwin_obsz ( str ) , format , ap )
# Skipping MacroDefinition: vsnprintf ( str , len , format , ap ) __builtin___vsnprintf_chk ( str , len , 0 , __darwin_obsz ( str ) , format , ap )

const INT8_MAX = 127
const INT16_MAX = 32767
const INT32_MAX = 2147483647
const INT64_MAX = Int64(9223372036854775807)
const INT8_MIN = -128
const INT16_MIN = -32768
const INT32_MIN = -INT32_MAX - 1
const INT64_MIN = -INT64_MAX - 1
const UINT8_MAX = 255
const UINT16_MAX = 65535
const UINT32_MAX = UInt32(4294967295)
const UINT64_MAX = UInt64(@int128_str("18446744073709551615"))
const INT_LEAST8_MIN = INT8_MIN
const INT_LEAST16_MIN = INT16_MIN
const INT_LEAST32_MIN = INT32_MIN
const INT_LEAST64_MIN = INT64_MIN
const INT_LEAST8_MAX = INT8_MAX
const INT_LEAST16_MAX = INT16_MAX
const INT_LEAST32_MAX = INT32_MAX
const INT_LEAST64_MAX = INT64_MAX
const UINT_LEAST8_MAX = UINT8_MAX
const UINT_LEAST16_MAX = UINT16_MAX
const UINT_LEAST32_MAX = UINT32_MAX
const UINT_LEAST64_MAX = UINT64_MAX
const INT_FAST8_MIN = INT8_MIN
const INT_FAST16_MIN = INT16_MIN
const INT_FAST32_MIN = INT32_MIN
const INT_FAST64_MIN = INT64_MIN
const INT_FAST8_MAX = INT8_MAX
const INT_FAST16_MAX = INT16_MAX
const INT_FAST32_MAX = INT32_MAX
const INT_FAST64_MAX = INT64_MAX
const UINT_FAST8_MAX = UINT8_MAX
const UINT_FAST16_MAX = UINT16_MAX
const UINT_FAST32_MAX = UINT32_MAX
const UINT_FAST64_MAX = UINT64_MAX
const INTPTR_MIN = INT64_MIN
const INTPTR_MAX = INT64_MAX
const UINTPTR_MAX = UINT64_MAX
const INTMAX_MIN = INT64_MIN
const INTMAX_MAX = INT64_MAX
const UINTMAX_MAX = UINT64_MAX
const PTRDIFF_MIN = INT64_MIN
const PTRDIFF_MAX = INT64_MAX
const SIZE_MAX = UINT64_MAX
const RSIZE_MAX = SIZE_MAX >> 1
# const WCHAR_MAX = __WCHAR_MAX__
# const WCHAR_MIN = -WCHAR_MAX - 1
const WINT_MIN = INT32_MIN
const WINT_MAX = INT32_MAX
const SIG_ATOMIC_MIN = INT32_MIN
const SIG_ATOMIC_MAX = INT32_MAX

# Skipping MacroDefinition: INT8_C ( v ) ( v )
# Skipping MacroDefinition: INT16_C ( v ) ( v )
# Skipping MacroDefinition: INT32_C ( v ) ( v )
# Skipping MacroDefinition: INT64_C ( v ) ( v ## LL )
# Skipping MacroDefinition: UINT8_C ( v ) ( v ## U )
# Skipping MacroDefinition: UINT16_C ( v ) ( v ## U )
# Skipping MacroDefinition: UINT32_C ( v ) ( v ## U )
# Skipping MacroDefinition: UINT64_C ( v ) ( v ## ULL )
# Skipping MacroDefinition: INTMAX_C ( v ) ( v ## L )
# Skipping MacroDefinition: UINTMAX_C ( v ) ( v ## UL )

const CLOCKS_PER_SEC = 1000000

# begin enum ANONYMOUS_1
const ANONYMOUS_1 = UInt32
const _CLOCK_REALTIME = (UInt32)(0)
const _CLOCK_MONOTONIC = (UInt32)(6)
const _CLOCK_MONOTONIC_RAW = (UInt32)(4)
const _CLOCK_MONOTONIC_RAW_APPROX = (UInt32)(5)
const _CLOCK_UPTIME_RAW = (UInt32)(8)
const _CLOCK_UPTIME_RAW_APPROX = (UInt32)(9)
const _CLOCK_PROCESS_CPUTIME_ID = (UInt32)(12)
const _CLOCK_THREAD_CPUTIME_ID = (UInt32)(16)
# end enum ANONYMOUS_1

const CLOCK_REALTIME = _CLOCK_REALTIME
const CLOCK_MONOTONIC = _CLOCK_MONOTONIC
const CLOCK_MONOTONIC_RAW = _CLOCK_MONOTONIC_RAW
const CLOCK_MONOTONIC_RAW_APPROX = _CLOCK_MONOTONIC_RAW_APPROX
const CLOCK_UPTIME_RAW = _CLOCK_UPTIME_RAW
const CLOCK_UPTIME_RAW_APPROX = _CLOCK_UPTIME_RAW_APPROX
const CLOCK_PROCESS_CPUTIME_ID = _CLOCK_PROCESS_CPUTIME_ID
const CLOCK_THREAD_CPUTIME_ID = _CLOCK_THREAD_CPUTIME_ID
const RS_MAX_STRONG_SUM_LENGTH = 32
const RS_DEFAULT_BLOCK_LEN = 2048
const int8_t = UInt8
const int16_t = Int16
const int32_t = Cint
const int64_t = Clonglong
const u_int8_t = Cuchar
const u_int16_t = UInt16
const u_int32_t = UInt32
const u_int64_t = Culonglong
const register_t = Int64
# const intptr_t = __darwin_intptr_t
const uintptr_t = Culong
const user_addr_t = u_int64_t
const user_size_t = u_int64_t
const user_ssize_t = Int64
const user_long_t = Int64
const user_ulong_t = u_int64_t
const user_time_t = Int64
# NOTE: definition below is based only on above.
# TODO: audit Julia codebase to find actual definition
const time_t = user_time_t
const user_off_t = Int64
const syscall_arg_t = u_int64_t


const uint8_t = Cuchar
const uint16_t = UInt16
const uint32_t = UInt32
const uint64_t = Culonglong
const int_least8_t = Int8
const int_least16_t = Int16
const int_least32_t = Int32
const int_least64_t = Int64
const uint_least8_t = UInt8
const uint_least16_t = UInt16
const uint_least32_t = UInt32
const uint_least64_t = UInt64
const int_fast8_t = Int8
const int_fast16_t = Int16
const int_fast32_t = Int32
const int_fast64_t = Int64
const uint_fast8_t = UInt8
const uint_fast16_t = UInt16
const uint_fast32_t = UInt32
const uint_fast64_t = UInt64
const intmax_t = Clong
const uintmax_t = Culong

# mutable struct timespec
#     tv_sec::__darwin_time_t
#     tv_nsec::Clong
# end

mutable struct tm
    tm_sec::Cint
    tm_min::Cint
    tm_hour::Cint
    tm_mday::Cint
    tm_mon::Cint
    tm_year::Cint
    tm_wday::Cint
    tm_yday::Cint
    tm_isdst::Cint
    tm_gmtoff::Clong
    tm_zone::Cstring
end

const clockid_t = Void
const rs_byte_t = UInt8
const rs_long_t = intmax_t

# begin enum ANONYMOUS_2
const ANONYMOUS_2 = UInt32
const RS_DELTA_MAGIC = (UInt32)(1920139830)
const RS_MD4_SIG_MAGIC = (UInt32)(1920139574)
const RS_BLAKE2_SIG_MAGIC = (UInt32)(1920139575)
# end enum ANONYMOUS_2

const rs_magic_number = Void

# begin enum ANONYMOUS_3
const ANONYMOUS_3 = UInt32
const RS_LOG_EMERG = (UInt32)(0)
const RS_LOG_ALERT = (UInt32)(1)
const RS_LOG_CRIT = (UInt32)(2)
const RS_LOG_ERR = (UInt32)(3)
const RS_LOG_WARNING = (UInt32)(4)
const RS_LOG_NOTICE = (UInt32)(5)
const RS_LOG_INFO = (UInt32)(6)
const RS_LOG_DEBUG = (UInt32)(7)
# end enum ANONYMOUS_3

const rs_loglevel = Void

# begin enum rs_result
const rs_result = UInt32
const RS_DONE = (UInt32)(0)
const RS_BLOCKED = (UInt32)(1)
const RS_RUNNING = (UInt32)(2)
const RS_TEST_SKIPPED = (UInt32)(77)
const RS_IO_ERROR = (UInt32)(100)
const RS_SYNTAX_ERROR = (UInt32)(101)
const RS_MEM_ERROR = (UInt32)(102)
const RS_INPUT_ENDED = (UInt32)(103)
const RS_BAD_MAGIC = (UInt32)(104)
const RS_UNIMPLEMENTED = (UInt32)(105)
const RS_CORRUPT = (UInt32)(106)
const RS_INTERNAL_ERROR = (UInt32)(107)
const RS_PARAM_ERROR = (UInt32)(108)
# end enum rs_result

struct rs_stats
    op::Cstring
    lit_cmds::Cint
    lit_bytes::rs_long_t
    lit_cmdbytes::rs_long_t
    copy_cmds::rs_long_t
    copy_bytes::rs_long_t
    copy_cmdbytes::rs_long_t
    sig_cmds::rs_long_t
    sig_bytes::rs_long_t
    false_matches::Cint
    sig_blocks::rs_long_t
    block_len::Csize_t
    in_bytes::rs_long_t
    out_bytes::rs_long_t
    start::time_t
    _end::time_t
end

const rs_stats_t = Void

mutable struct rs_mdfour
end

const rs_mdfour_t = Void
const rs_weak_sum_t = UInt32
const rs_strong_sum_t = NTuple{32, Cuchar}

mutable struct rs_signature
end

const rs_signature_t = Void

mutable struct rs_buffers_s
    next_in::Cstring
    avail_in::Csize_t
    eof_in::Cint
    next_out::Cstring
    avail_out::Csize_t
end

const rs_buffers_t = Void

mutable struct rs_job
end

const rs_job_t = Void
