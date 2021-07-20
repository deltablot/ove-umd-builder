#!/usr/bin/env bash
declare -r VERSION='0.1.0'

# source the npm auth-token
source .env

# need this to delete files
shopt -s extglob

#get current local version of open-vector-editor-umd
OveUmdV=$(node -pe "require('./open-vector-editor-umd/package.json').version")

# get the latest version of open-vector-editor
OveV=$(npm view open-vector-editor version)

function clean()
{
    # delete all old files
    (
        cd open-vector-editor-umd || exit 1
        rm -rf !('package.json'|'README.md')
    )
}

function copy-umd-files()
{
    # copy only the umd files
    cp node_modules/open-vector-editor/umd/* open-vector-editor-umd/
}

function help()
{
    version
    echo "
    Usage: ove-umd.sh [OPTION] [COMMAND]
           ove-umd.sh [ --help | --version ]

    Commands:

        copy-umd-files  Copy OVE umd files from node_modules folder to open-vector-editor-umd
        clean           Delete open-vector-editor-umd files
        help            Show this text
        publish         Publish the current version of open-vector-editor-umd at npm
        run             Upgrade and publish
        upgrade         Get the latest version of open-vector-editor from npm
        version         Display script version
    "
}

function publish()
{
    # update version number and publish
    (
        cd open-vector-editor-umd || exit 1
        npm version --allow-same-version $OveV
        npm publish --access public
    )
}

function run()
{
    if [[ "$OveUmdV" != "$OveV" ]]; then
        upgrade
        publish
    fi
}

function upgrade()
{
    # download the new version
    npm install open-vector-editor@$OveV --silent

    clean
    copy-umd-files
}

function version()
{
    echo "© 2021 Marcel Bolten, Nicolas CARPi"
    echo "version: $VERSION"
}

# SCRIPT BEGIN

# only one argument allowed
if [ $# != 1 ]; then
    help
    exit 1
fi

# deal with --help and --version
case "$1" in
    -h|--help)
    help
    exit 0
    ;;
    -v|--version)
    version
    exit 0
    ;;
esac

# available commands
declare -A commands
for valid in clean copy-umd-files help publish run upgrade version
do
    commands[$valid]=1
done

if [[ ${commands[$1]} ]]; then
    # exit if variable isn't set
    set -u
    $1
else
    help
    exit 1
fi
