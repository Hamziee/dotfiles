#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '


alias asuspwr='asusctl profile get'
alias asuspwr-eco='asusctl profile set Quiet'
alias asuspwr-bal='asusctl profile set Balanced'
alias asuspwr-turbo='asusctl profile set Performance'

alias asusmux='supergfxctl -g'
alias asusmux-igpu='supergfxctl -m Integrated'
alias asusmux-hybrid='supergfxctl -m Hybrid'
alias asusmux-dgpu='supergfxctl -m AsusMuxDgpu'
