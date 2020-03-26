# Azure

		{
			"apiVersion": "2017-03-30",
			"type": "Microsoft.Compute/virtualMachines/extensions",
			"name": "concat(variables('vmNamePrefix'),copyIndex(parameters('vmStartingIndex')),'/LanguageSettings')]",
			"location": "[resourceGroup().location]",
			"copy": {
				"name": "extensionloop",
                "count": "[parameters('numberOfVms')]"
			},
			"dependsOn": [
				"[concat('Microsoft.Compute/virtualMachines/', concat(variables('vmNamePrefix'), copyIndex(parameters('vmStartingIndex'))))]"
			],
			"properties": {
				"publisher": "Microsoft.Compute",
				"type": "CustomScriptExtension",
				"typeHandlerVersion": "1.7",
				"autoUpgradeMinorVersion": "true",
				"settings": {
				"fileUris": ["https://StorageAccountWithFiles.blob.core.windows.net/customscripts/Initialise-VM.ps1", "https://StorageAccountWithFiles.blob.core.windows.net/customscripts/UKRegion.xml"],
				"commandToExecute": "powershell.exe -ExecutionPolicy Unrestricted -File Initialise-VM.ps1"
			},
			"protectedSettings": {
				"storageAccountName": "StorageAccountWithFiles",
				"storageAccountKey": "[listKeys(resourceId('ResourceGroupOfStorageAccountWithFiles','Microsoft.Storage/storageAccounts', 'StorageAccountWithFiles')), '2015-06-15').key1]"
			}
			}
		}
