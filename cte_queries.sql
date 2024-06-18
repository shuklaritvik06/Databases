-- Define a Common Table Expression (CTE) named TotalHours
WITH TotalHours AS (
    -- Select member ID, first name, surname, and total rounded hours
    SELECT 
        m.memid, -- Member ID
        m.firstname, -- Member's first name
        m.surname, -- Member's surname
        -- Calculate the total hours, rounded to the nearest 10
        ROUND(SUM(b.slots) / 2.0, -1) AS rounded_hours
    FROM 
        cd.bookings b -- Bookings table alias as b
    -- Join with members table on memid
    JOIN 
        cd.members m ON b.memid = m.memid
    -- Group by member ID, first name, and surname to aggregate the data
    GROUP BY 
        m.memid, m.firstname, m.surname
)

-- Select from the CTE TotalHours
SELECT 
    firstname, -- Member's first name
    surname, -- Member's surname
    rounded_hours AS hours, -- Rounded total hours, aliased as hours
    -- Rank members based on rounded hours in descending order
    RANK() OVER (ORDER BY rounded_hours DESC) AS rank
FROM 
    TotalHours
-- Order the final results by rank, then surname, and then first name
ORDER BY 
    rank, surname, firstname;
