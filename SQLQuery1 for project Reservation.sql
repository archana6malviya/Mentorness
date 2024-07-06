create database HotelReservation;


/* Q1.What is the total number of reservations in the dataset? */

Select COUNT(*) as TotalNoReservation
from Reservation;

/*Q2.Which meal plan is the most popular among guests? */
Select type_of_meal_plan, count(type_of_meal_plan) as MealPlan 
from reservation
group by type_of_meal_plan
order by count(type_of_meal_plan) desc;

/*3.What is the average price per room for reservations involving children? */
select round(AVG(avg_price_per_room),2) as AvgPricePerRoomWithChildren
from reservation
where no_of_children>0;

/*Q4. How many reservations were made for the year 20XX (replace XX with the desired year)? */
Select COUNT(*) as ReservationMadeIn2018
from reservation
where YEAR(arrival_date)=2018;

/*5.What is the most commonly booked room type?  */
Select count(*) as BookedRoomType, room_type_reserved from reservation
group by room_type_reserved
order by BookedRoomType desc;

/*6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? */
Select count(*) as ReservationOnWeekend
from reservation
where no_of_weekend_nights >0;

/*Q7.What is the highest and lowest lead time for reservations? */
Select max(lead_time) as HighestLeadTime, min(lead_time) as lowestLeadTime 
from reservation;

/*8. What is the most common market segment type for reservations?*/
Select COUNT(*) as CommonSegmentType, market_segment_type
from reservation
group by market_segment_type
order by market_segment_type desc;

/*9. How many reservations have a booking status of "Confirmed"? */
Select count(*) as BookingStatusConfirmed, booking_status
from reservation
where booking_status= 'Not_Canceled'
group by booking_status;

/*10. What is the total number of adults and children across all reservations?*/
Select sum(no_of_adults)as TotalNoOfAdult, sum(no_of_children) as TotalNoOfChildren
from reservation;



	/* 11. What is the average number of weekend nights for reservations involving children? */
	Select avg(no_of_weekend_nights) as AvgWeekendNightWithChildren
	from reservation
	where no_of_children>0;
	/*12. How many reservations were made in each month of the year? */
	Select  DATENAME (mm, CONCAT('1900', FORMAT(CAST(MONTH(arrival_date) AS INT), '00'), '01')) AS MonthNameas, count(*) as NoOfReservation
	from reservation
	
	group by datename(arrival_date);
	;
/*	13. What is the average number of nights (both weekend and weekday) spent by guests for each room type? */
	/*14. For reservations involving children, what is the most common room type, and what is the average price for that room type? */
	/*15. Find the market segment type that generates the highest average price per room.*/
