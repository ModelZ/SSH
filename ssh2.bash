#!/bin/bash

# Variables
user='jetsada.c'
pub_key='ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCbR0RcYRzTw84ULXZHMb4lKJ0QwNM5oSQ/Hhaktdr7QEV5K++PoHtqnI1WZy/lDO76H+WcsiQEeyFYgKIV3az2aZmP9UwUTwzn9+7hoK004XmLpEY+5fMPdcChTX2ilBY/7apC/p5Sfwu80PPJ8/Ae1nVUNawqhYiyHzzmXd341zSAElWbwavoGBI5arDWggFlk4SkLY6b6wVQSDstUozv9St7vOCG36mNnbm1RlqFeaViDAMk/P4i1ZFlDjDOsUR7SL3tRPCf9l02y+WlIQx2NoQQQs8+6/k4pXxVFrPIMWODRl9dG2M+cl4ExXlcQQMnk5ToPnYtI+bhP/719cRv ModelZNoPass'

# Create a new user with a home directory and bash shell
useradd -s /bin/bash -m $user

# Set up SSH directory and authorized_keys file with appropriate permissions
mkdir -p /home/$user/.ssh
chmod 700 /home/$user/.ssh

# Add the public key to authorized_keys
echo $pub_key >> /home/$user/.ssh/authorized_keys
chmod 640 /home/$user/.ssh/authorized_keys

# Set ownership of the home directory to the new user
chown -R $user:$user /home/$user

# Add user to sudoers file
echo "$user   ALL=(ALL)       ALL" | tee -a /etc/sudoers

# Prompt to set password for the new user
echo "Please set a password for the user $user."
passwd $user
