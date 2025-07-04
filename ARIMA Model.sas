
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


proc sort data=work.wind;
    by Date;
run;


proc arima data=work.wind;
    identify var=Power nlag=24;
    estimate p=3 q=3 method=ml;
    forecast lead=30 id=Date interval=day out=work.forecast_out;
    outlier;
run;
