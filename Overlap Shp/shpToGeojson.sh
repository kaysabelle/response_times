#!/bin/bash

# ogr2ogr -f "GeoJson" -t_srs EPSG:4326 -sql "SELECT * FROM 'ResponseAreasOverlap20150112' 
# WHERE "Name" LIKE 'Mesa%' AND 'ToBreak' = 8" MesaTo8.geojson ResponseAreasOverlap20150112.shp

while read line
do
    name=$line
    echo "Text read from file - $name"

	for i in *.shp; do
		echo db=${i%.*}

	done

done < $1