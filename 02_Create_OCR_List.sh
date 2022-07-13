OIFS="$IFS"
IFS=$'\n'

for f in ` find  "/mnt/Processing/Clients/ABRSM/2022-03-16_ABG_22002/07_Ready_For_OCR/"$1 -type f -name "*.jpg" | sort` ; do
echo $f
	image=$(echo "$f" | rev | cut -d"/" -f1 | rev )
	file=$(echo "$f" | rev | cut -d"/" -f2 | rev )
	comp=$(echo "$f" | rev | cut -d"/" -f3 | rev )
	inst=$(echo "$f" | rev | cut -d"/" -f4 | rev )
	box=$(echo "$f" | rev | cut -d"/" -f5 | rev )
echo box $box
echo inst $inst
echo comp $comp
echo file $file
echo image $image
echo ________________________________________________________________

echo $f >>  "/mnt/Processing/Clients/ABRSM/2022-03-16_ABG_22002/08.5_Ocr_List_Files/01_OCR_List_Store/"$box"#"$inst"#"$comp"#"$file.ocr


#echo $f
done
echo Done!
IFS="$OIFS"
#sh 03_Run_OCR_Lists.sh
