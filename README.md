Technical Codex - tS3m
======================
Codex of all the tweaks, commands, and configurations for the technology stacks I've run across.

Index
---
- [Unix](#unix)
- [OS-X](#os-x)
- [Homebrew](#homebrew)
- [Sublime Text 2](#sublime-text-2)
- [Emacs](#emacs)
- [Mercurial](#mercurial)
- [Git](#git)
- [FilMerge](#filemerge)
- [Ruby](#ruby)
- [Ruby on Rails](#ruby-on-rails)
- [JavaScript/CoffeeScript](#javascript/coffeescript)
- [Coding in C](#coding-in-c)
- [MySQL](#mysql)



Unix
---------

#### Creating Symbolic Links
`ln -s (source) (destination)`

For example: `ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl`
will link sublime text to a symbolic link named subl, which I can then access from the terminal because /usr/local/bin/ is in the $PATH

#### Command Line commands

`rm -R (directory or file)`
force removes anything!!

`which (executable)` tells you the path of the executable

`source (file)` causes terminal to reload a file, good for quickly changing the `~/.bash_profile` settings and reloading it

#### Shell
CTRL C - Cancels a command or interrupts a running program.

CTRL Z - Suspends a process or job but does not terminate it: use fg to restart suspended process or job.

`bg` - runs the most recently CTRLZ'd job in the background

`(executable) &` ampresand runs a job in the background

CTRL D - quits out a console, like irb, or mongo



OS-X
------
#### `~/.bash_profile` settings:
Find them in the git directory.  It has a `source ~/.profile` line at the end of it, to allow custom settings per machine in a `~/.profile` file

Customize colors for terminal text.  Place the following in ~/.bash_profile
```
# turns colors on
export CLICOLOR=1
# color scheme good for dark homebrew scheme
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
```

Customize bash prompt.  Lots more info [here](https://www.ibm.com/developerworks/linux/library/l-tip-prompt/) and [here](http://apple.stackexchange.com/questions/9821/can-i-make-my-mac-os-x-terminal-color-items-according-to-syntax-like-the-ubuntu).  Current settings are (#username: #Directory) with red username and yellow directory
`export PS1='\[\e[0;31m\]\u\[\e[0m\]:\[\e[0;33m\] \W\[\e[0m\]\$ '`


#### Shortcuts
Cmd W - closes the current window

Cmd Q - quits the current application

Cmd (1-9) - selects that tab

Cmd Tab - alt tab from windows

Cmd ` - swap between windows of the same application

Cmd Shift 4 - take a screen shot by dragging a box with the mouse

Ctrl H - delete character behind the cursor, basically the backspace

Ctrl D - deletes character after the cursor, basically a del key

Ctrl L - center the visible area around cursor

Ctrl O - insert new line after cursor

Ctrl V - move down a page

#### Custom DefaultKeyBinding.dict to emulate Emacs Navigation
find the file in the source directory.  Make a symlink in ~/Library/KeyBindings/DefaultKeyBinding.dict from it

#### Preferences
Full Keyboard Access: allows me to use the tab key when selecting "dont save, save, cancel"

System Preferences -> Keyboard -> Keyboard Shortcuts -> Full Keyboard Access -> All Control


#### Get letters/keys to repeat properly.

When holding down a letter, OS X will give you options, like `a` with several different accents.  Type this in terminal to get all keys to repeat upon press/hold
`defaults write -g ApplePressAndHoldEnabled -bool false`

#### Terminal

Go to Settings -> keyboard, and check use option as meta key

Choose Homebrew theme because it looks the best.

I'm using Menlo Size 11 font right now.

In Startup -> New windows open with: Same Settings , underneatth Same Working Directory


#### Environmental/PATH settings
OS-X will look in the following locations, first to last for PATH settings
```
/etc/profile
~/.bash_profile
~/.bash_login   (if .bash_profile does not exist)
~/.profile      (if .bash_login does not exist)
```
So I recommend putting new path variables in the `/.bash_profile` location

[Homebrew](http://mxcl.github.io/homebrew/)
--------
Package manager like Ubuntu's apt-get.  I like homebrew much better than MacPorts, it's faster and more intuitive.  Macports will download/install all dependencies from scratch.  While Homebrew will use preinstalled apple dependencies when possible.  Homebrew will also put apps in /usr/local/bin, which is wayyyy more intuitive than macports /opt/local.  Ultimately I want a grab and go package manager, that does as much as possible for me leaving me to code.

install via the website's latest instructions

`brew search (string)` to search for a package

`brew install (packagename)` to isntall

[Sublime Text 2](http://www.sublimetext.com/)
-----------
Amazing text editor.  I transitioned over from Emacs quite easily because it retains much of the same text navigation.  Has so much more!

#### Current Preferences Configuration, (Cmd ,)
```
{
	"color_scheme": "Packages/Color Scheme - Default/Blackboard.tmTheme",
	"font_size": 12.0,
	"ignored_packages":
	[
		"Vintage"
	],
	"soda_classic_tabs": true,
	"tab_size": 2,
	"theme": "Soda Dark.sublime-theme",
	"translate_tabs_to_spaces": true
}
```

#### Current Keymaps in `Preferences: Key Bindings - User`
Get rid of the dumb OS X special characters for the alt key, and use emacs meta bindings, tabs indent rather than tab
```
[
  { "keys": ["option+b"], "command": "move", "args": {"by": "subwords", "forward": false} },
  { "keys": ["option+f"], "command": "move", "args": {"by": "subword_ends", "forward": true} },
  { "keys": ["option+shift+b"], "command": "move", "args": {"by": "subwords", "forward": false, "extend": true} },
  { "keys": ["option+shift+f"], "command": "move", "args": {"by": "subword_ends", "forward": true, "extend": true} },
  { "keys": ["option+p"], "command": "move", "args": {"by": "stops", "empty_line": true, "forward": false} },
  { "keys": ["option+n"], "command": "move", "args": {"by": "stops", "empty_line": true, "forward": true} },
  { "keys": ["option+shift+p"], "command": "move", "args": {"by": "stops", "empty_line": true, "forward": false, "extend": true} },
  { "keys": ["option+shift+n"], "command": "move", "args": {"by": "stops", "empty_line": true, "forward": true, "extend": true} }
  { "keys": ["tab"], "command": "indent"}
]


```


#### Packages:
Package Control
CoffeeScript
Sass
TrailingSpaces
Soda theme

#### Emmet
Awesome html editing aid.  Instead of typing out `<div id='asdf' class='asdfad'><div>`  Just type `div#id.classname` and type the complete shortcut.  Make sure you override the Ctrl+E shortcut to something like Ctrl+Z, in Sublime -> preferences -> package settings -> Emmet -> KeyBindings -Default

Also remove the Ctrl+d shortcut, it overrides OS X default

#### Shortcuts
Cmd , - open preferences config

Cmd P - fuzzy open any file

Cmd O - open a directory/file, start typing / or ~ to type out directory

Cmd D - select a word, click it again to select next occurence, can edit both at the same time

Cmd L - select a line

Cmd Shift V - paste with indent

Cmd [ , Cmd ] - indents left/right

#### Tips
- When finding something using `Ctrl F`, click `esc` to exit out of the find

Emacs
--------
Don't really use this anymore due to sublime being so much better, but here are some commands I used to use a lot

M-w copy

use m-m to jump to beginning of line then tab, instead of C-a, then tab

To do camel case, M-x subword-mode

C-v M-v  move forward one screen, back one screen

M-x then type compile, to compile, then type gcc -o file file.c

C-x h, select all

m-} m-{ move forward/back paragraphs

C-j new line

C- L make current line center of screen

M-g g go to line

C-x 3 split horizontally

C-x o switch to other window

C-x right tab to next buffer

C-x left tab to previous buffer

C-x 0 kill current buffer

M-x mode-name

html-mode

C - x [ move to beginning of page

C -  x ] move to end of page

Mercurial
---------
Version control alternative to git.  Started using it at Fog Creek, and it has some nice features.  Use is quite similar.

#### Commands:

##### Similar to git
`hg push/pull` same push/pulling

`hg book` look at hg bookmarks, similar to git branches

`hg up (bookmarkname)` changes current directory to named bookmark, sort of like checking out a branch

`hg commit -m '(message)'` same as git commit.  Note: hg doesn't have an 'add', any changes that are made are automatically added to staging, and commit sets them into a commit

`hg merge (bookmarkname)` merges the named bookmark into the bookmark we are on
##### Patchqueues
`hg qnew -m "foo" P2` throws all changes to the working directory into a temporary patchqueue with the name P2, with the commit message 'foo'

`hg qrefresh` any changes to working directory are merged into the currently applied patchqueue

`hg qpop` pull the patchqueue off the working directory, we are back to the last commit, we are free to change branches using `hg book`

`hg qunapplied` lists unapplied q's

`hg qpush` pushes the most recent patchqueue onto the working directory

`hg qfinish -a` finishes all patchqueues and turns them into commits

`hg qref -X .` moves all changes from patch into current working directory

`hg qpush --move some-patch` move a patch to the top of the queue

`hg fmdiff -r qparent` use filemerge Diff with patchqueues

##### Creating a new bookmark(git branches)
`hg bookmark '#{bookmark name}'` to create a new bookmark

`hg push -f -B '#{bookmarkname}'` to force push the bookmark into the repo

##### Deleting a bookmark
`hg book-d '#{bookmarkName}'`

`hg push -B '#{bookmarkName}'`

##### Bisecting

Completely awesome way to find the bad commit for a bug.

`hg bisect init` to start it up

`hg bisect --bad` to mark the tip as bad

Find a bad changeset, then `hg bisect --good` to start bisecting

It will automatically update you to test changesets, and you mark each one `--good` or `--bad` until you get to the end

Git
-----

`git add .` adds all changes to the working directory

`git add -u` removes all removed files and commits

`git clean -df` , removes all noncommitted changes

`git commit -m '(message)'` commits the current changes with a message

`git push/pull` self explanatory

`git checkout -b deployment origin/master` makes a deployment branch:

`git pull --rebase` update deployment branch

`git mergetool` deals with merge conflicts using a GUI tool

`git difftool` diffs working repository with commited repository using visual tool

Run `git log master..your-branch-name` to see how many commits there are on your branch

Run `git rebase -i HEAD~#` where # is the number of commits you have done on your branch

Filemerge
-------------
Great visual diff/merge tool that comes with OS-X, looks more modern than the other tools.

Might need to modify the symbolic link so opendiff -> filemerge

#### Work With Mercurial

Create a script called fmdiff.  Its contents are
```
#!/bin/sh
# opendiff returns immediately, without waiting for FileMerge to exit.
# Piping the output makes opendiff wait for FileMerge.
opendiff "$@" | cat
```

Make the script executable via: `chmod 755 fmdiff`

Modify your .hgrc file to include:
```
[extdiff]
cmd.fmdiff = /usr/local/bin/fmdiff

[merge-tools]
filemerge.executable = /usr/local/bin/fmdiff
filemerge.args = $local $other -ancestor $base -merge $output
```

#### Work with Git

modify the `~/.gitconfig` file to include:
```
[diff]
        tool = opendiff
        prompt = false
```

make sure opendiff is in the path

run it using the command `git difftool -d`


Kdiff3
-----------

As sexy as the FileMerge GUI looks, it's not all that great for actual merges.  We only have a 2-way view instead of a 3 way view(base, local, and other), it's a bit confusing as to what's actually coming out since there's no 'output pane,' and we cannot directly input new edits.  So for complicated merges, I'll resort to kdiff3 with its terrible GUI, but I'll stick with filemerge for diffs.

Make a symlink to kdiff3 to put it in the path.  On OS X it is in `/Applications/kdiff3.app/Contents/MacOS/kdiff3`

### kdiff3 with Mercurial

Add to ~/.hgrc:

```
[extensions]
hgext.extdiff =

[extdiff]
cmd.kdiff3 =

[merge-tools]
kdiff3.args = $base $local $other -o $output
```

Ruby on Rails
-------------

####To get rails app running after a clean clone of the repository:
cd to the directory
```
bundle install
rake db:schema:load
rake sunspot:solr:start
rake db:populate
rails server
```
see it running in the browser at at localhost:3000

#### General
in rails, “this” from java becomes “self”

user.update_attributes( name: “safga”, email: “asfgafg”) <--update attributes, pass in a hash

to make a user, do this:
```
rails generate controller Users new --no-test-framework
rails generate model User name:string email:string
rake db:migrate
```
to generate entities in data model go to
`lib/tasks/sample_data.rake` and do stuff

to create a new user
```
matt = User.new(name: “Matthew Tse”, password: “asdfadf”)
matt.save
```
or `matt = User.create(name: “Matthew Tse”, password: “pass”)`


`User.find(index)` to find a user


`aUser.destroy` to destroy a user

`rake db:schema:load` to load up a new database


`RAILS_ENV=production (rake db:migrate, or any other command)` to run something in production

`rake assets:precompile` to get CSS to compile

#### Reference ubuntu rails setup
```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install curl
sudo apt-get install emacs
curl -L https://get.rvm.io | bash -s stable
source /home/ts3m/.rvm/scripts/rvm
sudo apt-get install git
rvm requirements
#install them all
rvm install 1.9.3
rvm use 1.9.3
gem install rails
sudo apt-get install libpq-dev
sudo apt-get dist-upgrade
rvm --default use 1.9.3

libmysqlclient-dev
```


#### Capistrano
```
gem ‘capistrano’
bundle install
```
from root directory, do
`capify .`    -> makes a Capfile, and a config/deploy.rb file

#### APACHE
to restart:

`etc/init.d/apache2 restart` or

`sudo service apache2 restart` or

`apachectl -k graceful-stop`

#### Heroku

`heroku run console` run console

`heroku run rake db:reset` reset db

`git remote add heroku git@heroku.com:project.git`


#### Sunspot
`rake sunspot:solr:start` to get the server running

`rake sunspot:reindex` to reindex

`rake sunspot:solr:start RAILS_ENV=test` turn on sunspot for rspec testing

#### Getting a rails app running on Amazon EC2

`chmod 400 microkey.pem` to fix the permissions on the microkey.pem file

`ssh -i /microkey.pem ubuntu@DNS.server.com` to ssh in

1. install ruby using RVM!!!!! not regularly not compiling
2. install all the dependencies using apt-get
3. install rails via `gem install rails`
4. install `apache2` via `apt-get`
5. install `apache2-prefork-dev` via `apt-get`
6. set environmental variables: `APXS2`, set ruby path 

    `which apxs2` should work and point to the path, in my case it is `/usr/bin/apxs2`
	
    `which ruby` should work and point to the latest rvm ruby version, in my case `/home/ts3m/.rvm/gems/ruby-1.9.3-p194/bin`

7. install passenger via `rvmsudo gem install passenger`
8. install passengermod via `rvmsudo passenger-install-apache2-module`

9. add the LoadModule passenger_module
```
PassengerRoot
PassengerRuby
```
stuff to `/etc/apache2/apache2.conf` at the very bottom

10. place the following into /etc/apache2/httpd.conf (modify as per your app location)
```
<VirtualHost *:80>
    ServerName omniduke.local
    DocumentRoot /home/ts3m/Development/omniDuke/public
    <Directory /home/ts3m/Development/omniDuke/public>
         AllowOverride all
        Options -MultiViews
    </Directory>
</VirtualHost>
```

11. run apache2 and get bad user name error
to fix: in `/etc/apache2/apache2.conf`, change lines
```
User ${APACHE....}$
Group ${APACHE_RUN_GROUP}
```
to
```
User www-data
Group www-data
```

and add the folowing lines to the end of /etc/apache2/envvars
```
APACHE_RUN_USER=www-data
APACHE_RUN_GROUP=www-data
```
##### Server Commands

`sudo service apache2 restart` to restart apache2
`rvmsudo passenger-status` check if passenger is running

navigate to the DNS URL from your regular computer’s browser, should see passenger phusion screen

run standard database migrations etc. using
RAILS_ENV=production rake db:migrate etc.

Javascript/CoffeeScript
------------------------
`jQuery()` or `$()` gett elements from document

`$(‘.myClass’)` to get by class

`$(‘#myID’)` to get by ID
jQuery functions will only work on jQuery objects

Simple onClick function example (coffeescript)
jQuery ->                                     // wait until document ready
    $(‘.clickable’).click ->              // execute code when element with class ‘clickable’ is clicked
        // Do stuff

Coding in C
------------

`char* aStringLiteral = “asdfadsfa”;` creates a read-only string literal stored somewhere, you CANNOT do `aStringLiteral[0]=’d’`

instead, do
`char aCharArray[] = “asdfadsfa”;` creates a char array, you can do `aCharArray[2]=’d’`;

when declaring a new char array, do:

`char* aNewArray = malloc(sizeof(char)*x+1);`



MySQL
---------------

#### MySQL on Ubuntu
`sudo apt-get install mysql-server mysql-client libmysqlclient-dev (optional to set a password)`

remove ‘pg’ and ‘sqlite3’ gems from Gemfile

add ‘mysql’ gem to Gemfile

add/modify the following lines to config/database.yml
```
development:
  adapter: mysql
  database: db/development
  pool: 5
  username: root
  password:
```
do this 3 times for development, test, and production, replacing the first and 3rd lines respectively, put a password if you created a password for your mysql server during installation

```
bundle install
rake db:create:all (creates for dev, test, and production)
rake db:schema:load
rake db:populate
rake sunspot:reindex
```
you’re done!

to backup and restore mysql databases

to backup, replace db/development with database name, replace xyz with name of backup file
`mysqldump --opt --single-transaction --user=root db/development > xyz.sql`

to restore, replace db/production with name of destination database, xya with name of backup file
`mysql --user=root db/production < xyz.sql`


#### MySQL on OS-X

If you have installed the Startup Item, use this command:

     shell> sudo /Library/StartupItems/MySQLCOM/MySQLCOM start
     (ENTER YOUR PASSWORD, IF NECESSARY)
     (PRESS CONTROL-D OR ENTER "EXIT" TO EXIT THE SHELL)

If you don't use the Startup Item, enter the following command sequence:

     shell> cd /usr/local/mysql
     shell> sudo ./bin/mysqld_safe
     (ENTER YOUR PASSWORD, IF NECESSARY)
     (PRESS CONTROL-Z)
     shell> bg
     (PRESS CONTROL-D OR ENTER "EXIT" TO EXIT THE SHELL)

You should be able to connect to the MySQL server, for example, by
running `/usr/local/mysql/bin/mysql'.

*Note*: The accounts that are listed in the MySQL grant tables
initially have no passwords.  After starting the server, you should set
up passwords for them using the instructions in *Note
post-installation::.

You might want to add aliases to your shell's resource file to make it
easier to access commonly used programs such as `mysql' and
`mysqladmin' from the command line. The syntax for `bash' is:

     alias mysql=/usr/local/mysql/bin/mysql
     alias mysqladmin=/usr/local/mysql/bin/mysqladmin

For `tcsh', use:

     alias mysql /usr/local/mysql/bin/mysql
     alias mysqladmin /usr/local/mysql/bin/mysqladmin

Even better, add `/usr/local/mysql/bin' to your `PATH' environment
variable. You can do this by modifying the appropriate startup file for
your shell. For more information, see *Note invoking-programs::.


