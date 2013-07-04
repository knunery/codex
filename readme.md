

Commenting in ERB 
Single line: <%-# commented line -%>
Block:
 <% if false %>
code to comment
<% end %>


Some javascript/jquery essentials
Getting elements from document: jQuery() or $()
  Ex: To get elements with class “myClass” - $(‘.myClass’)
	Ex: To get elements with id ‘myClass’ - $(‘#myClass’)
jQuery functions will only work on jQuery objects

Simple onClick function example (coffeescript)
jQuery ->                                     // wait until document ready
    $(‘.clickable’).click ->              // execute code when element with class ‘clickable’ is clicked 
        // Do stuff           

Coding in C
char* aStringLiteral = “asdfadsfa”;
	-creates a read-only string literal stored somewhere, you CANNOT do aStringLiteral[0]=’d’

instead, do
char aCharArray[] = “asdfadsfa”;
	-creates a char array, you can do aCharArray[2]=’d’;

when declaring a new char array, do

char* aNewArray = malloc(sizeof(char)*x+1);

Latex commands
save files as .tex files
to compile into .dvi, simply type latex file.name
to compile to pdf, do dvipdf file.dvi

vim commands
hjkl to move
:wq to save
	:w just to save
	:q just to quit
	:q! quit without saving
:Ex to explore
a - insert after cursor
/<text> to find text in file
:%s/<original_text>/<new_text> to find all instances of original text and replace with new text
vim -R <file_name> open in read only mode
dd delete a line
yy yank a link
p paste
<number> <command> do command given number of time (i.e. 5dd - delete 5 lines starting
from cursor)

emacs Commands(m = alt)(c = ctrl)
M-w copy
use m-m to jump to beginning of line then tab, instead of C-a, then tab
To do camel case, M-x subword-mode
C-v M-v  move forward one screen, back one screen
M-x then type compile, to compile, then type gcc -o file file.c





C-x h, select all


m-} move forward/back paragraphs
m-{
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

Vim commands
i-insert mode
esc-normal mode <visual mode>
hjkl for nav
d for delete currently selected cursor

command line:
ctrl D - exits a console
use \ instead of / for auto completion on windows of directories

irb(interactive ruby)
ctrl D - exit the console
	or type ‘exit’

Ruby
in ruby, this is instead represented by self
Hash.each do |key, value|
puts key
puts value
end
(hashes have two values when calling a .each function)
print something.inspect is shortcutted to     p something

rails

in rails, “this” from java becomes “self”

user.update_attributes( name: “safga”, email: “asfgafg”) <--update attributes, pass in a hash

to make a user, do this:
rails generate controller Users new --no-test-framework
rails generate model User name:string email:string
rake db:migrate

to generate entities in data model go to 
lib/tasks/sample_data.rake and do stuff

to create a new user
matt = User.new(name: “Matthew Tse”, password: “asdfadf”)
matt.save

or matt = User.create(name: “Matthew Tse”, password: “pass”)
to find a user
User.find(index)

to destroy a user
aUser.destroy

rake db:schema:load to load up a new database

to run something in production
RAILS_ENV=production rake db:migrate etc.

to get CSS to compile, do
rake assets:precompile

Capistrano
gem ‘capistrano’
bundle install
from root directory, do 
‘capify .’    -> makes a Capfile, and a config/deploy.rb file

OS X
Ctrl F4 goes to next window
Ctrl Shift F4 previous window

Git
to make a deployment branch:
git checkout -b deployment origin/master
to update deployment branch
git pull --rebase
git add -u, removes all removed files and commits
git clean -df , removes all noncommitted changes

Unix
OS X: rm -R (directory or file), force removes anything!!
remove directory rmdir
remove everything in current folder:    rm -rf * # f option 
to become root
sudo -s
ps aux | grep 'solr'  	to find all running instances of solr

which ruby
which emacs
	tells you where the symlink points to

ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl
creates a symlink to a file, link is in /usr/local/bin, the first item is the source

Heroku
run console
heroku run console

reset db
heroku run rake db:reset

git remote add heroku git@heroku.com:project.git

HTTP
link_to defaults to HTTP get
Button_to defaults to HTTP post

Capybara:
print page.html

EC2
to ssh in
ssh -i /microkey.pem ubuntu@DNS.server.com
chmod 400 microkey.pem to fix the permissions on it

Sunspot
to get the server running 
rake sunspot:solr:start
to reindex
rake sunspot:reindex
turn on sunspot for rspec testing
rake sunspot:solr:start RAILS_ENV=test

APACHE
to restart,
etc/init.d/apache2 restart
sudo service apache2 restart
apachectl -k graceful-stop

To get rails app running after a clean clone of the repository:
cd to the directory
bundle install
rake db:schema:load
rake sunspot:solr:start
rake db:populate
rails server, see it running at localhost:3000

Mysql
sudo apt-get install mysql-server mysql-client libmysqlclient-dev (optional to set a password)

remove ‘pg’ and ‘sqlite3’ gems from Gemfile

add ‘mysql’ gem to Gemfile

add/modify the following lines to config/database.yml

development:
  adapter: mysql
  database: db/development
  pool: 5
  username: root
  password:


do this 3 times for development, test, and production, replacing the first and 3rd lines respectively, put a password if you created a password for your mysql server during installation

bundle install
rake db:create:all (creates for dev, test, and production)
rake db:schema:load
rake db:populate
rake sunspot:reindex

you’re done!

to backup and restore mysql databases

to backup, replace db/development with database name, replace xyz with name of backup file
mysqldump --opt --single-transaction --user=root db/development > xyz.sql

to restore, replace db/production with name of destination database, xya with name of backup file
mysql --user=root db/production < xyz.sql

Documenting getting EC2 up and running
install ruby using RVM!!!!! not regularly not compiling
install all the dependencies using apt-get
install rails via 	gem install rails
install apache2 via	apt-get
install apache2-prefork-dev via 	apt-get
set environmental variables: APXS2, set ruby path
	which apxs2 should work and point to the path, in my case it is /usr/bin/apxs2
	which ruby should work and point to the latest rvm ruby version
	ruby should be in the echo $PATH, in my case
		/home/ts3m/.rvm/gems/ruby-1.9.3-p194/bin
install passenger via 	rvmsudo gem install passenger
install passengermod via 		rvmsudo passenger-install-apache2-module
add the LoadModule passenger_module
	PassengerRoot
	PassengerRuby
stuff to /etc/apache2/apache2.conf at the very bottom

place the following into /etc/apache2/httpd.conf (modify as per your app location)
<VirtualHost *:80>
    ServerName omniduke.local
    DocumentRoot /home/ts3m/Development/omniDuke/public
    <Directory /home/ts3m/Development/omniDuke/public>
         AllowOverride all
        Options -MultiViews
    </Directory>
</VirtualHost>

run apache2 and get bad user name error
to fix:
in /etc/apache2/apache2.conf, change lines 
User ${APACHE....}$
Group ${APACHE_RUN_GROUP}

to 

User www-data
Group www-data


and add the folowing lines to the end of /etc/apache2/envvars

APACHE_RUN_USER=www-data
APACHE_RUN_GROUP=www-data

sudo service apache2 restart 	to restart apache2
rvmsudo passenger-status check if passenger is running

navigate to the DNS URL from your regular computer’s browser, should see passenger phusion screen

run standard database migrations etc. using
RAILS_ENV=production rake db:migrate etc.


Reference ubuntu rails setup
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

mysql os x

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


