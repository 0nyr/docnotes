# Flatpak

## Useful links
[Get apps from flatpak store](https://flathub.org/home)
[Good flatpak intro tutorial](https://thebackroomtech.com/2021/03/19/how-to-install-and-run-flatpak-applications/)

## Install & configure
+ Install flatpack [more details](https://flatpak.org/setup/). [Good flatpak intro tutorial](https://thebackroomtech.com/2021/03/19/how-to-install-and-run-flatpak-applications/).
+ Add Flatpack `/var/lib/flatpak/exports/bin` to PATH [mode details](https://theevilskeleton.gitlab.io/2022/09/28/what-not-to-recommend-to-flatpak-users.html) to make apps available via their shortcut name.
+ Create softlinks as shortcuts inside `/var/lib/flatpak/exports/bin` if you wish, for a given app, to have a shorter name and be able to run it more easily. A good convention could be to append a `-fk` at the end of the name to avoid conflicts.

## Commands
+ `flatpak update`: update apps
+ `flatpak list`: list installed flatpak apps
+ `flatpak run Application-ID`: run a flatpak app

### create a flatpak app alias command
1. `cd `
2. Create a softlink to the flatpak app. Here is an example with discord: `sudo ln -s ../../app/com.discordapp.Discord/current/active/export/bin/com.discordapp.Discord discord-fk`.
3. Now, you can run Discord with `discord-fk` directly, instead of `flatpak run com.discordapp.Discord`.





