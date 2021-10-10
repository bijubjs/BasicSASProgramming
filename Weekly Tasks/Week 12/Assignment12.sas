/* Assignment 12 */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;'; 
* ODS LISTING;
*PROC REGISTRY LIST STARTAT = "COLORNAMES";
* RUN;
TITLE "Bijesh Mishra, Assignment 11 ";
LIBNAME A12 "C:\Users\bmishra\Dropbox\OSU\PhD\Fall 2021\STAT5193 SAS R\SAS\Data";
*DATA MESO1_4; 
*SET A12.MESONET1_4;
* Obs DAY RAIN_IN STNPRESSUR SOLAR_MJ_m2 SODSOIL BARESOIL Month MAXTEMP MINTEMP MAXHUMID MINHUMID WINDDIR SPEEDAVG;
PROC SGPLOT DATA = A12.MESONET1_4;
TITLE "Bijesh Mishra, Assignment 11, Problem 1(a) ";
SCATTER Y = MaxTemp X = SodSoil / GROUP = Month;
RUN; QUIT;

TITLE "Bijesh Mishra, Assignment 11, Problem 1(b) ";
PROC SGPLOT DATA = A12.MESONET1_4;
SCATTER Y = MaxTemp X = SodSoil / GROUP = Month MARKERCHAR = Month;
RUN; QUIT;

TITLE "Bijesh Mishra, Assignment 11, Problem 1(c) ";
PROC SGPANEL DATA = A12.MESONET1_4;
PANELBY Month / LAYOUT = ROWLATTICE;
SCATTER Y = MaxTemp X = SodSoil / GROUP = Month MARKERCHAR = Month;
RUN; QUIT;

TITLE "Bijesh Mishra, Assignment 11, Problem 2 ";
PROC SGPANEL DATA = A12.MESONET1_4;
PANELBY Month;
WHERE Month = "Jan" | Month = "Feb";
SERIES Y = MaxTemp X = Day/ LINEATTRS = (COLOR = Red);
SCATTER Y = MaxTemp X = Day/ MARKERATTRS = (COLOR = Red SYMBOL = DiamondFilled);
SERIES Y = SodSoil X = Day/ LINEATTRS = (COLOR = Black);
SCATTER Y = SodSoil X = Day / MARKERATTRS = (COLOR = Black SYMBOL = SquareFilled);
RUN; QUIT;

TITLE "Bijesh Mishra, Assignment 11, Problem 3 ";
*PROC MEANS DATA = A12.MESONET1_4 MIN MAX SUM MEAN;
*CLASS MONTH;
*VAR RAIN_IN;
PROC SGPLOT DATA = A12.MESONET1_4;
HBAR Month / RESPONSE = RAIN_IN STAT = SUM TRANSPARENCY = 0.50 FILLATTRS = (COLOR = Blue);
RUN; QUIT;

TITLE "Bijesh Mishra, Assignment 11, Problem 4 ";
PROC SGPANEL DATA = A12.MESONET1_4;
PANELBY Month;
HISTOGRAM SODSOIL/ FILLATTRS = (COLOR = Green) SCALE = Percent;
HISTOGRAM BARESOIL /FILLATTRS = (COLOR = Orange)TRANSPARENCY = 0.50 SCALE = Percent;
RUN; QUIT;
