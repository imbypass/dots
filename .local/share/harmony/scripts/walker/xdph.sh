#!/bin/bash

SELECTED=NULL
TEMP_FILE=$XDG_RUNTIME_DIR/xdphpicker.temp

CURRENT_TIMESTAMP=$(date +%s)
FILE_TIMESTAMP=$(date -r $TEMP_FILE +%s)

# save selection for 10 seconds in case when the app requests it a few times
if ! [ -e $TEMP_FILE ] || [ $((CURRENT_TIMESTAMP - FILE_TIMESTAMP)) -gt 10 ]; then
    SELECTED=$(walker -kHn --modules xdphpicker)

    echo $SELECTED > $TEMP_FILE
else
    SELECTED=$(cat $TEMP_FILE)
fi

echo $SELECTED
