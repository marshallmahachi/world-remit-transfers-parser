# world-remit-transfers-parser

1. Login to the world-remit website: `https://www.worldremit.com/`
2. Open another tab and goto `https://www.worldremit.com/en/account/props/transfersStatuses`; this should return your history of transfers in JSON.
3. Save the JSON file in the same file as the script.
4. Run the script with the filename as argument. `./world_remit_json_parser.pl <jsonfilename>`
NB: only processing USD transfers at the moment;

sample result:
```
./world_remit_json_parser.pl transfersStatuses.json
opening: transfersStatuses.json
2022-09-11T21:10:41Z,recepient name-1,400
2022-09-09T11:50:55Z,recepient name-2,500

--------------------
$VAR1 = {
          'recepient name-1' => 400,
          'recepient name-2' => 500
        };

--------------------
total: 900.00
```
