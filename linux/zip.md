## 7zip 

### compress with password
```bash
docker run --rm -it \
  --workdir /data \
  -v $(PWD):/data \
  crazymax/7zip \
  7za a x.7z source.* -p"SECRET"
```

### extract with password
```bash
docker run --rm -it \
  --workdir /data \
  -v $(PWD):/data \
  crazymax/7zip \
  7za x x.7z -p"SECRET"
```
