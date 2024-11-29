-- 1
SELECT DISTINCT b.cust_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
JOIN restRoom_management rm ON s.headwaiter = rm.headwaiter
WHERE b.bill_total > 450.00
AND s.first_name = 'Charles' AND s.surname = 'Watson';

-- 2
SELECT s.first_name, s.surname
FROM restStaff s
JOIN restRoom_management rm ON s.staff_no = rm.headwaiter
JOIN restBill b ON b.waiter_no = s.staff_no
WHERE b.cust_name = 'Nerida Smith' 
AND b.bill_date = 160111
AND rm.room_date = 160111;

-- 3
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (SELECT MIN(bill_total) FROM restBill);

-- 4
SELECT s.first_name, s.surname
FROM restStaff s
LEFT JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.bill_no IS NULL;

-- 4
SELECT s.first_name, s.surname
FROM restStaff s
LEFT JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.bill_no IS NULL;

