for file in *.uyvy
do
	name=${file%.uyvy}
	name=${name##*/}
	echo converting ${name} 
	ffmpeg -f rawvideo -s 320x240 -pix_fmt uyvy422 -i ${file} ${name}.png
done
