function index = indexlocator(value,vec)
% This function finds the location of a value (value) inside a vector (vec).
% It returns the index number of the value.
 
for i = 1:length(vec)
    if vec(i) >= value
        % find the element in the list that is closer to the true value.
        % a is the distance between 333 and the larger value
        a = vec(i) - value;
        % b is the distance between 333 and the smaller value
        b = value - vec(i-1);
        if a <= b
            index = i;
        elseif a > b
            index = i - 1;
        end
        % exit loop
        break
    else
        index = vec(end);
    end
end
end
