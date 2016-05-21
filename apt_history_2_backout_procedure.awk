BEGIN {
    RS="\n\n";
    FS="\n";
}

NR > 1{
    # Report filename to write
    split($1,begin_date," ");
    report_filename = begin_date[2] ".txt";

    # Language change
    gsub("Start-Date","Başlangıç",$1); 
    gsub("End-Date","Bitiş",$4);
    # Operation begin and end time
    print $1  " - " $4 > report_filename; 


    # Language change
    gsub("Commandline","Çalıştırılan komut",$2);
    # Used command
    print $2 > report_filename;

    # Operation type
    split($3,operation,": ");
    print operation[1] > report_filename;

    # Installed or Upgraded packages and versions
    package_size = split(operation[2],packages,"), "); 
    for(i in packages)
    {
        packages[i] = i==package_size ? packages[i] : packages[i] ")";
        print packages[i] > report_filename;
    }
    print "\n" > report_filename;
}
