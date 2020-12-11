# Create Resource Group 1
new-azresourcegroup -name RG1 -location eastus2

# Create Storage Account 1
new-azstorageaccount -ResourceGroupName RG1 -Name itsnoahscloudsa1 -Location eastus2 -SkuName Standard_LRS

# Create Container1
$sa1 = get-azstorageaccount | where {$_.StorageAccountName -eq 'itsnoahscloudsa1'}
$context1 = $sa1.context
new-azstoragecontainer -name container1 -Context $context1

# Create Resource Group 2
new-azresourcegroup -name RG2 -location eastus2

# Create Storage Account2
new-azstorageaccount -ResourceGroupName RG2 -name itsnoahscloudsa2 -location eastus2 -SkuName Standard_LRS

# Create Container2
$sa2 = Get-AzStorageAccount | where {$_.StorageAccountName -eq 'itsnoahscloudsa2'}
$context2 = $sa2.context
New-AzStorageContainer -name container2 -Context $context2

# Download azcopy.exe or run in Azure Cloud Shell
# Format is Container URL + Shared access signature token
# C:\temp\azcopy.exe copy 'https://itsnoahscloudsa1.blob.core.windows.net/container1SAStoken' 'https://itsnoahscloudsa2.blob.core.windows.net/container2SAStoken' --recursive