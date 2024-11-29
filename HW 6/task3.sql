
    
    -- 1
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.cust_name = 'Tanya Singh

-- 2
SELECT rm.room_date
FROM restRoom_management rm
JOIN restStaff s ON rm.headwaiter = s.staff_no
WHERE s.first_name = 'Charles' AND s.surname = 'Watson'
AND rm.room_name = 'Green' 
AND rm.room_date BETWEEN 160201 AND 160229;

-- 3
SELECT s.first_name, s.surname
FROM restStaff s
JOIN restStaff z ON s.headwaiter = z.headwaiter
WHERE z.first_name = 'Zoe' AND z.surname = 'Ball' 
AND s.staff_no != z.staff_no;

-- 4
SELECT b.cust_name, b.bill_total, s.first_name || ' ' || s.surname AS waiter_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.table_no IN (
    SELECT table_no FROM restBill WHERE bill_no IN (00014, 00017)
) AND s.staff_no != b.waiter_no;

-- 6
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restRoom_management rm ON s.staff_no = rm.headwaiter
JOIN restBill b ON b.waiter_no = s.staff_no
WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
OR b.table_no IN (SELECT table_no FROM restRest_table WHERE room_name = 'Blue');

