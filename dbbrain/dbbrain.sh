#! /bin/bash

rm -rf ./*.txt

rm -rf ./{all,no_all}/
#cat ./dbbrain_slow.csv | grep ^[a-z] | cut -d, -f1 > b

#num=`wc -l ./b`

#echo $num

#sed s/[?$]/"'';"/g ./b > ./c

#for((x = 1; x <= $num; x++))
#do
#	echo $x
#	sed -i '$x i explain ' ./b
#done

#echo "create database stage;" | mysql -uroot -ptkamc.00
#echo "use stage;" | mysql -uroot -ptkamc.00
#echo "source ./t1.sql" | mysql -uroot -ptkamc.00
#echo "source ./t11.sql" | mysql -uroot -ptkamc.00

#touch ./all.txt
#touch ./no_all.txt

#python脚本把csv里的sql命令读出来并替换？为''，输出到dbbrain{n}.txt
python3 ./dbbrain.py

rm -rf ./dbbrain.txt

#创建两个文件夹保存结果
mkdir ./{all,no_all}/
#index=1
index1=1
index2=1
#读当前路径下的所有dbbrain{n}.txt，读出sql脚本输入到mysql执行，str保存输出结果的最后一行（默认两行）
for file in $(ls | cut -d' ' -f9 | grep ^dbbrain[0-9]*.txt)
do
	echo "explain $(cat ./$file);"

	#str=`echo "explain $(cat ./$file);" | mysql -Dstage | tail -1`
	#echo $str

	echo "explain $(cat ./$file);" | mysql -Dstage > result
	num=`wc -l ./result | cut -d' ' -f1`
	rm -rf ./result
	str=''
	for((i=1;i<$num;i++))
	do
		str=$str+`echo "explain $(cat ./$file);" | mysql -Dstage | tail -$i`
	done
	
	
	#判断str是否包含"ALL"子串
	if [[ $str =~ "ALL" ]]; then
		echo "$(cat ./$file)" >> ./all/all.woc
		echo "*******************************************************************$index1" >> ./all/all.woc
		index1=$(($index1+1))
		
	else
		echo "$(cat ./$file)" >> ./no_all/no_all.woc
		echo "*******************************************************************$index2" >> ./no_all/no_all.woc
		index2=$(($index2+1))
	fi
	#index=$(($index+1))
	#echo $index
done

#while read line
#do
	#echo "explain $line" | mysql -Dstage > ./d
#	str=`echo "explain $line" | mysql -Dstage | tail -1`
	#str=`cat ./d | tail -1`
#	echo $str
	
#	if [[ $str =~ "ALL" ]]; then
#		echo "$line" >> ./all.txt
#	else
#		echo "$line" >> ./no_all.txt
#	fi
	
#done < ./c

rm -rf ./*.txt
#$rm -rf ./{b,c,d}
