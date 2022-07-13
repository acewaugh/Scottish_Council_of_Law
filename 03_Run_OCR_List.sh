OIFS="$IFS"
IFS=$'\n'
for f in ` find /mnt/Processing/Clients/Scottish_Council_of_Law/2022-07-15_ABG_22009/08.5_Ocr_List_Files/01_OCR_List_Store/ -type f -name '*.ocr' | sort` ; do
	file=$(echo "$f" | rev | cut -d"#" -f1 | rev | cut -d"#" -f1 | rev | cut -d. -f2- | rev)
	comp=$(echo "$f" | rev | cut -d"#" -f2 | rev )
	inst=$(echo "$f" | rev | cut -d"#" -f3 | rev )
	box=$(echo "$f" | rev | cut -d"#" -f4 | cut -d/ -f1 |rev )

	#image=$(echo "$f" | cut -d/ -f9)
	echo Working on....."$file"
	#echo $book $box
	echo $file
	mv $f  "/mnt/Processing/Clients/Scottish_Council_of_Law/2022-07-15_ABG_22009/08.5_Ocr_List_Files/01_OCR_List_Store/"$box"#"$inst"#"$comp"#"$file.working
	echo $file.working
	#wait 1
	mkdir -p "/mnt/Processing/Clients/Scottish_Council_of_Law/2022-07-15_ABG_22009/08_Ready_For_Final_QA/"$box"/"$inst"/"$comp"/"
	#tesseract /mnt/Processing/Clients/Scottish_Council_of_Law/2022-07-15_ABG_22009/02_OCR_List_Store/$book.processed /Processing_Store001/Mergent/03_Final_Output_PDFs/$book  --oem 1 -l eng pdf

	tesseract "/mnt/Processing/Clients/Scottish_Council_of_Law/2022-07-15_ABG_22009/08.5_Ocr_List_Files/01_OCR_List_Store/"$box"#"$inst"#"$comp"#"$file.working "/mnt/Processing/Clients/Scottish_Council_of_Law/2022-07-15_ABG_22009/08_Ready_For_Final_QA/"$box"/"$inst"/"$comp"/"$file -l eng --oem 1 --psm 1  pdf
	mv "/mnt/Processing/Clients/Scottish_Council_of_Law/2022-07-15_ABG_22009/08.5_Ocr_List_Files/01_OCR_List_Store/"$box"#"$inst"#"$comp"#"$file.working  "/mnt/Processing/Clients/Scottish_Council_of_Law/2022-07-15_ABG_22009/08.5_Ocr_List_Files/02_Complete_Lists/"$box"#"$inst"#"$comp"#"$file.working

done
echo Done!
IFS="$OIFS"
