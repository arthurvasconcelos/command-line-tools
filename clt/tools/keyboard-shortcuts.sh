if [ "$KEYBOARD_LAYOUT" = "dvorak" ]; then
    source "$COMMAND_LINE_TOOLS/keyboard-shortcuts/dvorak/aliases.sh"
    export INPUTRC=$COMMAND_LINE_TOOLS/keyboard-shortcuts/dvorak/inputrc
# elif [ "$KEYBOARD_LAYOUT" = "WHATELSE" ]; then
else
	# DEFAULT "qwerty"
    source "$COMMAND_LINE_TOOLS/keyboard-shortcuts/qwerty/aliases.sh"
    export INPUTRC=$COMMAND_LINE_TOOLS/keyboard-shortcuts/qwerty/inputrc
fi
