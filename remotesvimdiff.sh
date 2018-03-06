rvimdiff ()
{
    if [ "$#" -lt 3 ]
    then
        echo "Usage: rvimdiff file remote1 .. remoteN"
    fi

    file="$1"

    cmd="vimdiff"
    for remote in "${@:2}"
    do
        cmd="$cmd <(ssh $remote sudo cat $file)"
    done

    eval $cmd
}
