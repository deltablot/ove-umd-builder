# OVE-UMD-Builder

[Open Vector Editor](https://github.com/TeselaGen/openVectorEditor) is Teselagen's Open Source Vector/Plasmid Editor Component that uses React and Redux. It is published as [open-vector-editor in the npm registry](https://www.npmjs.com/package/open-vector-editor). However, if your project does not use React and Redux, open-vector-editor will add a lot of dependencies.

Fortunately, open-vector-editor also has a universal build (Universal Module Definition, UMD).

This is a little helper script to republish only the UMD files in a new package [@deltablot/open-vector-editor-umd](https://www.npmjs.com/package/@deltablot/open-vector-editor-umd):

- check for new OVE version
- download files if new version is available
- extract umd files
- republish umd files as open-vector-editor-umd package

The files are republished as they are without further testing.
If you have problems with Open Vector Editor please seek help from the OVE developers at https://github.com/TeselaGen/openVectorEditor.

# Setup

- clone this git repository
- rename `.env.dist` to `.env`
- replace "YOUR-TOKEN-GOES-HERE" with your actual token from npmjs.com
- setup a cron job to execute `build.sh run` with the desired schedule
