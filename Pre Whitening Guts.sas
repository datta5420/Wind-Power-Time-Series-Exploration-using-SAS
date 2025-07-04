proc import datafile="/home/u64269614/datta 1 edited.csv"
    out=work.wind_raw
    dbms=csv
    replace;
    getnames=yes;
run;

data work.wind;
    set work.wind_raw;
    Power = "Average of Power"n;
    Gusts = "Average of windgusts_10m"n;
    Date = intnx('day', '02jan2017'd, _n_-1);
    format Date date9.;
    keep Date Power Gusts;
run;

proc sort data=work.wind;
    by Date;
run;

proc arima data=work.wind;
    identify var=Gusts nlag=24;
    estimate p=3 q=1 method=cls;
    crosscorr var=Power;
run;
