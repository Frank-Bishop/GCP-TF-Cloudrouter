#/usr/local/bin/bash
#read -p 'How many subnet do you need? ': answer; echo "$answer"
#read -p 'Continue (y/n)? ' -n1 answer; echo; [[ $answer = [1-3] ]] || return


#!/bin/bash
func()
{
    echo -n "How many subnet do you need ? 1-9: "
    read confirmation
}   

confirmation="$(echo ${confirmation} | tr -dc '0-9')"
if [ "$confirmation" == "1" ] || [ "$confirmation" == 2 ] || [ "$confirmation" == 3 ] ; then
    echo "I am gladd you said $confirmation"
else
    func
    echo "other"
fi
exit 0