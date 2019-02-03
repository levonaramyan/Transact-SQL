------------- Transact-SQL --------------
-----------------------------------------
--- Lesson 4 ---- Scalar Functions ------
-----------------------------------------

-----------------------------------------
----- Scalar functions return values ----
-----------------------------------------

-- 4. Math functions
SELECT SQRT(625), SQUARE(25), POWER(4, 2),
		FLOOR (199.1), -- leaving the outlier after point
		FLOOR (199.9), -- leaving the outlier after point
		ROUND (199.4, 0), -- rounding down to integer
		ROUND (199.8, 0), -- rounding up to integer
		ROUND (199.6789, 2), -- rounding to two digits after the point
		ROUND (199.6789, -1), -- rounding to tens
		ROUND (199.6789, 2, 1), -- if the third parameter is 0, then rounding, if not just trims out the rest
		PI() -- returns the value of pi
