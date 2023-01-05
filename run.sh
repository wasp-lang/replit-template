sed -i "s|<APP_URL_WILL_GET_AUTOMATICALLY_INSERTED_HERE>|https://${REPL_SLUG}.${REPL_OWNER}.repl.co:9000|; s|https://[^:]*:9000|https://${REPL_SLUG}.${REPL_OWNER}.repl.co:9000|g" README.md
wasp start