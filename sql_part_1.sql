-- 1) Find out the selling cost for the packages developed in Pascal.
SELECT title
FROM software
WHERE dev_d = 'Pascal';

-- 2) Display the names and ages of programmers.
SELECT sysdate FROM dual;

SELECT pname, sysdate - dob
FROM programmer;

-- 3) Display the names of programmers who have done the DAP course
select pname
from studies
where course = 'DAP'

-- 4) What is the highest no of copies sold by a package
select MAX(sold)
from software;

-- 5) Display the names and date of birth of all programmers born in Jannuary.
select pname, dob
from programmer
where dob LIKE '%JAN%';

-- 6) Display the lowest course fee.
select MIN(cost)
from studies;

-- 7) How many programmers have done the PGDCA course.
select count(*)
from studies
where course = 'PGDCA';

-- 8) How much revenue has been earned through the sale of packages developed in C.
select SUM(scost * sold)
from software
where dev_d = 'C';

-- 9) Display the details of software developed by Ramesh.
select *
from software
where pname = 'Ramesh';

-- 10) How many programmers have studied at Sabhari.
select count(*)
from studies
where splace = 'Sabhari';

-- 11) Display the details of packages whose sales have been crossed 2000 mark.
select *
from software
where scost * sold > 2000;

-- 12) Find out the number of copies, which should be sold in-order to recover the development cost of each package.
select title, dcost/scost
from software;

-- 13) Display the details of the packages for which development cost have been recovered.
select *
from software
where sold * scost - dcost >= 0;

-- 14) What is the price of the costlier software developed in Basic.
select MAX(dcost)
from software
where dev_d = 'Basic';

-- 15) How many packages were developed in dbase.
select count(*)
from software
where dev_d = 'dbase';

-- 16) How many programmers studied in Pragathi.
select count(*)
from studies
where splace = 'Pragathi';

-- 17) How many programmers paid 5000-10000 for their course.
select count(*)
from studies
where cost BETWEEN 5000 AND 10000;

-- 18) What is the average course fee.
select AVG(cost)
from studies;

-- 19) Display the details of programmers knowing C.
select *
from programmer
where prof1 = 'C' or prof2 = 'C';

-- 20) How may programmers know either Cobol or Pascal.
select count(*)
from programmer
where (prof1 IN ('Cobol', 'Pascal')) OR (prof1 IN ('Cobol', 'Pascal'));

-- 21) How many programmers don’t know Pascal and C.
select count(*)
from programmer
where (prof1 NOT IN ('C', 'Pascal')) OR (prof1 NOT IN ('C', 'Pascal'));

-- 22) How old is the oldest male programmer.
select sysdate - dob
from programmer
where gender = 'M';

-- 23) What is the average age of female programmers.
select AVG(sysdate - dob)
from programmer
where gender 'F';

-- 24) Calculate the experience in years for each programmer and display along with their names in descending order.
select pname, sysdate - doj
from programmer
order by sysdate - doj;

-- 25) Who are the programmers who celebrate their birthdays in the current month.
select pname
from programmer
where substr(dob,4,3) = substr(sysdate,4,3);

-- 26) What are the languages known by male programmers.
select prof1
from programmer
where gender = 'M'
UNION
select prof2
from programmer
where gender = 'M';

-- 27) What is the average salary of programmers.
select AVG(salary)
from programmer;

-- 28) How many male programmers are there.
select count(*)
from programmer
where gender = 'M';

-- 29) How many people draw 2000-4000.
select count(*)
from programmer
where salary BETWEEN 2000 AND 4000;

-- 30) Display the details of programmers who don’t know Fortran, Cobol or Pascal.
select * 
from programmer
where (prof1 NOT IN ('Fortran', 'Cobol', 'Pascal')) OR (prof1 NOT IN ('Fortran', 'Cobol', 'Pascal'));

-- 31) In which month did most of the programmers join.
select substr(doj, 4, 3)
from programmer
group by substr(doj, 4, 3)
having count(*) = (
    select MAX(count(*))
    from programmer
    group by substr(doj, 4, 3)
);

-- 32) In which language are most of the programmers proficient.
select prof1, count(*)
from (
    select prof1 from programmer
    UNION ALL
    select prof2 from programmer
) b
group by prof1
having count(*) = (
    select MAX(count(*))
    from b
    group by b.prof1
);

-- 33) Who are the female programmers earning more than the highest paid highest paid male programmer.
select pname
from programmer
where gender = 'F' AND salary > (
    select MAX(salary)
    from programmer
    where gender = 'M'
);

-- 34) Which language have been stated as prof1 by most of the programmers.
select prof1, count(*)
from programmer
group by prof1
having count(*) = (
    select MAX(count(*))
    from programmer
    group by prof1
);

-- 35) Identify and include the keys (Primary Keys & Foreign Keys) in the tables.
