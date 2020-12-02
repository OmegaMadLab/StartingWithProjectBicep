# Bicep version
bicep --help

# Building the SQL example
code .\01-BasicExamples\simpleSQL_source.json

code .\01-BasicExamples\simpleSQL.bicep

bicep build .\01-BasicExamples\simpleSQL.bicep

code -d .\01-BasicExamples\simpleSQL_source.json .\01-BasicExamples\simpleSQL_final.json

# Decompile an ARM template
bicep decompile .\02-Decompiling\storageAccount.json

code .\02-Decompiling\storageAccount.bicep

# Building the modules example
bicep build .\03-Modules\main.bicep

code .\03-Modules\main.json

# Different scopes example
code .\04-DifferentScopes\differentScopes.bicep
code .\04-DifferentScopes\storageAccount.bicep

bicep build .\04-DifferentScopes\differentScopes.bicep

code .\04-DifferentScopes\differentScopes.json

