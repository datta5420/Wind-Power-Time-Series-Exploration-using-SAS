
proc import datafile="/home/u64269614/datta 1 edited.csv"
    out=work.wind_raw
    dbms=csv
    replace;
    getnames=yes;
run;


data work.wind;
    set work.wind_raw;
    Power = "Average of Power"n;
    WindSpeed = "Average of windspeed_10m"n;
    Date = intnx('day', '02jan2017'd, _n_-1);  /* Assuming daily frequency */
    format Date date9.;
    keep Date Power WindSpeed;
run;


proc sort data=work.wind;
    by Date;
run;


proc arima data=work.wind;
    identify var=Power crosscorr=(WindSpeed) nlag=24;
    estimate input=(2$ (WindSpeed)) p=12 method=ml;
    forecast lead=30 id=Date interval=day out=work.arimax_forecast;
run;


proc print data=work.arimax_forecast (obs=15);
run;
