# windows-nt-auto-deployment-1998-style
Windows NT Auto Rename & Domain Join Script

This repository contains a real-world example of how Windows NT 4.0 machines were automated during deployment in small-to-medium business environments.

Windows NT did not come with its own inbuilt ability to create a unique computer name. This script was something I wrote in order to create a unique workstation name based off the MAC address of the network card 

What This Does

These scripts demonstrate a practical approach used at the time to:

Automatically rename a Windows NT machine
Join it to an NT domain
Reduce manual setup during rollout

This was typically used alongside:

Unattended setup (winnt.sif)
Network-based installations
Or disk imaging (e.g. Ghost)

How It Works (High Level)

The approach is simple but effective:

A script runs during or after setup
The machine determines or is assigned a unique name
The name is applied locally
The machine joins the NT domain
A reboot completes the process

There are limitations and quirks (as you’d expect with NT), but this method worked reliably in production environments at the time.

Important Notes

This is not modern best practice — it reflects how things were actually done in the NT era
Designed for Windows NT 4.0 domains, not Active Directory
Behaviour may vary depending on:
Service Pack level (SP6a recommended)
Network configuration (WINS/NetBIOS often required)
Hardware and drivers

Context

These scripts come from real deployment work carried out in business environments during the late 1990s and early 2000s.

If you’re trying to recreate this, I’d strongly recommend watching the video, a lot of the “why” behind this approach isn’t obvious just from the scripts alone.

Related Video

https://youtu.be/OskAMmDaNWI

