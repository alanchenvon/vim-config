#!/bin/sh

 pathToDecompiler=${HOME}/.vim/java_decompiler/cfr_0_115.jar

 fileType=$(echo $* | cut -f1 -d:)
 jarFile=$(echo $* | cut -f2 -d:)
 classFile=$(echo $* | cut -f4 -d:)
 uuid=$(uuidgen)


 if [ $fileType = "zipfile" ]
 then
      tmpDir=/tmp/$uuid
      unzip -qq $jarFile $classFile -d $tmpDir
      java -jar $pathToDecompiler $tmpDir/$classFile
      rm -rf /tmp/$uuid/ >&/dev/null
 else
      java -jar $pathToDecompiler $*
 fi

