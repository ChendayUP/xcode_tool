cd Users/mac/Documents/MyWork/xcode_backup/xcode_tool
cp -R /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/File\ Templates/Source/Custom.xctemplate /Users/mac/Documents/MyWork/xcode_backup/xcode_tool/

git add .
git commit -m "Added New for $(date)"
git push
