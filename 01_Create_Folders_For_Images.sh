OIFS="$IFS"
IFS=$'\n'
for f in ` find "/mnt/Processing/Clients/Scottish_Council_of_Law/2022-07-15_ABG_22009/05_Ready_For_Jpg_Output/"$1 -type d -mindepth 3 | sort` ; do
	file=$(echo "$f" | rev | cut -d"/" -f1 | rev )
	comp=$(echo "$f" | rev | cut -d"/" -f2 | rev )
	inst=$(echo "$f" | rev | cut -d"/" -f3 | rev )
	box=$(echo "$f" | rev | cut -d"/" -f4 | rev )

#	g=$("$(printf '%s' "$f" | sed 's/[.[\*^$]/\\&/g')")
echo "$file"
echo "$comp"
echo "$inst"
echo "$box"
mkdir -p "/mnt/Processing/Clients/Scottish_Council_of_Law/2022-07-15_ABG_22009/06_Output_Jpgs/"$box"/"$inst"/"$comp"/"$file
echo ________________________________________________________________________________________________
done
echo Done
IFS="$OIFS"
