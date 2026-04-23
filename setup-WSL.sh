#!/bin/bash

################
# WSL2 install #
################

# Documentation : https://learn.microsoft.com/fr-fr/windows/wsl/install

# Powershell as administrator
# $ wsl --update
# $ wsl --list --online
# $ wsl --install -d Ubuntu-22.04

#####################
# Actual WSL script #
#####################

# Get this file
# $ wget https://raw.githubusercontent.com/Relex12/Work-Environment/refs/heads/main/setup-WSL.sh
# $ chmod u+x setup-WSL.sh

# Set DESKTOP env variable
# if $DESKTOP is empty
if [ -z $DESKTOP ]
then
	# if $DESKTOP not in bashrc
	if [ $(grep -oc DESKTOP ~/.bashrc) == 0 ]
	then
		# Get username
		echo -n "List of Windows users:	" && ls /mnt/c/Users/
		echo -n "Enter your Windows session username or leave empty to skip		" && read username
		# if not empty
		if [ ! -z $username ]
		then
			# Check that input is correct
			export username=`ls /mnt/c/Users/ | grep -wi "$username"`
			[ -z $username ] && echo "Error: user not found in /mnt/c/Users/" && exit 1
			[ -d /mnt/c/Users/$username/Desktop ] && export DESKTOP=/mnt/c/Users/$username/Desktop
			[ -d /mnt/c/Users/$username/Bureau ] && export DESKTOP=/mnt/c/Users/$username/Bureau
			[ -z $DESKTOP ] && echo "Error: no desktop directory found" && exit 1
			cd $DESKTOP ; cd
			# Add to bashrc
			echo "export DESKTOP=$DESKTOP" >> ~/.bashrc
			# Create Corbeille subdir and alias rm
			mkdir -p $DESKTOP/Corbeille
			echo "alias rm='mv -t \$DESKTOP/Corbeille'" >> ~/.bashrc
		fi
	else
		echo "Warning: DESKTOP undefined in environment, please source ~/.bashrc"
	fi
fi

# Set proxy
if [ -z $http_proxy ] && [ -z $https_proxy ]
then
	if [ $(grep -oc proxy ~/.bashrc) == 0 ]
	then
		echo -n "Enter proxy to use for HTTP and HTTPS or leave empty to skip		" && read proxy
		if [ ! -z "$proxy" ]
		then
			export http_proxy=$proxy ; echo "export http_proxy=$proxy" >> ~/.bashrc
			export https_proxy=$proxy ; echo "export https_proxy=$proxy" >> ~/.bashrc
			echo "Acquire::http::proxy  \"http://$proxy\";" | sudo tee -a /etc/apt/apt.conf > /dev/null
		fi
	else
		echo "Error: proxy undefined in environment, please source ~/.bashrc"
	fi
fi

# Config git user name and email
[ -z "$(git config user.name)" ] && echo -n "Enter your git name (e.g: \"John Doe\") or leave empty to skip		" && read git_name
[ ! -z "$git_name" ] && git config --global user.name "$git_name"
[ -z "$(git config user.email)" ] && echo -n "Enter your git email (e.g: example@xyz.net) or leave empty to skip		" && read git_email
[ ! -z "$git_email" ] && git config --global user.email "$git_email"

# Use mouse in vi, set vi as default
if [ $(grep -xoc "set mouse=a" /etc/vim/vimrc) != 0 ]
then
	sudo chown `whoami` /etc/vim/vimrc
	sudo echo "set mouse=a" >> /etc/vim/vimrc
	echo "export EDITOR=vim " >> ~/.bashrc
	git config --global core.editor "vim"
fi

# Remove sudo password
# if file does not exist or does not contain current user
[[ ! -f /etc/sudoers.d/passwd_rm || $(grep -oc `whoami` /etc/sudoers.d/passwd_rm) == 0 ]] && echo -n "Remove password for sudo? (y/N)	" && read remove
# if not empty and affirmative
[ ! -z $remove ] && [ ${remove,,} == "y" ] && echo "$(whoami) ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers.d/passwd_rm >/dev/null

# Update apt and install requirements
export requirements="cmatrix cowsay dos2unix fortune graphviz iproute2 jq net-tools neofetch nmap pandoc python3 python3-pip sl texlive-lang-french texlive-latex-extra tig traceroute tree"
echo -n "Update apt and install requirements? (y/N)	" && read update
[ ! -z $update ] && [ ${update,,} == "y" ] && sudo apt update && sudo apt upgrade -y && sudo apt install -y $requirements && sudo apt autoremove -y

# Add Github CLI repo
echo -n "Add Github CLI repo? (y/N)	" && read install
if [ ! -z $install ] && [ ${install,,} == "y" ]
then
	type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
	curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
	sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
	sudo apt update && sudo apt install gh -y
fi

# Add sudo for docker
# if docker not in bashrc
[ $(grep -oc docker ~/.bashrc) == 0 ] && echo "alias docker='sudo docker'" >> ~/.bashrc

# Pip requirements
export requirements="Flask matplotlib numpy pandas setuptools pdoc3 wheel"
echo -n "Update pip and install requirements? (y/N)	" && read update
[ ! -z $update ] && [ ${update,,} == "y" ] && python3 -m pip install -U pip && python3 -m pip install $requirements && echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc

# Github CLI login
echo -n "Login to Github CLI? (y/N)	" && read login
[ ! -z $login ] && [ ${login,,} == "y" ] && BROWSER="/mnt/c/Windows/explorer.exe" gh auth login

# Github clone
if [ ! -z $DESKTOP ] && [ ! -d $DESKTOP/Github ]
then
	mkdir -p $DESKTOP/Github
	pushd $DESKTOP/Github
	sudo git clone https://github.com/Relex12/Website-manager.git
	pushd Website-manager
	./clone.py
	popd
	popd
fi

# Add sync dir in DESKTOP
# Multi distrib not supported yet
[ ! -z $DESKTOP ] && [ ! -d $DESKTOP/RSync ] && mkdir -p $DESKTOP/RSync && cat >> ~/.bashrc << "EOF"
# RSync script
if [ ! -f $DESKTOP/RSync/\$(date +%d%m%y).lock ]
then
    echo -en "Syncing files from home to DESKTOP...\r"
    [ -f $DESKTOP/RSync/*.lock ] && rm -f $DESKTOP/RSync/*.lock
    rsync -az --exclude=".*/*" ~ $DESKTOP/RSync/
    touch $DESKTOP/RSync/\$(date +%d%m%y).lock
fi
EOF
