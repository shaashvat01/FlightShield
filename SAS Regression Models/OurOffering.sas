*Synthetic Database Based on Our Offering Regressed;

/* Generated Code (IMPORT) */
/* Source File: 3 Offering.csv */
/* Source Path: /home/u63739262/sasuser.v94/Hacklytics/Latest/Datasets */
/* Code generated on: 3/15/24, 10:05 AM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u63739262/sasuser.v94/Hacklytics/Latest/Datasets/3 Offering.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.OFFER2;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.OFFER2; RUN;


%web_open_table(WORK.IMPORT);

proc reg data=OFFER2;
    model TotalChargeAfterDiscount = HullDamageCharge LiabilityCharge NumberOfDronesCharge PersonalAdInjuryCoverageCharge MedicalExpenseCharge SafetyScore;
