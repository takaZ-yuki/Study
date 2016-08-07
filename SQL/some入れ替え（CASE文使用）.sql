update some 
set
  p_key = case 
    when p_key = 'a' 
    then 'b' 
    when p_key = 'b' 
    then 'a' 
    else p_key 
    end 
where
  p_key in ('a', 'b'); 



