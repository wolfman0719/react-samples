# react & IRIS サンプル


## ローカルセットアップ

```
>set file = "c:\git\upload\src\SetUp.cls"
>write $system.OBJ.Load(file,"ck")
>set dir = "c:\git\upload\src"
>write ##class(TEST.Setup).SetupLocal(dir)
```
