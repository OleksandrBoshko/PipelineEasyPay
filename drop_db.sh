#!/bin/bash

sudo service postgresql reload
sudo -u postgres psql postgres -c 'DROP DATABASE easypay_db;'
