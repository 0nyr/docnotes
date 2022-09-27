# Convert .rpm to .deb package


### Useful links

[what is a rpm file](https://www.lifewire.com/rpm-file-2622217)


### commands

`sudo alien -d PACKAGE_NAME.rpm ` : convert provided `.rpm` package to `.deb`

**Example** : 

```bash
 ❮ onyr ★  kenzae❯ ❮ Downloads❯❯ alien -d sqldeveloper-19.2.1.247.2212.noarch.rpm 
Must run as root to convert to deb format (or you may use fakeroot).
 ❮ onyr ★  kenzae❯ ❮ Downloads❯❯ sudo !!
sudo alien -d sqldeveloper-19.2.1.247.2212.noarch.rpm 
Warning: Skipping conversion of scripts in package sqldeveloper: postinst
Warning: Use the --scripts parameter to include the scripts.
sqldeveloper_19.2.1-248.2212_all.deb generated

```
