Param(
    # Azure subscription ID associated with the Dev/Test lab instance.
    [ValidateNotNullOrEmpty()]
    [string]
    $SubscriptionId,

    #Name for the new resource group where the lab will be created 
    [ValidateNotNullOrEmpty()]
    [string]
    $ResourceGroupName,

    #Location for the resource group to be created. e.g. West US 
    [ValidateNotNullOrEmpty()]
    [string]
    $ResourceGroupLocation
)

##################################################################################################

#
# Powershell Configurations
#

# Note: Because the $ErrorActionPreference is "Stop", this script will stop on first failure.
$ErrorActionPreference = "stop"

"Login to the subscription with your Azure account..."
#Login-AzureRmAccount -SubscriptionId $SubscriptionId
#TODO: Use the line below instead of Login above, once you're authenticated.
Select-AzureRmSubscription -SubscriptionId $SubscriptionId | Out-Null

"Start deploying the new Single Master Node using the ARM templates..."
New-AzureRmResourceGroupDeployment -Name SingleMasterDeployment -ResourceGroupName $ResourceGroupName -TemplateFile .\single-master-node.json -TemplateParameterFile .\single-master-node.parameters.json -Verbose