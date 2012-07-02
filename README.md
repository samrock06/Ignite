Ignite is a simple tool to automatically download and install
CodeIgniter along with a CSS Framework like Bootstrap or Foundation.


OBJECTIVE

Install Codeigniter along with a CSS framework without having to manually download and install the files yourself


GOAL

Make it easier to get CI off the ground with a functional CSS framework 


INSTALLING

To get Ignite from GitHub and install it:

git clone git://github.com/iammrharuna/Ignite.git

cd Ignite

./ignite.sh


----------------------------------------------------

haruna@Ignite:> ./ignite.sh

<=====================================>

CodeIgniter Scaffolding Generator v0.1

By GrimVealt.

<=====================================>

Do you want to install ignite? (y/n)
y

Copy 'ignite' to /usr/bin/

Link to 'ignite' from /usr/bin/

Installation Complete

Type 'ignite --help' for help

----------------------------------------------------


By default Ignite is installed in /usr/bin 
It will require root password to install


UNINSTALL

To unistall Ignite:
Type 'ignite rmv'

Type 'ignite' to run or Type 'ignite -o [OPTION] [DIRECTORY]

Where 'DIRECTORY' is the name of your project

Type 'ignite --help' for help


OPTIONS

	'found', to install CI with Foundation by Zurb

	'boot', to install CI with Bootstrap From Twitter

	'both', to install CI with both Foundation by Zurb && Bootstrap From Twitter

	'nf', to install CI with no CSS Framework


USAGE

	'ignite -o boot projectname' -- CodeIgniter install with bootstrap as CSS framework

	'ignite -o found projectname' -- CodeIgniter install with foundation as CSS framework

	'ignite -o both projectname' -- CodeIgniter install with bootstrap as well as foundation CSS framework

	'ignite -o nf projectname' -- CodeIgniter install with no CSS framework

WIll appreciate much help with this as this is my first attempt at shell scripting.

