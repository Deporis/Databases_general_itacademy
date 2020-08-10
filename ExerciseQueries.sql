DROP SCHEMA IF EXISTS USAirlineFlights2;
CREATE DATABASE IF NOT EXISTS USAirlineFlights2;

CREATE TABLE USAirports (
	IATA			VARCHAR(32) NOT NULL PRIMARY KEY,
	Airport			VARCHAR(80),
	City			VARCHAR(32),
	State			VARCHAR(32),
	Country			VARCHAR(32),
	Latitude		FLOAT,
	Longitude		FLOAT);
    
CREATE TABLE Carriers (
	CarrierCode		VARCHAR(32) NOT NULL PRIMARY KEY,
	Description		VARCHAR(120)
);

CREATE TABLE IF NOT EXISTS Flights(
	flightID		INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	colYear			SMALLINT,
	colMonth		SMALLINT,
    DayOfMonths		SMALLINT,
	DayOfWeek		SMALLINT,
	DepTime			SMALLINT,
	CRSDepTime		SMALLINT,
	ArrTime			SMALLINT,
	CRSArrTime		SMALLINT,
	UniqueCarrier	VARCHAR(32),
	FlightNum		VARCHAR(32),
	TailNum			VARCHAR(32),
	ActualElapsedTime SMALLINT,
	CRSElapsedTime	SMALLINT,
	AirTime			SMALLINT,
	ArrDelay		SMALLINT,
	DepDelay		SMALLINT,
	Origin			VARCHAR(32),
	Dest			VARCHAR(32),
	Distance		SMALLINT,
	TaxiIn			SMALLINT,
	TaxiOut			SMALLINT,
	Cancelled		BOOLEAN,
	CancellationCode VARCHAR(32),
	Diverted		BOOLEAN,
    CarrierDelay	SMALLINT,
    WeatherDelay	SMALLINT,
    NASDelay		SMALLINT,
    SecurityDelay	SMALLINT,
    LateAircraftDelay SMALLINT,
    
    FOREIGN KEY (Dest)
		REFERENCES USAirports (IATA),
        
	FOREIGN KEY (Origin)
		REFERENCES USAirports (IATA),
        
	FOREIGN KEY (UniqueCarrier)
		REFERENCES Carriers (CarrierCode)
);

USE USAirlineFlights2;

-- Exercise 1
SELECT COUNT(*) FROM Flights;

-- Exercise 2
SELECT * FROM flights;
SELECT Origin, AVG(ArrDelay), AVG(DepDelay) FROM Flights GROUP BY Origin;

-- Exercise 3
SELECT Origin, colYear, colMonth, AVG(arrDelay) FROM flights 
GROUP BY Origin, colYear, colMonth ORDER BY Origin;

-- Exercise 4
SELECT city, colYear, ColMonth, AVG(arrDelay) FROM flights INNER JOIN USAirports ON Flights.Origin = USAirports.iata 
GROUP BY city, colYear, colMonth ORDER BY city, colYear;
SELECT * FROM flights WHERE Origin LIKE 'ABY';

-- Exercise 5
SELECT UniqueCarrier, colYear, colMonth, SUM(Cancelled) as Cancelled
FROM flights GROUP BY UniqueCarrier, colYear, colMonth ORDER BY Cancelled DESC;
-- Returned an error because the SELECT is changing the column name and the clause ORDER BY didn't know which column was 'Cancelled', that is why we need to mantain the name of the column

-- Exercise 6
SELECT TailNum, SUM(Distance) as totalDistance FROM flights GROUP BY TailNum ORDER BY totalDistance DESC LIMIT 10 OFFSET 1;

-- Exercise 7
SELECT UniqueCarrier, AVG(ArrDelay) as Delay FROM flights GROUP BY UniqueCarrier HAVING Delay > 10 ORDER BY Delay DESC;


-- WHERE is used to filter records before any groupings take place that is on single rows.
-- GROUP BY aggregates/ groups the rows and returns the summary for each group.
-- HAVING is used to filter values after they have been groups.