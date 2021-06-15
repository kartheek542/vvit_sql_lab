-- 1)	Display the number of packages developed in each language
select dev_d, count(*)
from software
group by dev_d;

-- 2)	Display the number of packages developed by each person
select pname, count(*)
from software
group by pname;

-- 3)	Display the number of male and female programmers
select gender, count(*)
from programmer
group by gender;

-- 4)	Display the costliest and highest selling package developed in each language

-- 5)	Display the number of people born in each year
select substr(dob, 8, 2), count(*)
from programmer
group by substr(dob, 8, 2);

-- 6)	Display the number of people joined in each year
select substr(doj, 8, 2), count(*)
from programmer
group by substr(doj, 8, 2);

-- 7)	Display the number of people born in each month
select substr(dob, 4, 3) count(*)
from programmer
group by substr(dob, 4,3);

-- 8)	Display the number of people joined in each month
select substr(doj, 4, 3), count(*)
from programmer
group by substr(doj, 4, 3);

-- 9)	Display language wise count of prof1
select prof1, count(*)
from programmer
group by prof1;

-- 10)	Display language wise count of prof2
select prof2, count(*)
from programmer
group by prof2;

-- 11)	Display the number of people in each salary group
select salary, count(*)
from programmer
group by salary;

-- 12)	Display the number of people studied in each institute
select splace, count(*)
from studies
group by splace;

-- 13)	Display the number of people studied in each course
select course, count(*)
from studies
group by course;

-- 14)	Display the total development cost of packages developed in each language
select dev_d, sum(dcost)
from software
group by dev_d;

-- 15)	Display the selling cost of packages developed in each language
select dev_d, sum(scost)
from software
group by dev_d;

-- 16)	Display the costs of packages developed by each programmer language wise

-- 17)	Display the number of packages sold by each programmer
select pname, SUM(sold)
from software
group by pname;

-- 18)	Display the sales cost of the packages developed by each programmer
select pname, SUM(scost)
from software
group by pname;

-- 19)	Display the sales cost of the packages developed by each programmer language wise

-- 20)	Display the language name with average development cost, average selling cost and average price per copy
select dev_d, AVG(dcost), AVG(scost), AVG(scost/sold)
from software
group by dev_d;

-- 21)	Display the programmers name, costliest package, cheapest package developed by him/ her

-- 22)	Display each institute name with number of courses, average cost per course

-- 23)	Display each institute name with number of students
select splace, count(*)
from studies
group by splace;

-- 24)	Display the names of male and female programmers
select pname
from programmer
where gender = 'M' or gender = 'F';

-- 25)	Display the programmers name and their packages

-- 26)	Display the number of packages in each language except C and C++
select dev_d, count(*)
from software
where dev_d NOT IN('C', 'C++')
group by dev_d;

-- 27)	Display the number of packages in each language for which the development cost is less than 1000
select dev_d, count(*)
from software
where dcost < 1000
group by dev_d;

-- 28)	Display the average difference between SCOST and DCOST for each language
select dev_d, AVG(scost) - AVG(dcost)
from software
group by dev_d;

-- 29)	Display the total SCOST, DCOST and amount to be recovered for each programmer for those whose DCOST has not yet been recovered
select pname, SUM(sold * scost - dcost)
from software
group by pname
having SUM(sold * scost - dcost) < 0;

-- 30)	Display the highest, lowest and average salaries for those earning more than 2000
select MAX(salary), MIN(salary), AVG(salary)
from programmer
where salary > 2000;

-- 31)	Display the name of programmer(s) with highest salary
select pname
from programmer
where salary IN (
    select MAX(salary)
    from programmer)
);

-- 32)	Display the name of programmer(s) of second highest salary
select pname
from programmer
where salary IN (
    select MAX(salary)
    from programmer
    where salary NOT IN (select MAX(salary) from programmer)
)

