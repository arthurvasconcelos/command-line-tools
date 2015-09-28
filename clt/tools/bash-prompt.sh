##############
# COLOR TERM #
##############

if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then export TERM=gnome-256color
elif [[ $TERM != dumb ]] && infocmp xterm-256color >/dev/null 2>&1; then
    export TERM=xterm-256color
fi

# Printing all 256 pallet colors
# ( x=`tput op` y=`printf %$((${COLUMNS}-6))s`;for i in {0..256};do o=00$i;echo -e ${o:${#o}-3:3} `tput setaf $i;tput setab $i`${y// /=}$x;done; )

##############
# DEF COLORS #
##############

if tput setaf 1 &> /dev/null; then
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
        BLACK=$(tput setaf 0)
        RED=$(tput setaf 1)
        DARKRED=$(tput setaf 88)
        GREEN=$(tput setaf 2)
        YELLOW=$(tput setaf 3)
        BLUE=$(tput setaf 4)
        CYAN=$(tput setaf 6)
        WHITE=$(tput setaf 7)
        MAGENTA=$(tput setaf 9)
        PURPLE=$(tput setaf 141)
        ORANGE=$(tput setaf 172)
        LIGHTYELLOW=$(tput setaf 190)
    else
        BLACK=$(tput setaf 0)
        RED=$(tput setaf 1)
        GREEN=$(tput setaf 2)
        YELLOW=$(tput setaf 3)
        BLUE=$(tput setaf 4)
        MAGENTA=$(tput setaf 5)
        CYAN=$(tput setaf 6)
        WHITE=$(tput setaf 7) #LIGHTGRAY
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
    BLINK=$(tput blink)
    REVERSE=$(tput smso)
    UNDERLINE=$(tput smul)
else
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi


##########################
# The return code of the #
# previous command if it #
# exits non-zero.        #
# Otherwise blank.       #
##########################

function nonzero_return() {
    RETVAL=$?
    [ $RETVAL -ne 0 ] && echo "$RETVAL"
}

####################
# PARSE GIT BRANCH #
####################

function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" = "" ]; then
        STAT=`parse_git_dirty`
        echo "${BLACK}on ${PURPLE}(${BRANCH}${STAT})"
    else
        echo ""
    fi
}

###################
# PARSE GIT DIRTY #
###################

function parse_git_dirty {
    STATUS=`git status 2>&1 | tee`
    STATUSP=`git status -b --porcelain`

    AHEAD=`echo -n "${STATUS}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    AHEADC=`echo -n "${STATUSP}" | egrep '.+ahead ([0-9]+).+' | grep -Eo '[0-9]{1,}'`

    BEHIND=`echo -n "${STATUS}" 2> /dev/null | grep "Your branch is behind" &> /dev/null; echo "$?"`
    BEHINDC=`echo -n "${STATUSP}" | egrep '.+behind ([0-9]+).+' | grep -Eo '[0-9]{1,}'`

    STAGED=`echo -n "${STATUS}" 2> /dev/null | grep "Changes to be committed" &> /dev/null; echo "$?"`
    STAGEDC=`echo -n "${STATUSP}" | egrep -c '^[^ ?#]. .+'`

    UNSTAGED=`echo -n "${STATUS}" 2> /dev/null | grep "Changes not staged for commit" &> /dev/null; echo "$?"`
    UNSTAGEDC=`echo -n "${STATUSP}" | egrep -c '^.[^ ?#] .+'`

    UNTRACKED=`echo -n "${STATUS}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    UNTRACKEDC=`echo -n "${STATUSP}" | egrep -c '^\?\? .+'`

    DIRTY=`echo -n "${STATUS}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    DIRTY1=`echo -n "${STATUSP}" | egrep -c '^M  .+'`
    DIRTY2=`echo -n "${STATUSP}" | egrep -c '^ M .+'`
    DIRTYC=`expr ${DIRTY1} + ${DIRTY2}`

    NEWFILE=`echo -n "${STATUS}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    NEWFILE1=`echo -n "${STATUSP}" | egrep -c '^A  .+'`
    NEWFILE2=`echo -n "${STATUSP}" | egrep -c '^ A .+'`
    NEWFILE3=`echo -n "${STATUSP}" | egrep -c '^AM .+'`
    NEWFILEC=`expr ${NEWFILE1} + ${NEWFILE2} + ${NEWFILE3}`

    DELETED=`echo -n "${STATUS}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    DELETED1=`echo -n "${STATUSP}" | egrep -c '^D  .+'`
    DELETED2=`echo -n "${STATUSP}" | egrep -c '^ D .+'`
    DELETEDC=`expr ${DELETED1} + ${DELETED2}`

    RENAMED=`echo -n "${STATUS}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    RENAMED1=`echo -n "${STATUSP}" | egrep -c '^R  .+'`
    RENAMED2=`echo -n "${STATUSP}" | egrep -c '^ R .+'`
    RENAMEDC=`expr ${RENAMED1} + ${RENAMED2}`

    BITS=''

    if [ "${RENAMED}" = "0" ]; then
        BITS=" >:${RENAMEDC}${BITS}"
    fi

    if [ "${DELETED}" = "0" ]; then
        BITS=" X:${DELETEDC}${BITS}"
    fi

    if [ "${NEWFILE}" = "0" ]; then
        BITS=" +:${NEWFILEC}${BITS}"
    fi

    if [ "${DIRTY}" = "0" ]; then
        BITS=" !:${DIRTYC}${BITS}"
    fi

    if [[ ( "${STAGED}" = "0" || "${UNSTAGED}" = "0" || "${UNTRACKED}" = "0" ) && ( "${DIRTY}" = "0" || "${NEWFILE}" = "0" || "${DELETED}" = "0" || "${RENAMED}" = "0" ) ]]; then
        BITS=" |${BITS}"
    fi

    if [ "${UNTRACKED}" = "0" ]; then
        BITS=" U:${UNTRACKEDC}${BITS}"
    fi

    if [ "${UNSTAGED}" = "0" ]; then
        BITS=" W:${UNSTAGEDC}${BITS}"
    fi

    if [ "${STAGED}" = "0" ]; then
        BITS=" S:${STAGEDC}${BITS}"
    fi

    if [[ ( "${AHEAD}" = "0" || "${BEHIND}" = "0" ) && ( "${STAGED}" = "0" || "${UNSTAGED}" = "0" || "${UNTRACKED}" = "0" ) ]]; then
        BITS=" |${BITS}"
    fi

    if [ "${BEHIND}" = "0" ]; then
        BITS=" ↓:${BEHINDC}${BITS}"
    fi

    if [ "${AHEAD}" = "0" ]; then
        BITS=" ↑:${AHEADC}${BITS}"
    fi

    if [ ! "${BITS}" = "" ]; then
        echo "${BITS}"
    else
        echo ""
    fi
}

#####################
# PARSE VIRTUAL ENV #
#####################

function parse_virtualenv {
  if [[ -n "$VIRTUAL_ENV" ]]; then
    VIRTUALENV=`basename "$VIRTUAL_ENV"`
    echo -e "${BLACK}with ${GREEN}(${VIRTUALENV}) "
  fi
}

###################
# PARSE CONDA ENV #
###################

function parse_condaenv {
  if [[ $CONDA_DEFAULT_ENV ]]; then
    echo -e "${BLACK}with ${GREEN}(${CONDA_DEFAULT_ENV}) "
  fi
}

########################
# PARSE CURRENT DISTRO #
########################

function parse_distro {
    if [ "$BASH_HIDE_DISTRO" ]; then
        echo ""
    else
        DISTRORH=`cat /etc/redhat-release 2> /dev/null`
        DISTRODEB=`lsb_release -a 2> /dev/null | grep 'Description:' | cut -d: -f2 | awk '{ print $1, $2, $3 }'`
        if [ ! "${DISTRORH}" = "" ]; then
            echo "${BLACK}with ${CYAN}${DISTRORH} "
        elif [ ! "${DISTRODEB}" = "" ]; then
            echo "${BLACK}with ${CYAN}${DISTRODEB} "
        else
            echo ""
        fi
    fi
}

##############
# EXPORT PS1 #
##############

# LEGEND
# \n -> Newline
# \d -> Date
# \A -> HH:MM (24h)
# \@ -> HH:MM (12h)
# \t -> HH:MM:SS (24h)
# \T -> HH:MM:SS (12h)
# \s -> Shell being executed
# \v -> Shell version
# \V -> Shell release
# \u -> Logged-in User
# \h -> Hostname
# \h -> Full Hostname
# \w -> The path to the current working directory, with $HOME abbreviated to ~
# \W -> The current working directory, with $HOME abbreviated to ~
# \$ -> Shows a $ for a regular user or # for root user
# \\ -> A literal backslash "\" character

if [ "$BASH_PROMPT_THEME" = "cold" ]; then
    export PS1="\n\[${RESET}${CYAN}\]\t \[${BOLD}${BLUE}\]\u \[${BOLD}${BLACK}\]at \[${BOLD}${PURPLE}\]\h \`parse_distro\`\[${BOLD}${BLACK}\]in \[${RESET}${WHITE}\]\w \`parse_virtualenv\`\`parse_condaenv\`\`parse_git_branch\` \[${BOLD}${BLACK}\]\n\$ \[${RESET}\]"
# elif [ "$BASH_PROMPT_THEME" = "WHATELSE" ]; then
else
    # DEFAULT "warm"
    export PS1="\n\[${BOLD}${BLUE}\][\t] \[${RED}\]\u \[${BLACK}\]at \[${ORANGE}\]\h \`parse_distro\`\[${BLACK}\]in \[${YELLOW}\]\w \`parse_virtualenv\`\`parse_condaenv\`\`parse_git_branch\` \[${BLACK}\]\n\$ \[${RESET}\]"
fi
