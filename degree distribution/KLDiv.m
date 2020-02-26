function val = KLDiv(l1, l2)

l = length(l1);

% [idx1] = find(l1==0);
% [idx2] = find(l2==0);
% idx = [idx1 idx2];
% 
% l1(idx) = [];
% l2(idx) = [];

val = 0;

for i = 1:l
    if l1(i)==0 || l2(i) == 0
        tmp = l1(i)*log((l1(i)+eps)/(l2(i)+eps));
    else
        tmp = l1(i)*log(l1(i)/l2(i));
    end
    
    
    val = val + tmp;
    
end

end