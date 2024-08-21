export PATH=$HOME/bin:/usr/local/bin:/Users/mamonaku/Developer/PlaydateSDK/bin:$PATH
if [ -f "$HOME/.zshrc_professional" ]; then
	source ~/.zshrc_professional
fi
alias vim="nvim"
alias pds="open -a /Users/mamonaku/Developer/PlaydateSDK/bin/Playdate\ Simulator.app/"
alias lg="lazygit"
eval "$(starship init zsh)"
