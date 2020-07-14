clc;
disp('RSA Key Exchange Algorithm');
% P and Q do not get publicized. Only N gets pulicized

a1 = 2; 
b1 = 30;
p1 = primes(b1);
p1 = p1(p1 >= a1);
p_r_1 = p1(randperm(numel(p1),1));
fprintf('First random prime number generated is P: ');
disp(p_r_1)

a2 = 2; 
b2 = 20;
p2 = primes(b2);
p2 = p2(p2 >= a2);
p_r_2 = p2(randperm(numel(p2),1));
fprintf('Second random prime number generated is Q: ');
disp(p_r_2)

P = p_r_1;
A = isprime(P);
if A==1
    fprintf('P is a prime number\n');
else
    fprintf('P is not a prime number\n')
end


Q = p_r_2;
B = isprime(Q)
if B==1
    disp('Q is a prime number')
else
    disp('Q is not a prime number')
end
% Phi(N) should be kept secret
N = P*Q; % This number is used as a mod in my encryption key and my decryption key
fprintf('N is the product of P and Q (N=P*Q):' ,N);
disp(N);
phi(N) = (P-1)* (Q-1); % Only return the numbers that are coprime with N=14 (share no factors with N=14)
fprintf('Phi of N is:', phi(N));
disp(phi(N));
f = factor(phi(N));
fprintf('Prime factors of Phi(N) are:' ,f);
disp(f);
% Choose e for encryption - it should be 1 < e < phi(N) and should be
% coprime with N and phi(N)
e = input('Enter your publice key e for encryption: '); % i.e (e = 11)
disp(e);
n1 = input('Enter your value n for the messsage: ');
disp(n1)
m = input('Now enter your messsage to be encrypted: '); % m=2, 3
disp(m);

%Encrypting the message
x = power(m, e);
disp(x);
enc = mod(x, n1);
disp('Encrypted message is: ');
disp(enc);

%Decrypting the message

%d = input('Enter your private key d to decrypt the message: '); % i.e (d = 5)
i = randi([1 20]);
while(1)
    d = ((i*phi(N)) + 1)/ e;
    if (round(d) == d)
        break;
    end
    i = randi ([1 20]);
end
disp(d);
n2 = input('Enter your value N for the messsage: '); % calculated above us N=14
disp(n2);
M = power (enc, d);
dec = mod(M, n2);
disp('Decrypted message is: ');
disp(dec);