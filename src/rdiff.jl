using Librsync
if VERSION < v"0.7-"
    using Compat: equalto
end
function findPoptArg(ARGVEC, shortArg::String, longArg::String, default = "")
    longArgStr = string("--", longArg, "=")
    nLongArgStr = length(longArgStr)
    for (i, arg) in enumerate(ARGVEC)
        if arg == string("-", shortArg)
            return get(ARGVEC, i + 1, default)
        elseif startswith(arg, longArgStr)
            return arg[nLongArgStr:end]
        end
    end
    return default
end
function findPoptPosArgTwo(ARGVEC, sigpos::Int)
    @inbounds if sigpos == 0 || length(ARGVEC) == sigpos
        return "", ""
    elseif length(ARGVEC) == sigpos + 1
        return ARGVEC[sigpos + 1], ""
    elseif length(ARGVEC) > sigpos + 1
        return ARGVEC[sigpos + 1], ARGVEC[sigpos + 2]
    end

    return "", ""
end
function findPoptPosArgThree(ARGVEC, sigpos)
    #TODO: Add a Val{} argument and generate this function (just for fun...)
    @inbounds if sigpos == 0 || length(ARGVEC) == sigpos
        return "", "", ""
    elseif length(ARGVEC) == sigpos + 1
        return ARGVEC[sigpos + 1], "", ""
    elseif length(ARGVEC) == sigpos + 2
        return ARGVEC[sigpos + 1], ARGVEC[sigpos + 2], ""
    elseif length(ARGVEC) > sigpos + 2
        return ARGVEC[sigpos + 1], ARGVEC[sigpos + 2], ARGVEC[sigpos + 3]
    end

    return "", ""
end

findHash(ARGVEC) = findPoptArg(ARGVEC, "H", "hash", "blake2")
function findBlockSize(ARGVEC)::Int
    #TODO: Figure out how to make this usage of parse inferrable?
    # Test cases to be added:
    # julia -e 'using Librsync; Librsync.main()' -- -b "Testing." -H "blake"
    # julia -e 'using Librsync; Librsync.main()' -- -b "" -H "blake"
    # julia -e 'using Librsync; Librsync.main()' -- -b -H "blake"
    # julia -e 'using Librsync; Librsync.main()' -- -b 1000 -H "blake"
    rawArg = findPoptArg(ARGVEC, "b", "block-size")
    try
        return parse(Int, rawArg)
    catch
        return Librsync.RS_DEFAULT_BLOCK_LEN
    end
end
function findSumSize(ARGVEC)::Int
    #TODO: Figure out how to make this usage of parse inferrable?
    rawArg = findPoptArg(ARGVEC, "S", "sum-size")
    try
        return parse(Int, rawArg)
    catch
        return 0
    end
end
const defaultSumSize = 0
function findSumSize(ARGVEC)::Int
    #TODO: Figure out how to make this usage of parse inferrable?
    rawArg = findPoptArg(ARGVEC, "S", "sum-size")
    try
        return parse(Int, rawArg)
    catch
        return defaultSumSize
    end
end
function findInputSize(ARGVEC)::Int
    #TODO: Figure out how to make this usage of parse inferrable?
    rawArg = findPoptArg(ARGVEC, "I", "input-size")
    try
        return parse(Int, rawArg)
    catch
        return Librsync.inbuflen
    end
end
function findOutputSize(ARGVEC)::Int
    #TODO: Figure out how to make this usage of parse inferrable?
    rawArg = findPoptArg(ARGVEC, "O", "output-size")
    try
        return parse(Int, rawArg)
    catch
        return Librsync.outbuflen
    end
end
findStats(ARGVEC) = in("-s", ARGVEC) || in("--statistics", ARGVEC)
findParanoia(ARGVEC) = in("--paranoia", ARGVEC)

function parseRdiffArgs(ARGVEC)
    hashMethod = findHash(ARGVEC)
    blockSize = findBlockSize(ARGVEC)
    sumSize = findSumSize(ARGVEC)
    inputSize = findInputSize(ARGVEC)
    outputSize = findOutputSize(ARGVEC)
    stats = findStats(ARGVEC)
    paranoia = findParanoia(ARGVEC)
    
    hashMethod, blockSize, sumSize, inputSize, stats, paranoia
end
function findRdiffMode(ARGVEC)
    for mode in ("signature", "delta", "patch")
        sigpos = findfirst(equalto(mode), ARGVEC)
        if sigpos > 0
            return mode, sigpos
        end
    end
    return "", 0
end
function generate_sig(basis::IO, sig::IO, hashMethod, blockSize, sumSize, inputSize, stats, paranoia)
    sig_magic = Librsync.RS_BLAKE2_SIG_MAGIC
    if hashMethod == "blake2"
        sig_magic = Librsync.RS_BLAKE2_SIG_MAGIC
    elseif hashMethod == "md4"
        if sumSize == defaultSumSize
            sumSize = 8
        end
        sig_magic = Librsync.RS_MD4_SIG_MAGIC
    else
        warn("Unknown hash algorithm $(hashMethod)")
        return -1
    end
    
    statStruct = Ref(Librsync.construct_rs_stats_t())

    result = Librsync.rs_sig_file(basis, sig, blockSize, sumSize, sig_magic, statStruct)
    
    if result != Librsync.RS_DONE
        return result
    end
    if stats
        Librsync.rs_log_stats(statStruct)
    end
    
    return result
end

function usage()
println("""
Usage: julia rdiff.jl [OPTIONS] signature [BASIS [SIGNATURE]]
                      [OPTIONS] delta SIGNATURE [NEWFILE [DELTA]]
                      [OPTIONS] patch BASIS [DELTA [NEWFILE]]

    Options:
        -?, --help                Show this help message
        -s, --statistics          Show performance statistics
    Signature generation options:
        -H, --hash=ALG            Hash algorithm: blake2 (default), md4
    Delta-encoding options:
        -b, --block-size=BYTES    Signature block size
        -S, --sum-size=BYTES      Set signature strength
            --paranoia            Verify all rolling checksums
    IO options:
        -I, --input-size=BYTES    Input buffer size
        -O, --output-size=BYTES   Output buffer size
""")
end
function main(ARGVEC)
    mode, sigpos = findRdiffMode(ARGVEC)
    if in("-h", ARGVEC) || in("-?", ARGVEC) || in("--help", ARGVEC)
        usage()
        exit(-1)
    end
    hashMethod, blockSize, sumSize, inputSize, stats, paranoia = parseRdiffArgs(ARGVEC)
    if mode == "signature"
        basis_file, sig_file = findPoptPosArgTwo(ARGVEC, sigpos)
        if basis_file == ""
            return -1
        end
        retval = -1
        if sig_file == ""
            open(basis_file, "r") do basis_io
                retval = generate_sig(basis_io, STDOUT, hashMethod, blockSize, sumSize, inputSize, stats, paranoia)
            end
        else
            open(sig_file, "w") do sig_io
                open(basis_file, "r") do basis_io
                    retval = generate_sig(basis_io, sig_io, hashMethod, blockSize, sumSize, inputSize, stats, paranoia)
                end
            end
        end
        
        return retval
    elseif mode == "delta"
        @show "delta unimplemented"
        @show findPoptPosArgThree(ARGVEC, sigpos)
        return 0
    elseif mode == "patch"
        @show "patch unimplemented"
        @show findPoptPosArgThree(ARGVEC, sigpos)
        return 0
    else
        usage()
        return -1
    end
end
exit(main(ARGS))