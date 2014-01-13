#!/bin/bash
red='\e[1;31m'
blue='\e[1;34m'
black='\e[1;30;47m'
black1='\e[1;32m'
end_color='\e[0m'

if [ ! -e ~/tmp/praca/zlecenia/niezrealizowane/wydarzenia.txt ];
then
`touch ~/tmp/praca/zlecenia/niezrealizowane/wydarzenia.txt`
fi

licznik=$(wc -l ~/tmp/praca/zlecenia/niezrealizowane/wydarzenia.txt | cut -f 1 -d " ")

echo -e "${black1} Dodaj nazwę wydarzenia:${end_color}"
read event
echo -e "${black1} Podaj datę tego wydarzenia (dd.mm.rrrr):${end_color}"
read date
war1=0
reg1="([0-9]{1,2})\.([0-9]{1,2})\.([0-9]{1,4})"

while [ "$war1" -eq 0 ]

do
        if [[ $date =~ ^${reg1} ]]; then
                war1=1
        else
                echo -e "${red} Wpisano niewłaściwy format danych! Wpisz ponownie date według wzorca ${end_color}"
                read date
        fi
done

echo -e "${black1} Dodaj godzine podanego wydarzenia (gg:mm):${end_color}"
read timer
war2=0

reg2="([0-9]{1,2}):([0-9]{1,2})"

while [ "$war2" -eq 0 ]

do
        if [[ $timer =~ ^${reg2} ]]; then
                war2=1
        else
                echo -e "${red} Wpisano niewłaściwy format danych! Wpisz ponownie godzine według wzorca ${end_color}"
                read timer
        fi
done

licznik=$[$licznik+1]

`printf "%s\n" "$licznik | $event | $date | $timer" >> ~/tmp/praca/zlecenia/niezrealizowane/wydarzenia.txt`
echo -e "${black} Zapisano następujące wydarzenie:${end_color}"
echo -e "${blue} $event, dnia $date, o $timer ${end_color}"
exit 0
