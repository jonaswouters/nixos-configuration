alias tig "tig --show-signature"
alias vim nvim
alias vi nvim
alias nix-cleanup "sudo nix-env --delete-generations old && nix-collect-garbage -d"

function delline
  sed -i "$argv[2]"d $argv[1] 
end