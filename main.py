# contains main component of uor model
# sas basics

# /* Generated Code (IMPORT) /
# / Source File: dataset.csv /
# / Source Path: /home/u63739262/sasuser.v94 /
# / Code generated on: 2/10/24, 1:36 AM */

# %web_drop_table(WORK.IMPORT);


# FILENAME REFFILE '/home/u63739262/sasuser.v94/dataset.csv';

# PROC IMPORT DATAFILE=REFFILE
#     DBMS=CSV
#     OUT=WORK.CRYPTO;
#     GETNAMES=YES;
# RUN;

# PROC CONTENTS DATA=WORK.CRYPTO; RUN;

# %web_open_table(WORK.IMPORT);

# proc reg data=crypto;
# id crypto_name;
# *id forces SAS to put the value at the output record (what value of x was used for the confidence prediction);
# model marketCap = date high low open timestamp volume close;
# *clb cli clm;
# run;