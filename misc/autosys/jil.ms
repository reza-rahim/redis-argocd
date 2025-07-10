```
insert_job: sample_job
job_type: c
command: /opt/scripts/run_my_job.sh
machine: myserver123
owner: myuser@myserver123
permission: gx,ge,wx,we
date_conditions: 1
days_of_week: mo,tu,we,th,fr
start_times: "08:00"
description: "Sample job that runs a script every weekday at 8 AM"
std_out_file: /opt/logs/sample_job.out
std_err_file: /opt/logs/sample_job.err
alarm_if_fail: 1
```
