-- ³‚µ‚¢XV‚ÍCASEŽ®‚Å‘‚­
update salaries 
set
  salary = case 
    when salary >= 300000 
    then salary * 0.9 
    when salary >= 250000 
    and salary < 280000 
    then salary * 1.2 
    else salary 
    end; 



