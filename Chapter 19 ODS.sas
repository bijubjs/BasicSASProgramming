/* Chapter 19 */
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;';
TITLE "Chapter 19, Bijesh Mishra";
data instruction ;
INPUT program $ score @@;
DATALINES;
A 71 A 82 A 88 A 64 A 59 A 78 A 72
A 81 A 83 A 66 A 83 A 91 A 79 A 70
B 65 B 88 B 92 B 76 B 87 B 89 B 85
B 90 B 81 B 91 B 78 B 81 B 86 B 82
B 73 B 79
i
ODS TRACE ON;
PROC UNIVARIATE DATA = instruction CIBASIC ALPHA = 0.01 NORMAL;
CLASS program;
VAR score;
HISTOGRAM score / NORMAL;
TITLE 'Objective 19.1 - Tracing Objective 3 2';
RUN;
ODS TRACE OFF;
QUIT;

ODS LISTING;
ODS TRACE ON / LISTING;
PROC UNIVARIATE DATA= inst:ruction CIBASIC ALPHA=0.01 NORMAL;
CLASS program;
VAR score;
HISTOGRAM score / NORMAL;
TITLE 'Objective 19.1 - Tracing Objective 3.2';
RUN;
ODS TRACE OFF;

PROC UNIVARIATE DATA = instruction CIBASIC ALPHA = 0.01 NORMAL;
CLASS program;
VAR score;
HISTOGRAM score / NORMAL;
TITLE 'Objective 19.2 - SELECT Output';
ODS HTML SELECT TESTSFORNORMALITY HISTOGRAM;
RUN;

PROC UNIVARIATE DATA = instruction CIBASIC ALPHA = 0.01 NORMAL;
CLASS program;
VAR score;
HISTOGRAM score / NORMAL;
TITLE 'Objective 19.3 - EXCLUDE Output';
ODS HTML EXCLUDE EXTREMEOBS;
RUN;

ODS LISTING CLOSE;
PROC UNIVARIATE DATA = instruction CIBASIC ALPHA = 0.01 NORMAL;
CLASS program;
VAR score;
HISTOGRAM score / NORMAL;
ODS OUTPUT MOMENTS = basicstat TESTFORLOCATION = meantests;
TITLE "Objective 19.4";

PROC PRINT DATA = Basicstat;
TITLE2 "The Recovered Moments Table";
PROC PRINT DATA = meantests LABEL;
TITLE2 "The Recovered Tests for Moment Table";
RUN; QUIT;

PROC UNIVARIATE DATA = instruction CIBASIC ALPHA = 0.01 NORMAL;
CLASS program;
VAR score;
HISTOGRAM score / NORMAL;
ODS HTML SELECT NONE; *or ODS HTML EXCLUDE ALL;
ODS OUTPUT BASICINTERVALS = ci99;
TITLE 'Objective 19.5';
RUN;
PROC PRINT DATA = ci99;
TITLE2 '99% CIs for Mean, Std Dev, and Variance';
ODS HTML SELECT ALL;
RUN;

DATA Ci99_mean ci99_sd ci99_var;
SET Ci99;
IF PARAMETER = "Mean" THEN OUTPUT ci99_mean;
IF PARAMETER = "Std Deviation" THEN OUTPUT ci99_sd;
IF PARAMETER = "Variance" THEN OUTPUT ci99_var;
RUN; QUIT;

LIBNAME chl9 "G:\CGoad" ;
ODS PDF FILE = 'G:\CGoad\Obj19_6.pdf';
PROC UNIVARIATE DATA = instructiion CIBASIC ALPHA = 0.01 NORMAL;
CLASS program;
VAR score;
HISTOGRAM score / NORMAL;
ODS HTML SELECT ALL;
ODS PDF SELECT TESTSFORNORMALITY HISTOGRAM;
ODS OUTPUT MOMENTS = ch19.basicstats TESTSF0RL0CATI0N = chl9.meantests;
TITLE 'Objective 19.6' ;
RUN;
ODS PDF CLOSE;
PROC PRINT DATA = chl9.basicstats;
TITLE2 'The Recovered Momerits Table' ;
PROC PRINT DATA=chl9.meantests LABEL;
TITLE2 'The Recovered Tests for Location Table' ;
RUN;
QUIT;