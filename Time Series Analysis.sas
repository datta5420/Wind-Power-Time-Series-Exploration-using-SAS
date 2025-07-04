
proc import datafile="/home/u64269614/datta 1 edited.csv"
    out=work.wind_raw
    dbms=csv
    replace;
    getnames=yes;
run;


data work.wind;
    set work.wind_raw;
    Power = "Average of Power"n;
    Date = intnx('day', '02jan2017'd, _n_-1);
    format Date date9.;
    keep Date Power;
run;

proc timeseries data=work.wind
    out=work.ts_output
    plots=(series cycles corr pacf);
    id Date interval=day;
    var Power;
run;


proc arima data=work.wind;
    identify var=Power stationarity=(adf);
run;
