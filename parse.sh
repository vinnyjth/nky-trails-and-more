cd kmz
for FILE in *.json; do
    ogr2ogr -f GeoJSON geo-$FILE $FILE
    # You'll need your own postgres credentials and DB here.
    ogr2ogr -f PostgreSQL PG:"host=localhost user=vincent dbname=reser password= port=5432" geo-$FILE -nln campbell_geojson    
done;