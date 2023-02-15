#!/bin/bash

TPCDS_HOME=

HIVE_CMD=

test_case=$1
scale_factor=$2

if [[ ! -d $TPCDS_HOME/$test_case ]]; then
  echo "Not Found the '$test_case'"
  exit 1
fi


#for sql_case in $(ls $TPCDS_HOME/$test_case/ | grep ".sql")
for ((i = 1; i <= 99 ; i++))
do
  sql_case="q$i.sql"
  echo "executing the '$sql_case'"
  $HIVE_CMD -f $TPCDS_HOME/$test_case/$sql_case --database tpcds_text_$scale_factor 2>&1 | grep "Time taken: "
done