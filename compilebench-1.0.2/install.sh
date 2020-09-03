#!/bin/sh

tar -jxvf compilebench-0.6.tar.bz2

echo "#!/bin/sh
cd compilebench-0.6/
rm -rf t/
mkdir t/
if [ $OS_TYPE = "BSD" ]
then
	python2.7 ./compilebench \$@ > \$LOG_FILE 2>&1
else
        python2 ./compilebench \$@ > \$LOG_FILE 2>&1
fi
echo \$? > ~/test-exit-status" > compilebench
chmod +x compilebench
