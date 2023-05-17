if status is-interactive
    alias ls='exa -l'
    alias la='exa -al'
    alias bing='echo bong'
    alias vim='nvim'
    alias ssh='kitty +kitten ssh'
    alias ossh='ssh'  
    alias icat='kitty +kitten icat'
    alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

    function fuck
    	eval sudo $history[1]
    end

    set -x PATH /opt/homebrew/bin /Users/lucasball/Documents/jdk-17.0.1/bin /Users/lucasball/Documents/ghidra /Users/lucasball/.cargo/bin /Users/lucasball/.local/nvim-osx64/bin /Users/lucasball/go/bin $PATH
    set -x HOMEBREW_GITHUB_API_TOKEN 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

    set fish_greeting
    set -U EDITOR vim
    fzf_configure_bindings --directory=\cf --variables=\e\cv --history=\cg
    function key_bindings
    	fish_default_key_bindings
	bind \ec fzf_jump_directory
	bind -M insert \ec fzf_jump_directory
    end

    function sshhosts
    	echo "Main Config:"
	sed -n 's/Host//p' ~/.ssh/config
	printf "\n"
	for i in $HOME/.ssh/config.d/*
	    echo (basename $i): 
	    sed -n 's/Host//p' $i
	    printf "\n"
	end
    end
    set -g fish_key_bindings key_bindings
    starship init fish | source
end
