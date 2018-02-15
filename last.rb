puts "Задайте путь к файлу"
file_path = gets.chomp


request = []

if File.exist?(file_path)
    f = File.new(file_path)
    content = f.readlines
    f.close
    
    #main array
    for item in content
        str = item.split

        str[1] = str[1].to_i
        str[2] = str[2].to_i
        request << str
    end
    


    request0 = []
    i = 0
    count = 0

    #new array
    while request.length > 0
        letter = request[0][3]

        request0[i] = request.select {|item| item.include?(letter)}
        request.reject! {|item| item.include?(letter)}
        i += 1
    end


    #for each array
    for itemarray in request0

        request = []

        for item in itemarray
            request.push([item[1], item[2]])
        end

        request = request.sort

        k = [request[0][0], request[0][0]]

        for item in request
            if ( item[0] === k[0] )
                k[1] = item[0] + item[1]
                count += 1
            elsif ( item[0] >= k[1] )
                k[0] = item[0]
                k[1] = item[0] + item[1]
                count += 1
            end
        end

    end


    puts "Ответ: #{count}"
    

else
    puts "Файл не найден"
end