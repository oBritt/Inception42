#!/bin/bash

set -e

mariadb-install-db
exec mariadb --user=mysql