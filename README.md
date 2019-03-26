# aix2elastic
Repository for a series of scripts to monitor old (and new) AIX systems and send the data into an elasticsearch cluster

# Usage
Copy the files to /opt/monitoring/

Edit the es_post_nmon.pl (or equivalent) to add your elasticsearch cluster address and add auth information

Add the nmon2es (or equivalent) to crontab to run at whatever schedule you want to run the metrics

????

Profit
