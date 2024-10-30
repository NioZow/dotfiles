# path related variables
fish_add_path -a /sbin
fish_add_path -a /opt/homebrew/opt/llvm/bin
fish_add_path -a /opt/homebrew/bin
fish_add_path -a $HOME/.local/bin
fish_add_path -a $HOME/.cargo/bin

# llvm variables
set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"

# pnpm
set -gx PNPM_HOME "/Users/noah/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
