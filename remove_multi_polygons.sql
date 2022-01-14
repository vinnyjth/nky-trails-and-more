CREATE TABLE campbell_geojson_parcels AS 
    SELECT owner_name_1, legal_description_1, pidn_1, loc_add, (ST_DUMP(wkb_geometry)).geom::geometry(Polygon,2891) AS geom FROM campbell_geojson;