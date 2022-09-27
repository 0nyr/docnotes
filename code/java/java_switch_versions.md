# Switch between Java versions


### Useful links

[switch between java versions](https://www.lynxbee.com/how-to-switch-between-java-versions-on-ubuntu-linux/)

https://dev.to/harsvnc/how-to-change-your-java-and-javac-version-on-ubuntu-linux-1omj


### commands

`update-java-alternatives --list` : lists all installed `java` versions

`sudo update-alternatives --config javac` : switch `javac` version

`sudo update-alternatives --config java` : switch `java` version

`java --version` : give current `java` version

`javac --version` : give current `javac` version

**Example** : 

```bash
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ sudo update-alternatives --config java
[sudo] password for onyr: 
There are 3 choices for the alternative java (providing /usr/bin/java).

  Selection    Path                                            Priority   Status
------------------------------------------------------------
  0            /usr/lib/jvm/java-11-openjdk-amd64/bin/java      1111      auto mode
  1            /usr/lib/jvm/java-11-openjdk-amd64/bin/java      1111      manual mode
* 2            /usr/lib/jvm/java-13-oracle/bin/java             1091      manual mode
  3            /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java   1081      manual mode

Press <enter> to keep the current choice[*], or type selection number: 0
update-alternatives: using /usr/lib/jvm/java-11-openjdk-amd64/bin/java to provide /usr/bin/java (java) in auto mode
 ❮ onyr ★  kenzae❯ ❮ ~❯❯ java --version 
openjdk 11.0.8 2020-07-14
OpenJDK Runtime Environment (build 11.0.8+10-post-Ubuntu-0ubuntu118.04.1)
OpenJDK 64-Bit Server VM (build 11.0.8+10-post-Ubuntu-0ubuntu118.04.1, mixed mode, sharing)
```
NB : with linux, it's better to get openjdk rather than official Oracle JDK for Java.
