{ pkgs, ... }:

let
  secrets = (import ../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username}.programs.git = {
    enable = true;
    userName  = "${secrets.fullName}";
    userEmail = "${secrets.email}";
    extraConfig = {
      push = { default = "current"; };
      pull = { rebase = true; };
      rebase = { autoStash = true; };
      "url \"git@bitbucket.org:\"" = { insteadOf = "https://bitbucket.org/"; };
      "url \"git@github.com:\"" = { insteadOf = "https://github.com/"; };
    };
    signing = {
      signByDefault = true;
      key = "3E5DD4E9B37115436F1F91E847C02FA6BCC1976D";
    };
    aliases = {
        co = "checkout";
        cob = "checkout -b";

        c = "commit --verbose";
        ca = "commit -a --verbose";
        cm = "commit -m";
        cam = "commit -a -m";

        d = "diff";
        ds = "diff --stat";
        dc = "diff --cached";

        s = "status -s";

        # Delete branches equal or behind develop
        cleanup = "\"!git checkout --quiet develop && git branch --merged | grep  -v '\\\\*\\\\|master\\\\|develop' | xargs -n 1 git branch -d\"";
        cleanupcheck = "\"!git checkout --quiet develop && git branch --merged | grep  -v '\\\\*\\\\|master\\\\|develop'\"";

        # Checkout develop
        dev = "checkout develop";
        master = "checkout master";

        # Merge
        md = "merge develop";
        mm = "merge master";
        abort = "merge --abort";
        prmerge = "merge develop --no-commit --no-ff";

        # Discard changes
        discard = "checkout -- .";

        # list branches sorted by last modified
        b = "\"!git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'\"";

        # Compare commits to another branch
        logcompare = "\"!f() { git log --oneline --decorate develop..$(git rev-parse --abbrev-ref HEAD); }; f\"";

        # list aliases
        la = "\"!git config -l | grep alias | cut -c 7-\"";
        upn = "pull --ff-only --all -p";
        upold = "pull --rebase --autostash";
        uplog = "\"!git pull --ff-only --all -p && git log --decorate @{1}..HEAD --pretty=format:'%C(yellow)%h %Cred[%an] %Creset%s'\"";
        uplogold = "\"!git pull --rebase --autostash && git log --decorate @{1}..HEAD --pretty=format:'%C(yellow)%h %Cred[%an] %Creset%s'\"";
        lg = "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
    };
  };
}
