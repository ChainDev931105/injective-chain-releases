mongo --eval "rs.initiate()"
# import exchange db (takes around 10-15 mins)
mongorestore --uri="mongodb://localhost:27017"  --gzip --archive=exchangedb --nsInclude=exchange.* -v