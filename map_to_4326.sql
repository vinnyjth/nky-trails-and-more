SELECT AddGeometryColumn('campbell_geojson_parcels','geom4326',4326, 'POLYGON', 2)
UPDATE campbell_geojson_parcels SET geom4326 = ST_Transform(geom,4326);