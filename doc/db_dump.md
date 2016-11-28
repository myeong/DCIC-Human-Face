# How to Dump and Restore a Database from PostgreSQL
==============
Myeong Lee
------------

1. Open "SQL Shell (psql)" app. In MacOS, it is located under the PostgreSQL app folder.
2. Change the user to "postgres" by typing:
```bash
su postgres
```
3. Run the "pg_dump" command as follows. If you have not added 'bin' to your Path, you need to write a full path to the command file. Also, it is possible that you can save the output file only under the "shared" folder. Otherwise, you might face a permission error.
```bash
/Library/PostgreSQL/9.6/bin/pg_dump -o [db_name] > /Users/Shared/test.sql
```

4. You can use the output file to restore the DB in another place by running "psql" command in a similar way.
```bash
psql [db_name] < [Path_to_the_SQL_file]
```
