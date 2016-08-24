# Clear /clj folder and copy new files in from the netrunner source
# Requires svn installed for grabbing just the wanted source folder from the repository

SOURCE=https://github.com/mtgred/netrunner.git/trunk/src/clj/game
DEST=clj/

echo "Clear clj/"
rm -r clj/

echo "Import game source files into clj/"
svn export $SOURCE $DEST

echo "Done!"
