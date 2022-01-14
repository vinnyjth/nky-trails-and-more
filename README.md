# Requirements

- `ogr2ogr`
- A PostgreSQL server running with PostGIS

# Dumping data

1. Enter the correct ArcGIS feature layer url in scrape_argis.rb. Then `ruby scrape_arcgis.rb`
2. Run `./parse.sh`. Make sure to enter a valid postgres URL first.
3. Run `remove_multi_polygons.sql` to flatten out all the multi-polygons
4. Run `map_to_4326.sql` to reproject into lat/long coordinates
5. Download Jason's trail KML and run `ogr2ogr -f PostgreSQL PG:"host=localhost user=vincent dbname=reser password= port=5432" ./Jason\ Official.kml -nln jason_lines` (with your database credentials of course)

You can now play around with NKY data and Jason's trails. A sample query is in `intersections.sql`.
