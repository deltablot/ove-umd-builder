# OVE-UMD-Builder

[Open Vector Editor](https://github.com/TeselaGen/tg-oss/tree/main/packages/ove) is Teselagen's Open Source Vector/Plasmid Editor Component that uses React and Redux. It is published as [@teselagen/ove in the npm registry](https://www.npmjs.com/package/@teselagen/ove). However, if your project does not use React and Redux, open-vector-editor will add a lot of dependencies.

Fortunately, open-vector-editor also has a universal build (Universal Module Definition, UMD).

This is a little helper repository to republish only the UMD files via github actions in a new package [@deltablot/tg-oss-ove-umd](https://www.npmjs.com/package/@deltablot/tg-oss-ove-umd):

- check for new OVE version
- download files if new version is available
- extract umd files
- republish umd files as open-vector-editor-umd package

The files are republished as they are without further testing.
If you have problems with Open Vector Editor please seek help from the OVE developers at https://github.com/TeselaGen/tg-oss/tree/main/packages/ove.
