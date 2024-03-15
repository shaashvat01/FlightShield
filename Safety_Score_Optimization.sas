/* Generated Code (IMPORT) */
/* Source File: USynthetic_Safety_Score.xlsx */
/* Source Path: /home/u63739262/sasuser.v94/Updated */
/* Code generated on: 2/11/24, 8:31 AM */

%web_drop_table(WORK.IMPORT);


FILENAME REFFILE '/home/u63739262/sasuser.v94/Updated/USynthetic_Safety_Score.xlsx';

PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=WORK.SAFE;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.SAFE; RUN;


%web_open_table(WORK.IMPORT);

proc reg data=SAFE;
   model DiscountRate = BatteryPercentageLanding DistanceFromPilotM FlightDurationMin MaximumAltitudeFt NumberOfFlightsSubmitted SafetyScore;
   /* UseOfReturnToHome is a character variable and cannot be used in regression unless converted to numeric */
run;

proc reg data=SAFE;
   model SafetyScore = BatteryPercentageLanding DistanceFromPilotM FlightDurationMin MaximumAltitudeFt NumberOfFlightsSubmitted;
   /* UseOfReturnToHome is a character variable and cannot be used in regression unless converted to numeric */
run;