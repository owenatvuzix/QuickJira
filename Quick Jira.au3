#include <MsgBoxConstants.au3>
#include <Chrome.au3>

Opt("TrayAutoPause", 0)

HotKeySet("^+z", "JiraLookup") ;Ctrl+Shift+z
HotKeySet("^+x", "JiraSearch") ;Ctrl+Shift+x


While 1 ;loop forever to wait for the keypress
	Sleep(100) ;no need to kill the CPU
WEnd

Func JiraLookup()

	Local $sJiraID = InputBox("Quick Jira", "Enter the Jira ID:") ;Prompt for Jira ID

	Local $sJiraURL = "https://vuzixcorp.atlassian.net/secure/QuickSearch.jspa?searchString=VS-"; Define base Jira URL

	Local $sProfileFlag = ' --profile-directory="Profile 2"' ;Specify Chrome profile flag

	Local $sLookupURL = $sJiraURL & $sJiraID & $sProfileFlag ;concatenate URL with ID provided

	if StringLen($sJiraID) > 0 Then
		_ChromeStartup($sLookupURL) ;Open Chrome with specified URL
	EndIf

EndFunc   ;==>JiraLookup


Func JiraSearch()

	Local $sJiraSearch = InputBox("Quick Jira", "Enter the string to search for:") ;Prompt for Jira ID

	Local $sJiraURL = "https://vuzixcorp.atlassian.net/issues/?jql=text%20~%20%22"; Define base Jira URL

	Local $sJiralURL2 = "%22%20order%20by%20created%20DESC"

	Local $sProfileFlag = ' --profile-directory="Profile 2"' ;Specify Chrome profile flag

	Local $sSearchURL = $sJiraURL & $sJiraSearch & $sJiralURL2 & $sProfileFlag ;concatenate URL with ID provided

	if StringLen($sJiraSearch) > 0 Then
		_ChromeStartup($sSearchURL) ;Open Chrome with specified URL
	EndIf

EndFunc   ;==>JiraSearch
