# Bash script

servicePrincipalName="sp-network-azjhals"
roleName="Network Contributor"
subscriptionID=$(az account show --query id --output tsv | sed -e 's,\r,,g')
echo "Using subscription ID ${subscriptionID}"
resourceGroup="rg-azjhals-1"
echo "Creating SP for RBAC with name $servicePrincipalName, with role $roleName and in scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup"
az ad sp create-for-rbac --name $servicePrincipalName \
--role "$roleName" \
--scopes /subscriptions/$subscriptionID/resourceGroups/$resourceGroup

