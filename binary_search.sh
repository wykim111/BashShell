#!/bin/bash

#variable

array=()
state=-1

#input
function input()
{
	read n

	size=n

	for ((i=0;i<${size};i++)); do
		read num
		
		array[$i]=${num}

	done

}
#swap()
function swap()
{
	local temp
	local n1=$1
	local n2=$2

	temp=${array[${n1}]}
	array[${n1}]=${array[${n2}]}
	array[${n2}]=${temp}

}

#sort
function BubbleSort()
{
	for ((i=0;i<$size-1;i++)); do
		for ((j=o;j<$size-1-$i;j++)); do
			
			if [ ${array[$j]} -gt ${array[$(($j+1))]} ]; then
				swap $j $(($j+1))

			fi


		done

	done

}
#BinarySearch
function BinarySearch()
{
	local target=$1
	local s=0
	local e=$(($size-1))

	echo "start=${s}, end=${e}"	

	while [ "$s" -le "$e" ]
	do
		local mid
		let mid=$s+$e/2
		echo "mid=${mid}"

		if [ ${array[${mid}]} -gt ${target} ]; then
				e=${mid}-1
		elif [ ${array[${mid}]} -lt ${target} ]; then
				s=${mid}+1
		else
			state=1
			
			return
		fi

	done

	state=0	
}

#Print
function PrintResult()
{
	echo "찾을 데이터 입력"
	local num

	read num
	state="$(BinarySearch num)"
		
	if [ ${state} -eq 1 ]; then
			echo "${num}을 찾았습니다"
	else
			echo "${num}을 찾지 못하였습니다"
	fi

}

#main
input
echo "after input"
echo ${array[@]}
BubbleSort
echo "after bubbleSort"
echo ${array[@]}
echo "check array Data"
echo "${array[1]}"
PrintResult
