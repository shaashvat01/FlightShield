/* Generated Code (IMPORT) */
/* Source File: USynthetic_Final_Dataset.csv */
/* Source Path: /home/u63739262/sasuser.v94/Updated */
/* Code generated on: 2/11/24, 8:58 AM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u63739262/sasuser.v94/Updated/USynthetic_Final_Dataset.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.SKY;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.SKY; RUN;


%web_open_table(WORK.IMPORT);

proc reg data=SKY;
   model TotalPrice = BasePrice DroneValue LiabilityPrice MedicalExpense MedicalExpensePrice NumberOfDrones PersonalAdInjuryPrice AdditionalInsuredPrice;
run;
