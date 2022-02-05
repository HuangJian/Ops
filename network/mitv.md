### enable adb
> 设备安全设置：设置--账号与安全--允许安装未知来源的应用--允许ADB调试。
> 
> 开启开发者模式：设置--关于--产品型号--遥控连续按5下OK键。

### connect to mitv
```bash
adb connect mi.tv
```

### install an app
```bash
adb install xxxx.apk
```

### type text
```bash
adb shell input text "some text"
```
