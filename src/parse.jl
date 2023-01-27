#!/usr/bin/env julia

using TranscodingStreams, CodecBzip2
using EzXML

function main()
    ifn = "../data/jawiki-latest-abstract1.xml.bz2"
    if !isfile(ifn)
        throw(ErorrException("Error"))
    end
    open(Bzip2DecompressorStream, ifn) do stream
        reader = EzXML.StreamReader(stream)
        for i in reader
            if reader.name == "doc"
                tree = expandtree(reader)
            #     for c in eachelement(tree)
            #         if c.name == "abstract"
            #             println(c)
            #         end
            #     end
            end
        end
        # for line in eachline(stream)
        #     println(line)
        # end
    end
    # stream = Bzip2DecompressorStream(open(ifn))
    # for line in eachline(stream)
    #     println(line)
    # end
    # close(stream)
end

main()