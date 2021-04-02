#!/bin/bash

S3_PATH_PREFIX="s3://com.bestbeerjapan.b2bec."

### change from here.
S3_PATH=$S3_PATH_PREFIX"bbjdemo"
MYSQL_PASSWORD="ovex9ay4wX8uUTRd4QVfQUbJds2ti8"
### change until here.

BACKUP_PATH="/opt/app/db_backup/"
FILE_NAME="mysql_dump_`date +%Y%m%d`.sql.gz"
AWS_CONFIG_FILE="/home/ec2-user/.aws/config"

dir=$BACKUP_PATH; [ ! -e $dir ] && mkdir -p $dir
cd $BACKUP_PATH
/usr/local/bin/docker-compose -f /opt/app/ec-cube/docker-compose.yml exec mysql /bin/bash -c "mysqldump -u dbuser -povex9ay4wX8uUTRd4QVfQUbJds2ti8 eccubedb" | /usr/bin/gzip > $FILE_NAME

find $BACKUP_PATH -type f -name "mysql_dump_*.sql.gz"  -mtime +9 -daystart | xargs rm -rf

aws s3 sync $BACKUP_PATH $S3_PATH  --delete

