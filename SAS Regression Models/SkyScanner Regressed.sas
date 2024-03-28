* Mined Combinations from Skyscanner's Quotation Website to Obtain Important Aspects;

/* Generated Code (IMPORT) */
/* Source File: 2 Synthetic Skyscanner.csv */
/* Source Path: /home/u63739262/sasuser.v94/Hacklytics/Latest/Datasets */
/* Code generated on: 3/15/24, 8:57 AM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u63739262/sasuser.v94/Hacklytics/Latest/Datasets/2 Synthetic Skyscanner.csv';

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
