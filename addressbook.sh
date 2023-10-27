#!/bin/bash

ADDRESSBOOK_FILE="contacts.txt"

function new(){

name=$1
email=$2
echo "$name $email">>$ADDRESSBOOK_FILE
}

function list(){
if [[ ! -s $ADDRESSBOOK_FILE ]]; then
       echo "Адресна книга пуста!"

     else
cat $ADDRESSBOOK_FILE
fi
}
function remove (){
name=$1
sed -i "/^$name/d" $ADDRESSBOOK_FILE
}
function clear() {
rm -f $ADDRESSBOOK_FILE
}
function lookup (){
name=$1
grep "^$name" $ADDRESSBOOK_FILE | cut -d: -f2
}

if [[ ! -f $ADDRESSBOOK_FILE ]]; then
 touch $ADDRESSBOOK_FILE
fi

case $1 in
   "new")
      new "$2" "$3"
        ;;
    "list")
       list
        ;;
     "remove")
        remove "$2"
       ;;
       "clear")
        clear
        ;;
        "lookup")
         lookup "$2"
        ;;
    *)
echo "Невідома команда((("
esac
