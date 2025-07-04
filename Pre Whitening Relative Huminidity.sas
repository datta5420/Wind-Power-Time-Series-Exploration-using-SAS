proc import datafile="/home/u64269614/datta 1 edited.csv"
    out=work.wind_raw
    dbms=csv
    replace;
    getnames=yes;
run;

data work.wind;
    set work.wind_raw;
    Power = "Average of Power"n;
    Humidity = "Average of relativehumidity_2m"n;
    Date = intnx('day', '02jan2017'd, _n_-1);
    format Date date9.;
    keep Date Power Humidity;
run;

proc sort data=work.wind;
    by Date;
run;

proc arima data=work.wind;
    identify var=Humidity nlag=24;
    estimate p=4 q=3 method=cls;
    crosscorr var=Power;
run;
