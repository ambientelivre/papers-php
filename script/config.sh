environment=${ENV:-development}
db_root=${MYSQL_ADMIN:-root}
db_user=${MYSQL_USER:-papers}
# FIXME should not hardcode password
db_passwd=${MYSQL_PASSWD:-papers}
db="papers_$environment"

# ALLOW local settings without messing with the VCS files
if test -r conf/db.sh; then
  . conf/db.sh
fi
