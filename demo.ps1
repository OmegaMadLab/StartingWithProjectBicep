# Bicep version
bicep --help

# Building the SQL example
code .\01-BasicExamples\ultraSimpleSQL.png

code .\01-BasicExamples\ultraSimpleSQL_source.json

code .\01-BasicExamples\ultraSimpleSQL.bicep

bicep build .\01-BasicExamples\ultraSimpleSQL.bicep

code -d .\01-BasicExamples\simpleSQL_source.json .\01-BasicExamples\simpleSQL_final.json

# Decompile an existing ARM Template
bicep decompile .\01-BasicExamples\ultraSimpleSQL_final.json --outfile .\ultraSimpleSQL_decompiled.bicep

code -d .\01-BasicExamples\ultraSimpleSQL_decompiled.bicep .\01-BasicExamples\ultraSimpleSQL_final.bicep

# Deploying a BICEP file
New-AzResourceGroupDeployment -ResourceGroupName SQLDEMO-RG -TemplateFile .\01-BasicExamples\ultraSimpleSQL_final.bicep

# Dynamic approach
code .\01-BasicExamples\simpleSQL.png
code .\01-BasicExamples\simpleSQL_source.json
code .\01-BasicExamples\simpleSQL.bicep

code .\01-BasicExamples\webApp.png
code .\01-BasicExamples\webApp.json
code .\01-BasicExamples\webApp.bicep

# Modules
code .\03-Modules\sqlSrv-module.bicep
code .\03-Modules\db-main.bicep

bicep build .\03-Modules\db-main.bicep --outfile .\03-Modules\sqlAndDb.json
code .\03-Modules\sqlAndDb.json

code -d .\03-Modules\db-main.bicep .\03-Modules\db-main-condition.bicep
bicep build .\03-Modules\db-main-condition.bicep --outfile .\03-Modules\sqlAndDb-condition.json
code .\03-Modules\sqlAndDb-condition.json

code .\03-Modules\webApp_geo.png
code .\03-Modules\webApp-module.bicep
code .\03-Modules\webApp-main.bicep



