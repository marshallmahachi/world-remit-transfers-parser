# world-remit-transfers-parser

1. Login to the world-remit website: `https://www.worldremit.com/`
2. Open another tab and goto `https://www.worldremit.com/en/account/props/transfersStatuses`; this should return your history of transfers in JSON.
3. Save the JSON file in the same file as the script.
4. Run the script with the filename as argument. `./world_remit_json_parser.pl <jsonfilename>`
