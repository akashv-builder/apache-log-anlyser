#!/bin/bash
LOG_FOLDER=/var/log/http
ACCESS_LOG=$LOG_FOLDER/access_log
ERROR_LOG=$LOG_FOLDER/error_log

total_hits=wc -l $ACCESS_LOG

    first_hit=head -1 ACCESS_LOG
    first_hit_time=first_hit | awk '{print $4}'



    last_hit=tail -1 ACCESS_LOG
    last_hit_time=last_hit | awk '{print $4}'


   # hit_perminute=(last_hit-first_hit)/total_hits


    files_requested=ACCESS_LOG | awk '{print $7}'


    most_requested=awk '{print $7}' ACCESS_LOG | sort | uniq -c | sort -rn | head


    error=ACCESS_LOG | awk '{print $9}'