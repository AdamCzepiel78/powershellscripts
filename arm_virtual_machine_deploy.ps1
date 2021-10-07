$resourceGroupName = Read-Host "Enter a resource Group" 
$location = "westeurope"

New-AzResourceGroup -Name $resourceGroupName -Location "$location" -ErrorAction Continue


New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateFile .\arm_virtual_machine.json `
    -TemplateParameterFile .\arm_virtual_machine_parameters.json

 (Get-AzVm -ResourceGroupName $resourceGroupName).name