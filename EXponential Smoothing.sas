
proc import datafile="/home/u64269614/datta 1 edited.csv"
    out=work.wind_raw
    dbms=csv
    replace;
    getnames=yes;
run;


data work.wind;
    set work.wind_raw;
    Power = "Average of Power"n;           
    Date = _n_;                            
    keep Date Power;
run;


proc sort data=work.wind out=work.preProcessedData;
    by Date;
run;


proc esm data=work.preProcessedData back=12 lead=24 
    plot=(corr errors forecasts forecastsonly modelforecasts)
    outstat=work.outstat;
    id Date interval=day;
    forecast Power / alpha=0.05 model=simple transform=none;
run;


proc delete data=work.preProcessedData;
run;
