CarDealer contains the scraped data.

PBI contains the Power BI model which is in the very early stages.

Power Automate/Brandon Honda contains a walkthrough of the Power Automate Scrapers.

Powershell contains the powershell script to run the pyton file in task scheduler.

Python contains the Python file used to import the extracted data in the excel files to SQL.

SSMS contains all the SQL files used to create the tables and stored procedures to process the raw data. I did not include the stored procedures script, but each dealerships data processing script is run in it's own wrapper under the dealership name, then those wrappers are run under a main wrapper along with the additional cleaning steps and vehicle ID aggregation.

The project was started on 4/17 and I only get to work on it a few hours at most after work, so there is still a lot to be done. However, it demonstrates how quickly a data pipeline can be created with Power Automate, Python, SQL, and Power BI.
