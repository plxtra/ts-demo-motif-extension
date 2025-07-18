# TsDemo Motif Extension

A minimal example Motif Extension used as a guide to the development of Motif extensions.

For more information on how to develop Motif Extensions, refer to [Motif API](https://plxtra.org/motif-api/Overview/).

Note that this npm package is configured to use the PowerShell shell.

## Build

Run `npm run dist` to create the distribution files under folder `dist`.

If the extension is to be included in Motif, then it must be built first, as Motif uses the files under `dist`.

## Debug

Run `npm run serve` to to start the debug server.  This will run the `Invoke-NgServe` script which:
1. Gets the config file from the `xosp-motif-config` repository.
1. Generates the `BundledExtension` and sets this as the only bundled extension in the config file.
1. Copies the config file and branding files to the `dev_static` folder in the `motif` repository
1. Copies the JavaScript file(s) under `dist` to the `dev_static` folder in the `motif` repository

Both the `xosp-motif-config` and `motif` repositories are expected to be under the same folder as this `ts-demo-motif-extension` repository.  That is, at `../xosp-motif-config` and `../motif`.  Also, it necessary for the the extension to be built prior to running `npm serve`.

If you are using Visual Studio Code, use the `Motif Dev: Attach to Chrome` launch configuration to start Chrome and run Motif with this extension.  With this launch configuration you can place breakpoints in either the extension code or the Motif code.\
Otherwise, go to URL `http://localhost:4200` in your browser and use the browser's development tools to debug Motif.
