#!/bin/bash
trap "exit" INT

LOG_PATH="${HOME}/Documents/Pomodoro/"

log(){
    CURR_DATE=`date +%Y-%m-%d`
    CURR_TIME=`date +%H:%M`

    echo -e "_${CURR_DATE} ${CURR_TIME}_\t${1}" >> "${LOG_PATH}${CURR_DATE}.log.md"
}

finish(){
  if [ "$(uname)" == "Darwin" ]; then
    say -v Kate "${1}"
    terminal-notifier -message 'Pomodoro'\
    -title "${1}"\
    -sound Crystal
  elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    say "${1}"
    notify-send "Pomodoro" "${1}"
  #elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
      # Do something under 32 bits Windows NT platform
  #elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
      # Do something under 64 bits Windows NT platform
  fi
}

while :; do
    case $1 in
        -t|--time) TIME="$2"
        shift
        ;;
        -m|--message) MESSAGE="$2"
        shift
        ;;
        -l|--log) LOG_PATH="$2/"
        shift
        ;;
        *) break
    esac
    shift
done

if [ -z "$TIME" ]
then
    echo "How many rounds you want to do (minutes)?"
    read TIME
fi

START_MESSAGE="Timer(${TIME}m) started"
END_MESSAGE="Timer(${TIME}m) ended"

if [ -z "$MESSAGE" ]
then
    log "${START_MESSAGE}"
else
    log "**${MESSAGE}**\t${START_MESSAGE}"
fi

timer ${TIME}m && FINISHED="finished"

if [ ! -z "$FINISHED" ]
then
    if [ -z "$MESSAGE" ]
    then
        log "${END_MESSAGE}"
    else
        log "**${MESSAGE}**\t${END_MESSAGE}"
    fi

    finish "Work Timer is up! Take a Break."
else
    echo "What is the reason of termination?"
    read REASON
    log "Early termination with reason: **${REASON}**"
fi
