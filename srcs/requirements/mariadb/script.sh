#!/bin/bash

service mysql start


mysql_secure_installation

sleep 1
echo -ne 'n'

