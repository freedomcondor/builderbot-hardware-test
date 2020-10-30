for file in *.uyvy
do
	echo converting ${file%.uyvy}
	ffmpeg -f rawvideo -s 320x240 -pix_fmt uyvy422 -i ${file} ${file%.uyvy}.png
done
