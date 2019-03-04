alias tig "tig --show-signature"
alias vim nvim
alias vi nvim

function delline
  sed -i "$argv[2]"d $argv[1] 
end