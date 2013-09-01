#! /bin/bash

# Fix permissions on entire /tftpboot/ folder.

FOLDER=/tftpboot

function resetPermissions() {
    echo "Fix files and folders ownership and permissions"
    echo "Set ownership to user root and group root"
    chown root:root $FOLDER/ -R
    echo "Set files permissions 644"
    chmod 644 $FOLDER/ -R
    echo "Set folder permissions 755"
    find $FOLDER/ -type d -print | xargs chmod 755
    echo "Reset script permissions"
    chmod 744 $FOLDER/bin/ -R
    chmod +x $FOLDER/*.sh
}

path="/tftpboot/";
echo "Reseting $path permissions.";
read -r -p "Are you sure? [Y/n] " response
case $response in
    [yY][eE][sS]|[yY]) 
        resetPermissions;
        echo "Done."
        ;;
    *)
        echo "Aborting."
        ;;
esac
