function enco = huffmanenco_( sig, dict )
%   HUFFMANENCO_ Encode an input signal using Huffman coding algorithm.
%   ----------------------------------------------------------------------- 
%   ENCO = HUFFMANENCO( SIG, DICT ) encodes the input signal (SIG) 
%   based on the given dictionary (DICT). The code dictionary must be 
%   generated using the HUFFMANDICT_ function. Each of the symbols appearing 
%   in the signal vector must be present in the code dictionary, DICT. 
%   The SIG input can be a numeric vector or a single-dimensional cell array 
%   containing alphanumeric values.
%    
%   Example of usage:
% 
%       % Create a Huffman code dictionary using HUFFMANDICT_.
%       alphabet = {'x' 'y' 'z' 'w' 'k'} % Alphabet vector                               
%       prob     = [0.1 0.6 0.05 0.15 0.10]  % Probability vector              
%       dict     = huffmandict(alphabet,prob)  
% 
%       Command Window (Output)
% 
%       symbol: {'x'  'y'  'z'  'w'  'k'}
%         code: {'110'  '0'  '111'  '100'  '101'}
%
%       % Example signal of valid letters.
%       sig = [ 'k'    'y'    'x'    'z'    'y'    'w'    'w' ]
%       % Encode the signal using the Huffman code dictionary.
%       sig_encoded = huffmanenco_(sig,dict)
%
%       Command Window (Output)
% 
%       10101101110100100
%   
%   See also HUFFMANDICT_.
%   References:
%   ----------------------------------------------------------------------- 
% 
%   --- Error checking ------------------------

    % Check if the input signal is a vector
    [m,n] = size(sig);
    if ( m ~= 1 && n ~= 1)
        error('The input signal must be a vector.');
    end
    
     % Check if the input dictionary is a struct
    if ( ~isstruct(dict) )
        error('The input dictionary must be a struct.');
    end

%   --- /Error checking ------------------------
%    
%   --- Main Function   ------------------------
% 
    
    % Encoding state.
    dictLength = length(dict.code);
    
    enco = ''; % Empty encoded signal (char).
    while( ~isempty(sig) ) % Loop for each signal value.
        tempcode = ''; % Empty signal value (char).
        for j = 1 : dictLength 
            % Search sequentially through the dictionary to
            % find the proper code for the given signal.
            if(sig(1) == dict.symbol(j)) % If there is a match.
                 tempcode = dict.code{j};
                 break;
             end
        end
        if isempty(tempcode) % Error checking.
            error('The Huffman dictionary provided does not have the codes for all the input signals.');
        end
        
        enco = strcat( enco,tempcode ); % Append the code to the encryption message.
        sig = sig(2:end); % Update the signal vector.
    end
%     
% --- /Main Function   ------------------------
end
% 
% % EOF -- huffmanenco_