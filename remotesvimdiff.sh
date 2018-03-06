# 180306 - uMtMu
# vimdiff scp://username@remote1:/filedir scp://username@remote2:/filedir -> netrw err
# i need root priv with sudo

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
