#!/bin/sh

#Process protect demo

BIN_PATH=/home/mike/Learn/LeranShell/go-wol-frp-http
BIN_NAME=go-wol-frp-http
BIN_PARAM="9998"
RETRY_TIME_IF_FAILURE=5



checkIsProcRunning() {
  procName=$1
  lineCount=$(pgrep $procName | wc -l)
		if [ $lineCount -eq 0 ]
    then #NOT Running
      return 0
		else #Running
      return 1
		fi
}

while true
do
  checkIsProcRunning $BIN_NAME
  isRun=$?
  if [ $isRun -eq 0 ]; then
    echo "Restart..., executing '$BIN_PATH/$BIN_NAME $BIN_PARAM'"
    # cd $BIN_PATH$BIN_NAME 9998 > /dev/null 2>&1 &
    cd $BIN_PATH
    ./$BIN_NAME $BIN_PARAM > /dev/null 2>&1 &
    else
    echo $BIN_NAME is running...
  fi
  sleep $RETRY_TIME_IF_FAILURE
done
