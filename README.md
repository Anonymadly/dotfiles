# dotfiles

⚠️ Please note that I use the Colemak keyboard layout. Any mapping configurations are not designed for QWERTY.

## `install.sh`
The script wil symlink all of the dotfiles to your `$HOME`.\
Any existing dotfiles will not be overwritten, they will be moved to `$HOME/dotfiles-backup`.

### Note:
The script handles dotfiles and `.config` configurations differently. For example:
```
.
├── config_foo
└── bar
```
- `config_foo` gets symlinked to `$HOME/.config/foo`
- `bar` gets symlinked to `$HOME/.bar`

## `uninstall.sh`
### Options:
1. Delete all symlinks
2. Replace all symlinks with a copy of the dotfile
    - This means you can install, uninstall using option 2, then delete the repository.
    - That would mean each of the dotfiles in this repository copied to their correct locations.
3. Choose between 1 and 2 for each dotfile

## `Other Files`
This is used to store files that will be skipped by both scripts. Read its README for more information.
