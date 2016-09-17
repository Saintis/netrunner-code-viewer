# Clear /clj folder and copy new files in from the netrunner source
# Requires svn installed for grabbing just the wanted source folder from the repository

GAME_SRC=https://github.com/mtgred/netrunner.git/trunk/src/clj/game
GAME_DEST=clj/src/

echo "Clear clj/"
rm -r clj/

echo "Import game source files into clj/"
svn export $GAME_SRC $GAME_DEST

echo "Done!"
