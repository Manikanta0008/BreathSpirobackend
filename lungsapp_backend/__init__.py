import pymysql
pymysql.version_info = (2, 2, 4, 'final', 0)
pymysql.install_as_MySQLdb()

# Bypass MariaDB version check and RETURNING syntax (XAMPP has 10.4, Django wants 10.5+)
from django.db.backends.base.base import BaseDatabaseWrapper
from django.db.backends.mysql.base import DatabaseWrapper as MySQLDatabaseWrapper
from django.db.backends.mysql.features import DatabaseFeatures

# Disable version check
BaseDatabaseWrapper.check_database_version_supported = lambda self: None

# Force server version identification
@property
def patched_mysql_version(self):
    return (10, 4, 32)

@property
def patched_mysql_is_mariadb(self):
    return True

MySQLDatabaseWrapper.mysql_version = patched_mysql_version
MySQLDatabaseWrapper.mysql_is_mariadb = patched_mysql_is_mariadb

# Disable RETURNING syntax which requires MariaDB 10.5+
DatabaseFeatures.can_return_columns_from_insert = property(lambda self: False)
DatabaseFeatures.can_return_rows_from_bulk_insert = property(lambda self: False)
