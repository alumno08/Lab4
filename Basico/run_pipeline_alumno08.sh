#!/bin/bash
rm nombre_libro
rm ../dat/*.dat
rm ../figs/*.png
rm results.txt
rm results2.txt

archivo=./books/*.txt
for i in $archivo; do
libro=$i
f=${libro##*/}             
echo "${f%.*}" >> nombre_libro
done

module load anaconda/2020.11 

#APARATADO 1

#Libro abyss.txt
python countwords.py ./books/abyss.txt ../dat/abyss.dat
python plotcounts.py ../dat/abyss.dat ../figs/abyss.png
python testzipf.py ../dat/abyss.dat > results.txt

#Libro isles.txt
python countwords.py ./books/isles.txt ../dat/isles.dat
python plotcounts.py ../dat/isles.dat ../figs/isles.png
python testzipf.py ../dat/isles.dat >> results.txt

#Libro last.txt
python countwords.py ./books/last.txt ../dat/last.dat
python plotcounts.py ../dat/last.dat ../figs/last.png
python testzipf.py ../dat/last.dat >> results.txt

#Libro sierra.txt
python countwords.py ./books/sierra.txt ../dat/sierra.dat
python plotcounts.py ../dat/sierra.dat ../figs/sierra.png
python testzipf.py ../dat/sierra.dat >> results.txt


#APARTADO 2

rm ../dat/*.dat
rm ../figs/*.png

while IFS= read -r line
do
for i in $line;do
python countwords.py ./books/$i.txt ../dat/$i.dat
python plotcounts.py ../dat/$i.dat ../figs/$i.png
python testzipf.py ../dat/$i.dat >> results2.txt
done
done < nombre_libro

module unload anaconda/2020.11 
