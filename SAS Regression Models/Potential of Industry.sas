/*This is a Regression of Already Obtain Mean Values Just to See What Aspect Has a Positive
or Negative Weightage (From Skywatch's Graphs)*/

/* Generated Code (IMPORT) */
/* Source File: Monthy Payment Predictor.xlsx */
/* Source Path: /home/u63739262/sasuser.v94/Hacklytics/Latest/Datasets */
/* Code generated on: 3/15/24, 6:32 AM */

%web_drop_table(WORK.IMPORT1);


FILENAME REFFILE '/home/u63739262/sasuser.v94/Hacklytics/Latest/Datasets/Monthy Payment Predictor.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.MONTHLY;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.MONTHLY; RUN;

%web_open_table(WORK.IMPORT1);

PROC REG DATA=MONTHLY;
Model AvgMonth = DroneVal InsEquip PerPilot Year;
run;
