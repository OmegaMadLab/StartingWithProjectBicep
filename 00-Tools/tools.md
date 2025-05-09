# Tools

To start working with Bicep you need:

- The [Bicep CLI](https://github.com/Azure/bicep/blob/main/docs/installing.md) that permits you to transpile/decompile bicep files to JSON ARM files. This is **mandatory**.
You can easily install and maintain it with *winget*:

```bash
#Install Bicep
winget install Microsoft.Bicep

#Update Bicep
winget upgrade Microsoft.Bicep
```

- The [VSCode Bicep Extentions](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-bicep). Even if you can use your preferred IDE to write bicep files, it's *highly recommended* to use VSCode and its extension to obtain an improved authoring experience and avoid some headaches.
  
- PowerShell Az module (5.6.0+) or Az CLI (2.20.0+)

If you prefer to work with a pre-configured devcontainer, you can follow the instructions available [here](https://github.com/Azure/vscode-remote-try-bicep).
