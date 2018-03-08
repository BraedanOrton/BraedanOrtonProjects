# GULAM shell - adapted to meet my needs.
# Adapt it to suit yourself.

#-----------------------------------------------------------------------------
msoff	# turn mouse off
# set some variables
	set	dir_cache 1
	set	verbosity 2
	set 	history 25

#-----------------------------------------------------------------------------
# my prompt
	set	prompt	'$ncmd >'
	set	prompt_tail	' '

#-----------------------------------------------------------------------------
# communications
	set	baud_rate	2400

#-----------------------------------------------------------------------------
# set some aliases -----------------------------------------------------------
alias	h	history
alias	pu	pushd
alias	po	popd

alias	rm	'rm -i'
alias	Rm	rm

alias	quit	exit
alias	logout	exit
alias	lo	exit	

alias	lc	'ls -cF'
alias	l	'ls -lF'

alias   mg	ue

set env_style unix
#------------------------------------------------------------------------------
# Do the C compiler stuff

set path C:\c68\bin,C:\devpac,C:\devpac\bin
set PATH $path
setenv SUFF ,.prg,.tos,.ttp
setenv PATH C:\c68\bin,C:\devpac,C:\devpac\bin
setenv LIB C:\c68\lib
setenv INCLUDE C:\c68\include
setenv C68LIB C:\c68\lib
setenv C68INCLUDE C:\c68\include
setenv C68INC C:\c68\include
setenv TIMEZONE MST:0:MDT

rehash
