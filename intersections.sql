SELECT   p.owner_name_1,
         l.NAME,
         Sum(St_length(St_intersection(p.geom4326, l.wkb_geometry)::geography))
FROM     campbell_geojson_parcels p,
         jason_lines l
WHERE    St_intersects(l.wkb_geometry, p.geom4326)
GROUP BY (p.owner_name_1, l.NAME);