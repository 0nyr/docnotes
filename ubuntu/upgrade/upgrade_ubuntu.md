# upgrade Ubuntu

### useful links

what are [PPA](https://itsfoss.com/ppa-guide/)

how to [upgrade ubuntu](https://ubuntu.com/blog/how-to-upgrade-from-ubuntu-18-04-lts-to-20-04-lts-today)

#### upgrade broken

[How To Fix Broken Ubuntu OS Without Reinstalling It](https://ostechnix.com/how-to-fix-broken-ubuntu-os-without-reinstalling-it/)

### remove some PPA

NOTE:
It is highly recommended to remove this PPA prior to upgrading Ubuntu
Studio from one version to the next.**

To
remove this PPA, open a terminal window and type:

<pre class="western"><a name="line-46"></a><a name="line-47"></a><a name="line-48"></a><a name="line-1-1"></a><font color="#ce181e"> sudo apt install ppa-purge</font>
<a name="line-2-1"></a><font color="#ce181e"> sudo ppa-purge ppa:ubuntustudio-ppa/backports</font>
<font color="#ce181e">More info about PPA : https://itsfoss.com/ppa-guide/</font></pre>



## Update kenzae (11/10/2021)

I tried to update Ubuntu 18.04 LTS to 20.04 LTS more than one year after the initial release. I first spent an evening to fix all `apt update` errors.

After that, I watched [this video on how to update Ubuntu](https://youtu.be/3nD56JYfF_o). So I tried to launch the `do-release-upgrade` script in graphical mode but something went wrong, probably due to a PPA and a previous manual install of python. The update went on infinite loop and I had to switch the PC off forcefully.

The apt update thing was broken by I could still log-in in graphical mode. I started doing the update following the manual Debian-style upgrade, replacing  `bionic` by `focal` in `/etc/apt/` `sources.list` file and files ending in `.list` with an alternate version in `.list.distUpgrade` in `sources.list.d/`.

Use `ls -alt | grep distUpgrade`, then one by one, `cat` the content of files ending in `.list` and check whether or not uncommented lines for PPAs have replaced `bionic` with `focal` or not. If not the case, use `sudo gedit` to change that.

Once that is done, I made a `sudo apt update` and it worked. But the `sudo apt dist-upgrade` failed due to a package named `libmod5`. So I installed `aptitude`, a boosted version of apt to try to fix the problem, but with no success.

I then rebooted. Then in the TTY (Ctrl + Alt + F2), I logged in and run the commands from [How To Fix Broken Ubuntu OS Without Reinstalling It](https://ostechnix.com/how-to-fix-broken-ubuntu-os-without-reinstalling-it/). But I once again felt against the `dist-upgrade` package error. So using `aptitude`, I removed the package and `aptitude` installed another one at the same time. And it was fixed. The next `apt dist-upgrade` worked fine. I rebooted once more and was welcomed by Ubuntu 20.04. This boot took some time.

## Update aezyr (29/09/2022)

Here we go again. Trying to upgrade from 20.04 LTS to 22 LTS.

[Upgrade Ubuntu](https://itsubuntu.com/how-to-upgrade-ubuntu-22-04-lts/)

[Using PPA in Ubuntu Linux | It&#39;s FOOS](https://itsfoss.com/ppa-guide/)
