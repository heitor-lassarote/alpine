function counts = histcount(ordered_array)
    sz = numel(ordered_array);
    
    counts = zeros(1, sz);
    
    if (sz ~= 0)
      x = ordered_array(1);
      k = 1;
      
      for i = 1:sz
        if ordered_array(i) == x 
          counts(k) = counts(k) + 1;
        else
          x = ordered_array(i);
          k = k + 1;
          
          counts(k) = counts(k) + 1;
         end
      end
    end
    
    counts = nonzeros(counts)';
end