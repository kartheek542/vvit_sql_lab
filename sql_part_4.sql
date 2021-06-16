-- 1)	Display the details of those who are drawing the same salary
-- 2)	Display the details of the software developed by the male programmers earning more than 3000
select *
from programmer p, software s
where p.salary > 3000 AND p.pname = s.pname;

-- 3)	Display the details of the packages developed in Pascal by female programmers
select *
from programmer p, software s
where p.gender = 'F' AND s.dev_d = 'Pascal' AND p.pname = s.pname;

-- 4)	Display the details of software developed in C by female programmers of Pragathi
select *
from programmer p, studies s, software so
where p.gender = 'F' AND so.dev_d = 'C' AND s.splace = 'Pragathi' AND p.pname = s.pname AND s.pname = so.pname;

-- 5)	Display the number of packages, number of copies sold and sales value of each programmer institute wise

-- 6)	Display the details of the software developed in dbase by male programmers who being to the institute in which most number of programmer studied
select *
from programmer p, studies s, software so
where p.gender = 'M' AND so.dev_d = 'Dbase' AND s.splace in (
    select splace 
    from studies 
    group by splace 
    having count(*) = (
        select MAX(count(*)) 
        from studies 
        group by splace
    )
) AND p.pname = s.pname AND s.pname = so.pname;

-- 7)	Display the details of the software developed by male programmers who salary less 2500 and female programmers whose salary greater than 2500
select *
from programmer p, software s
where ((p.gender = 'M' AND p.salary <2500) OR (p.gender = 'F' AND p.salary > 2500)) AND p.pname = s.pname;

-- 8)	Display the details of the software that was developed in the language that is not programmers first proficiency 
select *
from programmer p, software s
where p.pname = s.pname AND p.prof2 = s.dev_d;

-- 9)	Display the details of the software that was developed in the language that is neither the first nor the second proficiency of the programmer
select *
from programmer p, software s
where p.pname = s.pname AND p.prof1 != s.dev_d AND p.prof2 != s.dev_d;

-- 10)	Display the details of the software that was developed by the male students of Sabhari
select *
from programmer p, software s, studies c
where p.pname = s.pname AND s.pname = c.pname AND p.gender = 'M' AND c.splace = 'Sabhari';

-- 11)	Display the names of programmers who have not developed any package
select pname from programmer
MINUS
select pname from software;

-- 12)	What is the total cost of the software developed by the programmer in apple
select SUM(s.dcost)
from software s, studies c
where s.pname = c.pname AND c.splace = 'Apple';

