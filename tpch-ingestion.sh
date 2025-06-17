cd /home/songfu/code/github/pinot/build/
for name in customer lineitem nation orders part partsupp region supplier; do
  bin/pinot-admin.sh AddTable -tableConfigFile /home/songfu/code/github/tpch-queries/tpch/$name/${name}_offline_table_config.json \
    -schemaFile /home/songfu/code/github/tpch-queries/tpch/$name/${name}_schema.json -exec
  bin/pinot-admin.sh LaunchDataIngestionJob -jobSpecFile /home/songfu/code/github/tpch-queries/tpch/$name/ingestionJobSpec.yaml
done
cd -
