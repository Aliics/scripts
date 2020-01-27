#! /usr/bin/env bash

name=$1

# Scripts typically end in .sh, but sometimes I am too lazy to type that out.
# However, there are occassions where I do simply type the full name and it
# does not end in the extension.
if [[ "$name" != *".sh" ]]
then
    read -p "Would you like to append '.sh'? [y/N] " reply
    
    # I don't actually care about anything other than yes, and the syntax
    # is just slighty clearer than an if for this comparison.
    case $reply in
        [yY]) name="$name.sh"
    esac
fi

# Check to see if an executable file of the same name exists, then prompt
# whether to overwrite or not.
if [[ -x $name ]]
then
    read -p "Executable named $name already exists. Continue? [y/N] " reply

    # Basically kill the program if user doesn't want to overwrite.
    case $reply in
        [nN]) exit 1
    esac
fi


echo "Creating executable script $name"

# All unix systems should have touch. I'd be surprised.
touch $name
echo "#! /usr/bin/env bash" >> $name

# Make the script executable by a user.
chmod +x $name
