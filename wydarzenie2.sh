#!/bin/bash

red='\e[1;31m'
blue='\e[1;34m'
black='\e[1;30;47m'
end_color='\e[0m'

licznik=$(wc -l ~/wydarzenia.txt | cut -f 1 -d " ")


echo -e "${black} WYDARZENIA ${end_color}"

echo -e "${black} Podaj numer wydarzenia, które chcesz przejrzeć jako pierwsze ${end_color}"
read wydarzenie

if [ $wydarzenie -le $licznik ];
then
        event=`head -n $wydarzenie ~/wydarzenia.txt | tail -n 1`
        number=`printf "$event" | cut -f 1 -d "|"`
        name=`printf "$event" | cut -f 2 -d "|"`
        date=`printf "$event" | cut -f 3 -d "|"`
        timer=`printf "$event" | cut -f 4 -d "|"`

        echo -e "${blue} Wydarzenie nr $number - $name, dnia $date, o godzinie $timer. ${end_color}"
else
        echo -e "${red} Podałeś liczbę wiekszą od liczby zapisanych wydarzeń ${end_color}"
        war1=0
        while [ $war1 -eq 0 ]
        do
        echo -e "${red} wpisz inną liczbę lub nacisnij 'y' aby wyświetlić ostatnie zapisane wydarzenie ${end_color}"
        read poprawka
                if [ "$poprawka" == "y" ];
                then
                        war1=1
                        event=`tail -n 1 ~/wydarzenia.txt`
                        number=`printf "$event" | cut -f 1 -d "|"`
                        name=`printf "$event" | cut -f 2 -d "|"`
                        date=`printf "$event" | cut -f 3 -d "|"`
                        timer=`printf "$event" | cut -f 4 -d "|"`
                        echo -e "${blue} Wydarzenie nr $number - $name, dnia $date, o godzinie $timer. ${end_color}"

                else
                        if [ $poprawka -le $licznik ] 
                        then
                                war1=1
                                event=`head -n $wydarzenie ~/wydarzenia.txt | tail -n 1`
                                number=`printf "$event" | cut -f 1 -d "|"`
                                name=`printf "$event" | cut -f 2 -d "|"`
                                date=`printf "$event" | cut -f 3 -d "|"`
                                timer=`printf "$event" | cut -f 4 -d "|"`
                                echo -e "${blue} Wydarzenie nr $number - $name, dnia $date, o godzinie $timer. ${end_color}"
                        fi
                fi
        done
fi
exit 0
