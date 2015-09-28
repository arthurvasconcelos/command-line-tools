#############################################################
#                         LS COLOR                          #
#############################################################
############### STYLES ###################### COLORS ########
#############################################################
# 0   = default colour              # 31 = red              #
# 1   = bold                        # 32 = green            #
# 4   = underlined                  # 33 = orange           #
# 5   = flashing text               # 34 = blue             #
# 7   = reverse field               # 35 = purple           #
# 40  = black background            # 36 = cyan             #
# 41  = red background              # 37 = grey             #
# 42  = green background            # 90 = dark grey        #
# 43  = orange background           # 91 = light red        #
# 44  = blue background             # 92 = light green      #
# 45  = purple background           # 93 = yellow           #
# 46  = cyan background             # 94 = light blue       #
# 47  = grey background             # 95 = light purple     #
# 100 = dark grey background        # 96 = turquoise        #
# 101 = light red background        #                       #
# 102 = light green background      #                       #
# 103 = yellow background           #                       #
# 104 = light blue background       #                       #
# 105 = light purple background     #                       #
# 106 = turquoise background        #                       #
#############################################################

# Legend
# di = directory
# fi = file
# ln = symbolic link
# pi = fifo file
# so = socket file
# bd = block (buffered) special file
# cd = character (unbuffered) special file
# or = symbolic link pointing to a non-existent file (orphan)
# mi = non-existent file pointed to by a symbolic link (visible when you type ls -l)
# ex = file which is executable (ie. has 'x' set in permissions).
# *.rpm = files with the ending .rpm

alias ls='ls --color'
export LS_COLORS='no=00:fi=00:di=01;34:ln=00;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=41;33;01:ex=00;32:*.cmd=00;32:*.exe=01;32:*.com=01;32:*.bat=01;32:*.btm=01;32:*.dll=01;32:*.tar=00;31:*.tbz=00;31:*.tgz=00;31:*.rpm=00;31:*.deb=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.lzma=00;31:*.zip=00;31:*.zoo=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.tb2=00;31:*.tz2=00;31:*.tbz2=00;31:*.avi=01;35:*.bmp=01;35:*.fli=01;35:*.gif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mng=01;35:*.mov=01;35:*.mpg=01;35:*.pcx=01;35:*.pbm=01;35:*.pgm=01;35:*.png=01;35:*.ppm=01;35:*.tga=01;35:*.tif=01;35:*.xbm=01;35:*.xpm=01;35:*.dl=01;35:*.gl=01;35:*.wmv=01;35:*.aiff=00;32:*.au=00;32:*.mid=00;32:*.mp3=00;32:*.ogg=00;32:*.voc=00;32:*.wav=00;32:'
