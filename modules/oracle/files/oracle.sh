if [ "$USER" = "oracle" ]; then
	#umask 022

	# if running bash
	if [ -n "$BASH_VERSION" ]; then
	    # include .bashrc if it exists
	    if [ -f "$HOME/.bashrc" ]; then
	        . "$HOME/.bashrc"
	    fi
	fi

	# set PATH so it includes user's private bin if it exists
	if [ -d "$HOME/bin" ] ; then
	    PATH="$HOME/bin:$PATH"
	fi

	. /u01/app/oracle/product/11.2.0/xe/bin/oracle_env.sh
fi

