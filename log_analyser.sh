#!/bin/bash
LOG_FOLDER=/home/akash
ACCESS_LOG=$LOG_FOLDER/access_log.txt
ERROR_LOG=$LOG_FOLDER/error_log


total_hits(){
    wc -l $ACCESS_LOG
}

first_hit_info(){
    head -1 $ACCESS_LOG
   head -1 $ACCESS_LOG | awk '{print $4}'
}

last_hit_info(){
    tail -1 $ACCESS_LOG
    tail -1 $ACCESS_LOG | awk '{print $4}'
}

no_of_hit_perminute(){
  tail -1 $ACCESS_LOG | awk '{print $4}' - head -1 $ACCESS_LOG | awk '{print $4}'
}

all_files_requested(){
   awk '{print $7}' $ACCESS_LOG
}

most_requested_files(){
    awk '{print $7}' $ACCESS_LOG | sort | uniq -c | sort -rn | head
} 

error_codes(){
   awk '{print $9}' $ACCESS_LOG
}

#total_hits
#first_hit_info
#last_hit_info
#no_of_hit_perminute
#all_files_requested
#most_requested_files
error_codes