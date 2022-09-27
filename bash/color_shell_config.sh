## color shell personal features
# NB: "\[" escape is used to begin a sequence of non-printing characters
# NB: "\]" escape is used to signal the end of such a sequence
# NB: "\e" or "\033" or "\x1b" is shorthand for the Escape character
# WARN: writing in this script BLUE= "any_value" will result in bash to think it is a command because of the space after the = sign!

## 256 Color font attributes
# \x1b[38;5;#m foreground, # = 0 - 255
# \x1b[48;5;#m background, # = 0 - 255
## True Color
# \x1b[38;2;r;g;bm r = red, g = green, b = blue foreground
# \x1b[48;2;r;g;bm r = red, g = green, b = blue background
## True Color off 
# off = '\x1b[0m' # off
# default = '\x1b[39m' # default foreground
# DEFAULT = '\x1b[49m' # default background
## Font attributes 
# bd = '\x1b[1m' # bold
# ft = '\x1b[2m' # faint
# st = '\x1b[3m' # standout
# ul = '\x1b[4m' # underlined
# bk = '\x1b[5m' # blink
# rv = '\x1b[7m' # reverse
# hd = '\x1b[8m' # hidden
# nost = '\x1b[23m' # no standout
# noul = '\x1b[24m' # no underlined
# nobk = '\x1b[25m' # no blink
# norv = '\x1b[27m' # no reverse
## Examples
# echo -e "\x1b[38;2;50;50;50m Welcome BACK \x1b[39m ${BLUE}"
# echo -e "\x1b[48;2;100;100;100m Hello boiiii \x1b[49m"

## color variables
# COLOR1="\x1b[38;2;221;91;76m"
# COLOR2="\x1b[38;2;200;65;65m"
# 256 color format: https://misc.flogisoft.com/bash/tip_colors_and_formatting
# 256 color picker: https://jonasjacek.github.io/colors/ 
COLOR1="\e[38;5;168m"
COLOR2="\e[38;5;203m"
COLOR3="\e[38;5;69m"
NOCOLOR="\e[39m"
current_user="\\u"
working_directory="\\W"
pronter="ʘ "
pronter_2="▷ "
pronter_3="❯ "
current_machine="\\h"

# welcome message, generated with: http://www.patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=%20-%20ONYR%20-, using font: ANSI Shadow
echo -e "${COLOR3}
               ██████╗ ███╗   ██╗██╗   ██╗██████╗           
              ██╔═══██╗████╗  ██║╚██╗ ██╔╝██╔══██╗          
    █████╗    ██║   ██║██╔██╗ ██║ ╚████╔╝ ██████╔╝    █████╗
    ╚════╝    ██║   ██║██║╚██╗██║  ╚██╔╝  ██╔══██╗    ╚════╝
              ╚██████╔╝██║ ╚████║   ██║   ██║  ██║          
               ╚═════╝ ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝          
                                                            ${NOCOLOR}"


PS1=" ${COLOR2}❮ ${BLUE}${current_user} ★  ${current_machine}❯ ${COLOR3}❮ ${working_directory}❯${COLOR2}${pronter_3}${NOCOLOR}"
# PS1='\e[1;31;48;5;234m\u \e[38;5;240mon \e[1;38;5;28;48;5;234m\h \e[38;5;54m\d \@\e[0m\n\e[0;31;48;5;234m[\w] \e[1m\$\e[0m '
# PS1="${LIGHTBLUE}\\u ${BOLDYELLOW}[\\W] ${NOCOLOR}"

