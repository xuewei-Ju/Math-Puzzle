def FirstFactorial(num)

    if num == 1 then 
        return 1
    else
        return num * FirstFactorial(num-1)
    end

end
   
# keep this function call here    
puts FirstFactorial(STDIN.gets)
