echo $REPL_SLUG
sed -i "3c\
https://${REPL_SLUG}.${REPL_OWNER}.repl.co:9000" README.md
wasp start
