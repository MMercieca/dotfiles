

TEMP_DIR=`mktemp -d .XXXXXXXXX`

curl -O https://github.com/downloads/robbiehanson/XcodeColors/XcodeColors.xcplugin.zip

unzip -d $TEMP_DIR XcodeColors.xcplugin.zip

mkdir -p ~/Library/Application Support/Developer/Shared/Xcode/Plug-ins
mv $TEMP_DIR/XcodeColors.xcplugin ~/Library/Application Support/Developer/Shared/Xcode/Plug-ins

rm -rf $TEMP_DIR
rm -rf XcodeColors.xcplugin.zip