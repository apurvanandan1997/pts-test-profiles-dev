#!/bin/sh

tar -xf mbw-20180908.tar.xz
if [ $OS_TYPE = "BSD" ]
then
        patch -p0 < MEMCPY.patch
fi
cd mbw

CFLAGS="-O3 -march=native $CFLAGS"
cc $CFLAGS -o mbw mbw.c
echo $? > ~/install-exit-status
cd ~

echo "#!/bin/sh
cd mbw/
./mbw \$@ > \$LOG_FILE 2>&1
echo \$? > ~/test-exit-status" > mbw-benchmark
chmod +x mbw-benchmark

