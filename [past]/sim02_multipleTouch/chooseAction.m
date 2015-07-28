function [w] = chooseAction(w,p,a)

% obtain the probability distribution for actions
prob = softmax(a.q(w.curs+1,:), p.qscale);
% choose action based 
w.cura = sample(prob);

end

function [action] = sample(pr)
rv = rand(1);       % sample from a unifrom[0,1]
cp = cumsum(pr);
for i = 1:length(pr)    % choose an action 
    if rv < cp(i)
        action = i;
        return;
    end
end
end