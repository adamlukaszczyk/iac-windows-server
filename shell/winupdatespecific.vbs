Set updateSession = CreateObject("Microsoft.Update.Session")
updateSession.ClientApplicationID = "MSDN Sample Script"

'Get update title to search for
updateTitle = WScript.Arguments.Item(0)

WScript.Echo vbCRLF & "Searching for: " & updateTitle & "..."

Set updateSearcher = updateSession.CreateupdateSearcher()

'Search for all software updates, already installed and not installed
Set searchResult = _
updateSearcher.Search("Type='Software'")

Set updateToInstall = CreateObject("Microsoft.Update.UpdateColl")

updateIsApplicable = False

'Cycle through search results to look for the update title
For i = 0 To searchResult.Updates.Count-1
   Set update = searchResult.Updates.Item(i)
   If UCase(update.Title) = UCase(updateTitle) Then
   'Update in list of applicable updates
   'Determine if it is already installed or not
      If update.IsInstalled = False Then
         WScript.Echo vbCRLF & _
         "Result: Update applicable, not installed."
         updateIsApplicable = True
         updateToInstall.Add(update)
      Else
         'Update is installed so notify user and quit
         WScript.Echo vbCRLF & _
         "Result: Update applicable, already installed."
         updateIsApplicable = True
         WScript.Quit
      End If
   End If
Next

If updateIsApplicable = False Then
   WScript.Echo "Result: Update is not applicable to this machine."
   WScript.Quit
End If

'Download update
Set downloader = updateSession.CreateUpdateDownloader()
downloader.Updates = updateToInstall
WScript.Echo vbCRLF & "Downloading..."
Set downloadResult = downloader.Download()
WScript.Echo "Download Result: " & downloadResult.ResultCode

'Install Update
Set installer = updateSession.CreateUpdateInstaller()
WScript.Echo vbCRLF & "Installing..."
installer.Updates = updateToInstall
Set installationResult = installer.Install()

'Output the result of the installation
WScript.Echo "Installation Result: " & _
installationResult.ResultCode
WScript.Echo "Reboot Required: " & _
installationResult.RebootRequired
