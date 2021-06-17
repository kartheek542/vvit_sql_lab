-- 1)	Who is the highest paid C programmer
select pname
from programmer
where salary IN (
    select MAX(salary)
    from (
        select prof1, salary
        from programmer
        where prof1 = 'C'
        UNION ALL
        select prof2, salary
        from programmer
        where prof2 = 'C'
    )
)

-- 2)	Who is the highest paid female Cobol programmer
select pname
from programmer
where gender = 'F' AND salary IN (
    select MAX(salary)
    from programmer
    where gender = 'F' AND (prof1 = 'Cobol' OR prof2 = 'Cobol')
)
-- 3)	Display the name of the highest paid programmers for each language (prof1)
select pname, t2.prof1, t2.sal
from programmer t1, (
    select prof1, MAX(salary) AS sal
    from programmer
    group by prof1
) t2
where t1.prof1 = t2.prof1 AND t1.salary = t2.sal;

-- 4)	Who is the least experienced programmer
select pname
from programmer
where sysdate - doj IN (
    select MIN(sysdate - doj) from programmer
);

-- 5)	Who is the most experienced male programmer knowing Pascal
select pname
from programmer
where sysdate - doj IN (
    select MAX(sysdate - doj) from programmer
    where gender = 'M' AND (prof1 = 'Pascal' or prof2 = 'Pascal')
);

-- 6)	Which language does only one programmer know
select prof1, count(*)
from programmer
group by prof1
having count(*) = 1;

-- 7)	Who is the above programmer
select pname
from programmer
where prof1 in (
    select prof1
    from programmer
    group by prof1
    having count(*) = 1;

-- 8)	Who is the youngest programmer knowing dbase
select pname
from programmer
where (prof1 = 'dbase' or prof2 = 'dbase') AND sysdate - dob = (select MIN(sysdate - dob)
    from programmer
    where prof1 = 'dbase' or prof2 = 'dbase'
);

-- 9)	Which female programmer earning more than 3000 doesn’t know C, C++, Oracle or dbase
select pname
from programmer
where gender = 'F' AND salary > 3000 AND (prof1 not in('C', 'C++', 'Oracle', 'dbase') OR prof2 not in('C', 'C++', 'Oracle', 'dbase'));

-- 10)	Which institute has the most number of students
select splace, count(*)
from studies
group by splace
having count(*) = (
    select MAX(count(*))
    from studies
    group by splace
);

-- 11)	Which course has been done by most of the students
select course, count(*)
from studies
group by course
having count(*) = (
    select MAX(count(*))
    from studies
    group by course
);

-- 12)	Display the names of the institute and course which has below average course fee
select splace, course
from studies
where cost < (
    select AVG(cost)
    from studies
);

-- 13)	Which is the costliest course
select course
from studies
where cost = (
    select MAX(cost)
    from studies
);

-- 14)	Which institute conducts the costliest course
select splace
from studies
where cost = (
    select MAX(cost)
    from studies
);

-- 15)	Which course has the below average number of students
select course, stu
from (
    select course, count(*) AS stu
    from studies
    group by course
)
where stu < (
    select AVG(count(*))
    from studies
    group by course
);

-- 16)	Which institute conducts the above courses

-- 17)	Display the number of courses whose fee are within the average fee
select count(*)
from studies
group by courses
having count(*) < (select AVG(count(*)) from studies group by course);

-- 18)	Which package has highest development cost
select title
from software
where dcost = (
    select MAX(dcost)
    from software
);

-- 19)	Which package has lowest development cost
select title
from software
where dcost = (
    select MIN(dcost)
    from software
);

-- 20)	Who developed the package that has sold least number of copies
select pname
from software
where sold = (
    select MIN(sold)
    from software
);

-- 21)	Which language was used to develop the package which has the highest sales amount
select dev_d
from software
where scost * sold = (
    select MAX(scost * sold)
    from software
);

-- 22)	Display the package that has the least difference between development and selling cost
select title
from software
where dcost - scost = (
    select MIN(dcost - scost)
    from software
);

-- 23)	Which is the costliest package developed in Pascal
select title
from software
where dev_d = 'Pascal' AND scost = (
    select MIN(scost) 
    from software
    where dev_d = 'Pascal'
);

-- 24)	Which language was used to develop the most number of packages
select dev_d, count(*)
from software
group by dev_d
having count(*) = (
    select MAX(count(*))
    from software
    group by dev_d
);

-- 25)	Which programmer has developed the highest number of packages
select pname, count(*)
from software
group by pname
having count(*) = (
    select MAX(count(*))
    from software
    group by pname
);

-- 26)	Who is the author of the costliest package
select pname
from software
where scost IN (
    select MAX(scost)
    from software
);

-- 27)	Display the names of the packages which have sold less than the average number of copies
select title
from software
where sold < (
    select AVG(sold)
    from software
);

-- 28)	Who are the authors of the packages who have recovered more than the double the development cost
select pname
from software
where scost * sold - dcost > 2 * dcost;

-- 29)	Display the programmers name and his cheapest package developed by him in each language
select a.pname, title
from software a, (
    select pname, MIN(scost) AS cost
    from software
    group by pname
) b
where a.pname = b.pname AND a.scost = b.cost;

-- 30)	Display the language used by each programmer to develop the highest selling and lowest selling package
select *
from (
    select dev_d AS highest
    from software
    where sold = (select MAX(sold) from software)
),
(
    select dev_d AS lowest
    from software
    where sold = (select MIN(sold) from software)
);

-- 31)	Who is the youngest male programmer born in 1965
select pname
from programmer
where dob = (
    select MAX(dob)
    from programmer
    where substr(dob, 8, 2) = '65'
);

-- 32)	Who is the oldest female programmer joined in 1982
select pname
from programmer
where doj = (
    select MIN(doj)
    from programmer
    where substr(doj, 8, 2) = '82'
);

-- 33)	In which year did most of the programmers join
select substr(doj, 8, 2), count(*)
from programmer
group by substr(doj, 8, 2)
having count(*) = (
    select MAX(count(*))
    from programmer
    group by substr(doj, 8, 2)
);

-- 34)	Display the details of those who will be completed 20 years of service this year
select *
from programmer
where (sysdate - doj)/365 >= 20;

-- 35)	Calculate the amount to be recovered for those packages whose development cost has not yet been recovered
select title, dcost - sold * scost
from software
where scost * sold - dcost < 0;

-- 36)	List the packages which have not been sold so far
select *
from software
where sold = 0;

-- 37)	Find out the cost of the software developed by Mary
select SUM(dcost)
from software
where pname = 'Mary';

-- 38)	Display the institute name from studies table without duplicates
select distinct splace
from studies;

-- 39)	How many different courses are mentioned in the studies table
select distinct course
from studies;

-- 40)	Display the names of the programmers whose names contain 2 occurrences of the letter ‘a’
select pname
from programmer
where pname LIKE '%a%a%';

-- 41)	Display the names of programmers whose names contains up to 5 characters
select pname
from programmer
where length(pname) <= 5;

-- 42)	How many female programmers knowing Cobol have more than 2 years experience
select count(*)
from programmer
where gender = 'F' and (sysdate - doj) / 365 > 2;

-- 43)	What is the length of the shortest name in the programmers table
select MIN(len(pname))
from programmer;

-- 44)	What is the average development cost of a package developed in Cobol
select AVG(dcost)
from software
where dev_d = 'Cobol';

-- 45)	Display the name, sex, dob (dd/ mmm/ yy  format), doj (dd/ mmm/ yy format) for all programmers without using the conversion function
select pname, gender, substr(dob, 1, 2) || '/' || substr(dob, 4,3) || '/' || substr(dob, 8, 2), substr(doj, 1, 2) || '/' || substr(doj, 4,3) || '/' || substr(doj, 8, 2)
from programmer;
-- 46)	Who are the programmers who were born on the last day of the month

-- 47)	What is the amount paid salaries of male programmers who don’t know Cobol
select SUM(salary)
from programmer
where gender = 'M' AND (prof1 not in ('Cobol') AND prof2 not in ('Cobol'))

-- 48)	Display the title, scost, dcost and difference between scost and dcost in descending order of difference
select title, scost, dcost, dcost - scost
from software
order by dcost - scost desc;

-- 49)	Display the names of the packages whose name contain more than one word
select title
from software
where LENGTH(title) - LENGTH(REPLACE(title, ' ', '')) + 1 > 1;

-- 50)	Display the name, job, dob, doj of those month of birth and month of joining are same
select pname, dob, doj
from programmer
where substr(dob, 4, 3) = substr(doj, 4, 3);

