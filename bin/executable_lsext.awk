BEGIN {
    FS = ":"
}

{
    split($2, a, " ")
    t = a[1]
    type[t] = type[t] "|" $1  
    # print "Type: " t " file: " $1 " result is type[t]: " type[t]
    # for (x in type) {print x " -> " type[x]}
    # printf "\n\n"
} 

END {
    for (t in type) {
        print "Type: " t
        split(type[t], files, "|")
        for (file in files) {
            if (files[file] != "")
                print "  - " files[file]
            }
        printf "\n"
    }
}



# awk -F: '{split($2, a, " "); print a[1], $1}'