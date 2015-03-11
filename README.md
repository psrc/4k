#PSRC's 4k Trip Based Model#

##Background##
This code runs the region's trip based travel demand model. All the macros and control files are written in a combination of DOS batch files and Inro's Emme 4.1.5 software's macro language. The model is a traditional trip based model that:

	+ Imports estimates of trip ends from our in-house trip generation model.
	+ Estimates Trip Distribution based on a gravity model formulation for the following 13 trip purposes:
		- Home Based College
		- Home Based School
		- Home Based Other
		- Home Based Shopping
		- Home Based Work Income Level #1
		- Home Based Work Income Level #2
		- Home Based Work Income Level #3
		- Home Based Work Income Level #4
		- Non Home Based Work to Other
		- Non Home Based Other to Other
		- Light Trucks
		- Medium Trucks
		- Heavy Trucks
	+ Estimates Mode Choice based on multinomial Logit formulations for the following 8 trip purposes for SOV, HOV 2, HOV 3+, Transit (Walk and Auto Access for Work, Walk for others) and Walk and Bike trips:
		- Home Based College
		- Home Based School
		- Home Based Other
		- Home Based Work Income Level #1
		- Home Based Work Income Level #2
		- Home Based Work Income Level #3
		- Home Based Work Income Level #4
		- Non Home Based
	+ Estimates Time of Day Choice for 32 time slices that are aggregated to 5 time periods using generalized cost based delays for:
		- Home Based Shopping
		- Home Based Other
		- Home Based Work Income Level #1
		- Home Based Work Income Level #2
		- Home Based Work Income Level #3
		- Home Based Work Income Level #4
	+ Creates trip tables for 5 time periods for the following vehicle classes:
		- SOV NonWork
		- HOV 2
		- HOV 3+
		- Vanpool
		- HBW Income #1 SOV
		- HBW Income #2 SOV
		- HBW Income #4 SOV
		- HBW Income #1 SOV
		- Light Trucks
		- Medium Trucks
		- Heavy Trucks
		- Transit
		- Walk
		- Bike
	+ Runs Highway, Transit and Non-Motorized Assignments for various vehicle classes and times of day
	+ Generate matrices of travel information related to Time, Cost and Distance for all od-pairs in our 4000 zone travel model system for use in the Demand Model.

##Time Periods for Highway Assignments##
The time periods for Highway Assignments are are defined as:
 
	1. AM Peak Period	6:00 am - 9:00 am
	2. Midday Period	9:00 am - 3:00 pm
	3. PM Peak Period	3:00 pm - 6:00 pm
	4. Late Evening		6:00 pm - 10:00 pm
	5. Overnight		10:00 pm - 5:00 am

##Time Periods for Transit Assignments##
The PSRC 4k model currently runs Transit Assignments for the following two (2) time periods):

	1. AM Peak Period	6:00 am - 9:00 am
	2. Midday Period	9:00 am - 3:00 pm
	
Staff are currently working on the implementation of a PM Peak Period transit assignment that would be added to the model code when the networks are available. The model already creates the necessary trip tables for all time periods during the day.
