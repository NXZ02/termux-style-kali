#!/bin/bash


G="$(printf '\033[1;32m')";
Y="$(printf '\033[1;33m')";
W="$(printf '\033[1;37m')";
C="$(printf '\033[1;36m')";
R="$(printf '\033[1;31m')";

function menu()
{
    echo -e "[i]nstall ";
    echo -e "[u]nstall";
    echo -e "[q]uit";
    echo -e "";
}


function setup()
{
    if ! which figlet  wget > /dev/null; then
        pkg install figlet wget -y

    else
        echo ${C};
        clear && figlet Yuki_senpai 
        echo ${W};
    fi
}

function backup()
{
        if [ -d backup ]; then
            echo ${G};
            if [ ! -f backup/bash.bashrc ]; then
            echo -e "Create backup file bashrc ..."; 
            sleep 0.5;
            cp -r $PREFIX/etc/bash.bashrc $PWD/backup;
            echo -e "Create success !";
            fi
           
        else
            echo ${G}
            echo -e "Create Folder ..."
            sleep 0.5
            mkdir backup
            backup

        fi 
}

function original()
{
        if [ -d original ]; then
            if [ -f original/bash.bashrc ]; then
                echo ${G}
                echo -e "Check Files Found[1] = OK ";
            else
                echo ${R}
                echo -e "Program it not run !!"
                echo -e "Error Folder original is not files !!"
                exit 0
            fi
           
        else
            echo ${G}    
            echo -e "Create folder ... "
            sleep 0.5
            mkdir original
            original
            

        fi 
}





function input()
{
    echo ${Y};
    read -p "SELECT[$sel] : " sel

    case $sel in
        "i")
            backup
            original
            echo "";
            echo -e "Install ...";
            sleep 0.5
            cp -r  $PREFIX/etc/bash.bashrc $PREFIX/etc/bash.bashrc.bk
            cp -r original/bash.bashrc $PREFIX/etc
            echo ${G}
            echo -e "Program Exit...";;
        "u")
            echo -e "Unstalling ..."
            sleep 0.5
            cp -r backup/bash.bashrc $PREFIX/etc
            echo -e "Unstall Finnish ..."
            echo ${G}
            read -p "key continune... "
            exit 0;;
        "q")
            echo -e "Exit  Program ...."
            exit 0;;
          *)    
            echo ${R}
            echo -e "Not chocice !"
            sleep 1
            setup
            menu
            input
    esac
    
}



# Main Funtion
setup
menu
input



