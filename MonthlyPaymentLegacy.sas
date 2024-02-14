/* Generated Code (IMPORT) */
/* Source File: UDrone_Insurance_Data.xlsx */
/* Source Path: /home/u63739262/sasuser.v94/Updated */
/* Code generated on: 2/11/24, 8:08 AM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u63739262/sasuser.v94/Updated/UDrone_Insurance_Data.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.INS;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.INS; RUN;

%web_open_table(WORK.IMPORT);

data INS2;
   set INS;
   Year_Rescaled = Year - 2017; /* Replace 2000 with the first year in your dataset if different */
run;

proc reg data=INS2;
   model AverageMonthlyPayment = Year_Rescaled AverageInsuredDroneValue PercentagePilotsInsuringDrone PercentageClientsInsuringEquipme;
run;

