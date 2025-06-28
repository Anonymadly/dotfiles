# dotfiles

⚠️ Please note that I use the Colemak keyboard layout. Any mapping configurations are not designed for QWERTY.

### Installing
```
chmod +x install.sh
./install.sh
```
The script wil symlink all of the dotfiles to your `$HOME`.
If you would like to copy all dotfiles instead of sym-linking, see Uninstalling below.
Any existing dotfiles will not be overwritten, they will be moved to `$HOME/dotfiles-backup`.

### Uninstalling
Run `uninstall.sh` to delete symlinks or replace symlinks with the source folder (if you want to delete the repository but keep the files).

`Other Config Files` stores files that will be skipped by both scripts. Read its README for more information.
