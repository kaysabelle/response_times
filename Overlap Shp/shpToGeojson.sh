#!/bin/bash

# what command to use with sql statement
# ogr2ogr -f "GeoJson" -t_srs EPSG:4326 -sql "SELECT * FROM 'ResponseAreasOverlap20150112' 
# WHERE "Name" LIKE 'Mesa%' AND 'ToBreak' = 8" MesaTo8.geojson ResponseAreasOverlap20150112.shp

# Initialize array breakPoints
breakPoints=(7 8 15 20 30)

for i in *.shp; do
	db=${i%.*}
	echo $db
done

while read line
do
    name=$line
    # takes out all whitespace in name for output file name
    output=`echo $name | tr -d ' '`

    # creates geojson containing all times of that station
    ogr2ogr -f "GeoJson" -t_srs EPSG:4326 \
    -sql "SELECT * FROM '${db}' WHERE "Name" LIKE '${name}%'" \
    ${output}.geojson ${db}.shp

    # for every break point, create that geojson of that station
	# for point in "${breakPoints[@]}"; do
	# 	# Create output file name
	# 	outputFile="${output}"To"${point}".geojson

	# 	# creates geojson of all different break points
	# 	ogr2ogr -f "GeoJson" -t_srs EPSG:4326 \
	# 	-sql "SELECT * FROM '${db}' WHERE "Name" LIKE '${name}%' AND 'ToBreak' = ${point}" \
	#     ${outputFile} ${db}.shp
	# done

done < FSList.txt
