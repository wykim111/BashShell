#!/bin/bash

#define

TRUE=1
FALSE=0
ZERO=0

#value

declare -a Perm
declare -a array
declare -a check

MinRet=987654321

ArraySize=0
CalNum=0

function swap()
{
        local idx1=$1
        local idx2=$2
        local temp

        echo "idx1=$idx1,idx2=$idx2"
        temp=${array[${idx1}]}
        array[${idx1}]=${array[${idx2}]}
        array[${idx2}]=${temp}
}


function init()
{
        local num=${standard}
        local remainder=0

        while [ ${num} -ne ${ZERO} ]
        do
                let remainder=num%10
                array[ArraySize]=${remainder}
                check[ArraySize]=${ZERO}
                perm[ArraySize]=${ZERP}

                let num=num/10
                let ArraySize=ArraySize+1


        done

        echo "size=${ArraySize}"

        for ((i=0;i<${ArraySize}/2;i++)); do
                swap ${i}  $(($ArraySize-1-$i))
                echo "swap $i $(($ArraySize-1-$i))"
        done



}

function power()
{
        local exp=$1
        local digit=1

        echo "pow start"

        for ((i=0;i<${exp};i++)); do
                let digit=${digit}*10
        done

        echo "digit=${digit}"

        echo "pow end"

        return "$digit"
}

function calculate()
{
        local exp
        local digit

        echo "calculate start"
        echo "ArraySize=${ArraySize}"

        for ((i=0;i<${ArraySize};i++))
        do
                let exp=$ArraySize-$i-1
                let digit=$(power ${exp})
                echo "digit=$digit"

                let CalNum=$CalNum+$((${Perm[$i]}*${digit}))

        done


        echo "caculate end"

}

function permutation()
{
        local depth=$1

        if [ $depth -eq $ArraySize ]; then
                for ((i=0;i<$ArraySize;i++)); do
                        printf "${Perm[$i]}"

                done
                        echo ""

                CalNum=0

                calculate

                temp=${CalNum}

                echo "temp=$temp"

                if [ ${standard} -lt ${temp} ]; then
                        if [ ${minRet} -gt ${temp} ]; then
                                minRet=${temp}
                                echo "perm -> minRet=${temp}"
                        fi

                fi


        else

                for ((i=0;i<$ArraySize;i++)); do

                        if [ ${check[$i]} -eq ${TRUE} ]; then
                                continue
                        fi

                        echo "i=$i"
                        check[$i]=${TRUE}
                        Perm[$depth]=${array[$i]}
                        depth=$(($depth+1))

                        (permutation $depth)

                        depth=$(($depth-1))
                        check[$i]=${FALSE}
                done
        fi
}
#main

read standard
init
echo "array[@] = ${array[@]}"
permutation 0
echo "minRet=$MinRet"
