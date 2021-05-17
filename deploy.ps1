# Bicep version
bicep --help

# Building the SQL example
code .\01-BasicExamples\simpleSQL.png

code .\01-BasicExamples\simpleSQL_source.json

code .\01-BasicExamples\simpleSQL.bicep

bicep build .\01-BasicExamples\simpleSQL.bicep

code -d .\01-BasicExamples\simpleSQL_source.json .\01-BasicExamples\simpleSQL_final.json

# Decompile an ARM template
code .\02-Decompiling\storageAccount.json

bicep decompile .\02-Decompiling\storageAccount.json

code .\02-Decompiling\storageAccount.bicep

# Building the modules example
bicep build .\03-Modules\main.bicep

code .\03-Modules\main.json

# Webapp and modules example
code .\03-Modules\webApp.png
code .\03-BasicExamples\webapp.bicep
code .\03-BasicExamples\webapp.json

code .\03-Modules\webApp_geo.png
code .\03-Modules\webApp-main.bicep

bicep build .\03-Modules\webapp-main.bicep

code .\03-Modules\webapp-main.json


# Different scopes example
code .\04-DifferentScopes\differentScopes.bicep
code .\04-DifferentScopes\storageAccount.bicep

bicep build .\04-DifferentScopes\differentScopes.bicep

code .\04-DifferentScopes\differentScopes.json

