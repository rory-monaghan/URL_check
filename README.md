# URL_check
Check URLs against a specific list of errors. Output URLs with specified errors to a file, accompanied by relevant information for further investigation.

The errors to be caught by the script:
- cURL exit codes related to SSL. The exit codes used are 35, 60, 66, 77, 90 and 91. View https://curl.se/docs/manpage.html for further information on these exit codes (they are placed at the bottom of the page).
- HTTP codes 400 or above. Output includes the HTTP code for clarification.
- HTTP code 000. A string, "TIMED OUT", is added to this output. 


