# VPNs on Linux




# Legacy notes

### VPN speed test
Aim 
Objective personal speed testing for VPN?
Hello,
I’m a french student whose ISP is a university. This means that everything I do on the internet can be tracked by mu university which is not really cool for obvious reasons. I have been searching for VPN for a while as it would hide my traffic for my university. 
Here as some interesting ressources I found.

The Hated One : https://www.youtube.com/watch?v=oja3UzuuqGQ

I want a VPN mostly to be anonymous FOR MY UNIVERSITY. Thus I don’t want to use TOR. I just would like to access “normal web“ with maximum speed for instance for cloud gaming with Shadow. 

The problem is that most website reviewing VPN can’t be trusted as well as YouTubers or any one else. For Instance, The Hated One is affiliated with NordVPN whose marketing power seems to be huge, and Tom Spark is also affiliated with a channel clearly oriented around the same things.

My Idea is that instead of relying on others to choose a VPN, I would like to conduct my own test. Note here that I cleary understant that a VPN is absolutely not enough to be anonymous online. I don’t really care about the “No Log” problem as I just wants to bypass the restrictions of my university such as Shadow, Steam and Discord… 

I’m using Ubuntu 18.04.
I found several tools using command lines to test speed : 

Do you know free VPN or Trial versions I could use to test speeds on my own ? I can’t find a similar situation on online ressources but maybe you know some interesting “objective” speed VPN reviewers ? 

Please help. 

Personal test without VPN
### Useful test
Useful article on how to test internet speed with CLI on linux
### Useful commands
speedtest-cli
Install PIP:
sudo apt-get install python-pip
Install Speedtest-cli:
pip install speedtest-cli
To test internet speed, just type the following command and press enter:
speedtest-cli
You can find various options in the help section of the utility:
speedtest-cli -h
Display the internet speed in megabytes/sec:
speedtest-cli --bytes

Get a list of avaialble servers (sorted in asceding order according to the distance from your location):
speedtest-cli --list

Choose a specific server to test internet speed:
speedtest-cli --server server_id

Replace the server_id with the number written before a server in the list.

### Test without vpn 
Using testspeed-cli : 
Retrieving speedtest.net configuration...
Testing from Reseau Optique du Campus de la Doua (134.214.181.92)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by LaFibre.info (Lyon) [4.20 km]: 12.434 ms
Testing download speed................................................................................
Download: 9.30 Mbit/s
Testing upload speed......................................................................................................
Upload: 3.02 Mbit/s
VPN : Hide.me
Main page : 1 tacker only : Google Analytics
Payment Options : No 3 year plan, PayPal supported

