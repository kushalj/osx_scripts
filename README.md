# OSX Bash Scripts for Development Automation

!!! file PROJECT_NAME.txt contains project name for script references e.g. 'kfe' (without the quotes)

!!! file PROJECT_EXT.txt contains the project extension. So if the extended name is kfecom, this file contains 'com' without quotes.

These scripts aim to add automation, one stroke deployment, backup up of the database etc..


This first needs:

requires git-core

e.g:
```bash
sudo apt-get install git-core
```

# Setup node.js Environment
```bash
./setup-node.sh
```
This:
   1. pulls in environment for node, nvm, emacs, (see https://github.com/kushalj/setup-node)


# Setup Git
```bash
./git_setup.sh "Name surname" "email@address.com"
```
This:
   1. sets up git globals
   2. sets up git credential caching
   3. generates an RSA key for pasting to Github




# Setup Project (only run this once !!!)

Naming convention:
This may not make sense initially but it follows a structured naming convention that a project name is made up of some name initials e.g. 'mv' for Moveville and an extension, e.g. 'org' for .org. The Project name is then $name$extension or in this case 'mvorg' which is used all over the place for uniformity on each project

```bash
./setup-project.sh {project name} {project extension} 
```
e.g:
```bash
./setup-project kfe com
```
this will:
   1. create name=kfe and project=kfecom variables (PROJECT_NAME.txt and PROJECT_EXT.txt)
   2. copy .bashrc_custom to $HOME (for later calling)
   3. install Heroku toolbelt




# Git Mirror 

This scripts duplicates/mirrors a repo into a separate,  empty Github repo
```bash
./git_mirror.sh username1 original_name mirror_name
```
(both without .git extensions)

This:
   1. makes a duplicate --bare repo and uploads to "mirror_name" (which must exist on username1's Github.com)
   2. deletes the --bare repos and downloads a regular clone of the new repo





# Setup Branches for  Git Project

Uses the schema: Dev + Staging + Production, where Production is the master

Dev is running locally on the Ubuntu/EC2 server

Staging is created on Heroku

Production is created on Heroku
```bash
./setup_branches.sh (uses PROJECT_NAME.txt)
```
(Again, ONLY RUN IT ONCE!!)






# Git Remote to SSH
```bash
./git_remote_to_ssh {remote name} {username} {repo}
```
switch default https:// repo to an ssh remote

e.g.
```bash
./git_remote_to_ssh origin kushalj scripts
```

This means I don't have to keep entering the damn password to git push... :)




# Add Path
```bash
./add_path.sh 
```

In case you need to add a global path to scripts


# Deploy.sh

TODO


# local.sh

a place for local tidying before local deploy by localpy or localjs


# localpy.sh and localjs.sh

call local.sh and run relevant py or js development servers for the project



# init_postgres

TODO


# dump_pdb.sh and restore_pdb.sh
```bash
./dump_pdb {file} 
```
dumps the project's postgres db to {file}.dump


```bash
./restore_pdb (file}
```
deletes the project database and restores it from {file}.dump

uses pg_dump and pg_restore




# Dump Heroku Postgres DB
```bash
./heroku_dump.sh
```
downloads a dump of the postgres db on heroku

(this needs work for multi-branch projects)



# .bashrc_custom

Gives the following commands:

(usable after setup-branches.sh)


`gitc` = `git commit -m $1`                                                                                                                                          
`gitpo` = `git push origin master`                                                                                                                                   
                                                                                                                                                                       
`gitcd` = `git checkout develop`                                                                                                                                     
`gitpod` = `git push origin develop`                                                                                                                                  
                                                                                                                                                                       
`gitcs` = `git checkout staging`                                                                                                                                     
`gitpos` = `git push origin staging`

`gitphs` = `git push staging-heroku staging:master`                                                                                                                   
                                                                                                                                                                       
`gitcp` = `git checkout master`                                                                                                                                      
`gitpop` = `git push origin staging` 

`gitphp` = `git push production-heroku master:master` 


`vbashp` = edit ../scripts/.bashrc_custom with vi

`cpbashp` = copy .bashrc_custom to $HOME

`bashp` = run .bashrc_custom



`dl` = deploy project locally (on current server)

`dr` = deploy project remotely (staging or wherever defined)

e.g. I often set dr to merge develop to staging, staging to master and push staging and master all out

Yes, I know. It's only for emergency use. Promise.




# Example

My usual process is to setup up EC2 instance and sudo apt-get install git-core


Then I clone in (from $HOME):

```bash
git clone https://github.com/kushalj/scripts.git
```

```bash
cd $HOME/scripts
./setup-node.sh
```

```bash
cd $HOME/scripts
./setup-project.sh "mv" "org"
```

exit the ec2 instance and log back in - this fires up bash scripts

```bash
cd $HOME/scripts
./git-setup.sh "git_username" "my@email.address"
```

```bash
./add_path.sh (Optional)
```

```bash
cd $HOME
./scripts/git-mirror.sh "git_username" "old_repo" "new_empty_repo_at_github"
```
(optional if you want to copy an older project)


```bash
cd $HOME/your_project
../scripts/git-branches.sh
```


