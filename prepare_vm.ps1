# Set Locale, language etc. 
& $env:c:\windows\System32\control.exe "intl.cpl,,/f:`"AURegion.xml`""

# Set Timezone
& tzutil /s "AUS Eastern Standard Time"

# Set languages/culture
Set-Culture en-AU
