# JAMF-Runner

This is Swift code that wraps around the /usr/local/bin/jamf binary to run commands that could be used for offensive purposes. This is not intended for red team operations use, as the this tool leaves command line history traces that can easily be keyed in on by blue teams. Instead, I wrote this tool for blue teams to perform unit testing of their detections around an attacker leveraging the on disk jamf binary to pull host info or run other commands on a JAMF managed macOS host.

------------------

![Image](jamfrunner.png)

## Usage:

Help Menu:

> ./JAMF-Runner -h ---> help menu

To Run All Options at Once:

> sudo ./JAMF-Runner

To Run Certain Options:

>  sudo ./JAMF-Runner [option1] [option2] ....

## Steps:

> git clone https://github.com/cedowens/JAMF_Runner

- ensure you have swift and developer tools installed (can install from the mac app store)

- load JAMF-Runner.xcodeproj into XCode and make any changes you desire to the main.swift file

To build the macho binary:

> cd JAMF_Runner && swift build



