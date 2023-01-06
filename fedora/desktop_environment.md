# Fedora desktop environments



## Installing Fedora

I installed Fedora from a live USB stick. I first loaded the live OS to resize the partitions of the disk using `gparted`. I created a EFI partition `/root/efi`, a partition for `/`, `/home` and another empty partition for future OS. For the `/` partition,  I needed to select `format` for the installer to create a new filesystem on the empty partition.

### copying files from previous disk
Plug the old disk. Use `rsync` to copy files and folders. `rsync -vruhpog --progress -C Documents/docnotes/ Documents/ /home/onyr/Documents/
`

### Post installation tasks
+ Add a custom shortcut for launching `gnome-terminal`. Go to Settings > Keyboard > Keyboard Shortcuts > View and Customize Shortcuts > Custom Shortcut and add a new CTRL + ALT + T shortcut running the command `gnome-terminal`.
+ Configure git. Configure .gitconfig to be in `~`. You can make a hardlink or a softlink. Make a hardlink with `ln myfile.txt my-hard-link` and a softlink with `ln -s myfile.txt my-soft-link`. [mode details](https://stackoverflow.com/questions/185899/what-is-the-difference-between-a-symbolic-link-and-a-hard-link). This replace a manual setup via `git config --global user.name "Your Name"` and `git config --global user.email "youremail@yourdomain.com"`. See the current git config with `git config --list`.
+ Configure GitHub via SSH [more details](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).
+ Install flatpack [more details](https://flatpak.org/setup/). [Good flatpak intro tutorial](https://thebackroomtech.com/2021/03/19/how-to-install-and-run-flatpak-applications/). NB: flatpack is probably already installed.
+ Add Flatpack `/var/lib/flatpak/exports/bin` to PATH [mode details](https://theevilskeleton.gitlab.io/2022/09/28/what-not-to-recommend-to-flatpak-users.html) to make apps available via their shortcut name.
+ Install **VSCode** from the official Microsoft website as a `.rpm` file. Then connect to GitHub via VSCode to activate synchronization.

## Install other desktop environments
More info [here](https://www.tecmint.com/install-and-switch-desktop-environments-in-fedora/)

1. `sudo dnf grouplist -v`: list available grouplist. Can be used to see available desktop environments.
2. `sudo dnf install @<xxx-desktop-environment>`: install environment. Once the installation if done, `reboot`. While you login, you can select the environment.
```shell
(base) [onyr@kenzael ~]$ sudo dnf install @i3-desktop-environment
[...]
Total download size: 32 M
Installed size: 91 M
Is this ok [y/N]: y
[...]
```
3. `sudo dnf install switchdesk switchdesk-gui`: Install utilities to switch desktop from command line or a GUI.
4. Switch desktop with a command like `sudo switchdesk cinnamon`.


