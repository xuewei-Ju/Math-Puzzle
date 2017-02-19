def AlphabetSoup(str): 

    # code goes here
    chars = list(str)
    kk = sorted(chars)
    return "".join(kk)
    
# keep this function call here  
print AlphabetSoup(raw_input())