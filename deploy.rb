# use the ubuntu machine gem
# Sample deploy.rb file
require 'capistrano/ext/ubuntu-machine'


# #######################################
# HOSTING PROVIDER CONFIGURATION
# Those tasks have been tested with severa hosting providers
# and sometimes tasks are specific to those providers
set :hosting_provider, "slicehost" # currently supported : ovh-rps, ovh-dedie, slicehost


# #######################################
# SERVER CONFIGURATION
set :server_name, "YOUR_SERVER_NAME_HERE"
set :user, 'YOUR_SERVER_USER_NAME_HERE'
ssh_options[:port] = 22


# #######################################
# LOCAL CONFIGURATION
ssh_options[:keys] = "/YOUR_LOCAL_PATH_TO_YOUR_PUBLIC_KEY/id_rsa"
set :default_local_files_path, "YOUR_LOCAL_PATH_TO_UPLOAD_DOWNLOAD_FILES"


# #######################################
# SOFTWARE INSTALL CONFIGURATION

# version numbers
# set :ruby_enterprise_version, "ruby-enterprise-1.8.6-20090113" -> not needed anymore the latest version if automatically fetched
# set :passenger_version, "2.0.6" -> not needed anymore the latest version if automatically fetched
set :rubygem_version, "1.3.1"
set :git_version, "git-1.6.0.6"

# some Apache default values
set :default_server_admin, "YOUR_EMAIL_ADDRESS_HERE"
set :default_directory_index, "index.html"


role :gateway,  server_name
role :app,      server_name
role :web,      server_name
role :db,       server_name, :primary => true
