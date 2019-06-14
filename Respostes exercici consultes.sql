/*Qüestió 1*/
SELECT count(flightID) as TOTAL 
FROM usairlineflights2.flights;

/*Qüestió 2*/
SELECT Origin, avg(ArrDelay) as prom_arribades, avg(DepDelay) as prom_sortides
FROM usairlineflights2.flights 
group by Origin;

/*Qüestió 3*/
SELECT origin, colYear, colMonth, avg(ArrDelay) as prom_arribades
FROM usairlineflights2.flights 
group by origin, colYear, colMonth
order by origin, colYear, colMonth;

/*Qüestió 4*/
SELECT usairports.city, colYear, colMonth, avg(ArrDelay) as prom_arribades
FROM usairlineflights2.flights
left join usairlineflights2.usairports on flights.origin=usairports.IATA
GROUP BY usairports.city, colYear,colMonth
order by usairports.city, colYear, colMonth;

/*Qüestió 5*/
SELECT UniqueCarrier, colYear, colMonth, avg(ArrDelay) as avgDelay, sum(Cancelled=1) as total_cancelled
FROM usairlineflights2.flights
where Cancelled =1 
group by UniqueCarrier, colYear, colMonth
order by total_cancelled desc, UniqueCarrier, colYear, colMonth;

/*Qüestió 6*/
SELECT TailNum, sum(Distance) as totalDistance 
FROM usairlineflights2.flights
where TailNum<>''
group by TailNum
order by totalDistance desc limit 10;

/*Qüestió 7*/
SELECT UniqueCarrier, avg(ArrDelay) as avgDelay
FROM usairlineflights2.flights
group by UniqueCarrier having avgDelay>=10
order by avgDelay desc;

