## [convert mp4 to gif](https://superuser.com/questions/556029/how-do-i-convert-a-video-to-gif-using-ffmpeg-with-reasonable-quality)
```bash
ffmpeg -i input.mp4 \
  -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
  -loop 0 \
  output.gif
```

## [resize/scale](https://trac.ffmpeg.org/wiki/Scaling)
```bash
ffmpeg -i sister.MOV -vf scale=360:640,setsar=1:1 sister.mp4
```


## [cut video](https://ottverse.com/trim-cut-video-using-start-endtime-reencoding-ffmpeg/)
```bash
ffmpeg -i brother.mp4 -ss 00:05 brother2.mp4
ffmpeg -i background.mp4 -ss 00:12 -to 00:55 background2.mp4
```


## [Remove Audio from Video](https://ottverse.com/add-remove-extract-audio-from-video-using-ffmpeg/)
```bash
ffmpeg -i sister.mp4 -c:v copy -an sister3.mp4
```


## [add text](https://stackoverflow.com/questions/17623676/text-on-video-ffmpeg)
```bash
ffmpeg -i brother3.mp4 \
  -vf "drawtext=text='哥哥@Oct 2017': fontfile=/System/Library/Fonts/PingFang.ttc: x=(w-text_w)-12: y=12: fontsize=14: fontcolor=red:" \
  -c:a copy brother4.mp4
ffmpeg -i sister3.mp4 \
  -vf "drawtext=text='妹妹@Dec 2021': fontfile=/System/Library/Fonts/PingFang.ttc: x=(w-text_w)-12: y=12: fontsize=14: fontcolor=red:" \
  -c:a copy sister4.mp4
```

  
## merge videos side by side
```bash
ffmpeg -i brother4.mp4 -i sister4.mp4 -filter_complex hstack kids.mp4
```


## [extract audio from video](https://stackoverflow.com/questions/9913032/how-can-i-extract-audio-from-video-with-ffmpeg)
```bash
ffmpeg -i background2.mp4 -q:a 0 -map a background3.mp3
```


# [add background music to video](https://stackoverflow.com/a/11783474/474231)
```bash
ffmpeg -i kids.mp4 -i background3.mp3 -map 0:v -map 1:a -c:v copy -shortest output.mp4
```
