#!/bin/sh

rm -rf $HOME/mafft_
mkdir $HOME/mafft_
tar -xvf mafft-7.392-without-extensions-src.tgz
cd mafft-7.392-without-extensions/core/

if [ $OS_TYPE = "BSD" ]
then
	gmake clean
else
	make clean
fi

sed -i -e "s|PREFIX = /usr/local|PREFIX = $HOME/mafft_|g" Makefile

if [ $OS_TYPE = "BSD" ]
then
	gmake -j $NUM_CPU_JOBS ENABLE_MULTITHREAD=-Denablemultithread
else
	make -j $NUM_CPU_JOBS ENABLE_MULTITHREAD=-Denablemultithread
fi
echo $? > ~/install-exit-status
if [ $OS_TYPE = "BSD" ]
then
	gmake install
else
	make install
fi
cd ~/
cp -f mafft-7.392-without-extensions/scripts/mafft mafft_/
rm -rf mafft-7.392-without-extensions/

bunzip2 pyruvate_decarboxylase.fasta.bz2 -c > mafft_/pyruvate_decarboxylase.fasta
patch -p0 < REPLACE_BASH_INTERPRETER.patch
cat>mafft<<EOT
#!/bin/sh
cd mafft_/
./mafft --thread \$NUM_CPU_CORES --localpair --maxiterate 20000 pyruvate_decarboxylase.fasta > \$LOG_FILE
echo \$? > ~/test-exit-status
EOT
chmod +x mafft
