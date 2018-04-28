How to create a image path table on database
==============
Hyeong-gi Hong
------------

1. Connect to the database with credential file

2. Store the image file names by using scandir() function
	```bash
	scandir("/var/www/html/images/properties/")
	```

3. Create a loop. Throughout the loop, access each image filename. The filename format is:
	```bash
	"BlockNum_ParcelNum_Date_Series.png"
	```
	Retrieve block number and parcel number by using split/explode. The block or parcel numbers can contain a letter, so create a filtering system as need. 

4. Send a query to parcels table in the database to see if the property information is already in database. If it is, retrieve the parcel_id. Otherwise, create a insert query to insert a property information and retreive the given parcel_id.

5. Create a image path variable with following format:
	```bash
	"images/properties/[image_path_name]"
	```

6. Send a query to image_paths table with full image path that was captured from 5) and parcel_id from 4).

7. Close the the database connection.