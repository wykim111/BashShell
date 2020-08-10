#!/bin/bash

function factorial ()
{
        local num=$1;
        if [ $num = 0 ]; then
                echo 1
                return
        fi
        echo $(( $num * $(factorial $(( $num - 1 )) ) ))
}


echo "$1! = " $(factorial $(($1)))

