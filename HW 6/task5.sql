-- 1
SELECT s.first_name, s.surname, b.bill_date, COUNT(*) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(*) >= 2;

-- 2
SELECT r.room_name, COUNT(t.table_no) AS num_tables
FROM restRest_table t
JOIN restRoom_management r ON t.room_name = r.room_name
WHERE t.no_of_seats > 6
GROUP BY r.room_name;

-- 3
SELECT rm.room_name, SUM(b.bill_total) AS total_bills
FROM restBill b
JOIN restRest_table t ON b.table_no = t.table_no
JOIN restRoom_management rm ON t.room_name = rm.room_name
GROUP BY rm.room_name;

-- 4
SELECT s.first_name, s.surname, SUM(b.bill_total) AS total_bills
FROM restStaff s
JOIN restBill b ON b.waiter_no = s.staff_no
JOIN restRoom_management rm ON s.staff_no = rm.headwaiter
GROUP BY s.first_name, s.surname
ORDER BY total_bills DESC;

-- 5
SELECT b.cust_name
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

-- 6
SELECT s.first_name, s.surname, b.bill_date, COUNT(*) AS num_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.first_name, s.surname, b.bill_date
HAVING COUNT(*) >= 3;

