require 'socket'
#define the IP Port:
PORT = 4456

client = Socket.new(:INET, :STREAM)
client.connect(Socket.sockaddr_in(PORT, 'localhost'))

option = -1

while (option != '0')
    puts "Select the option (1, 2, 3 or 0):\n\n(1) Upload\n(2) List\n(3) Download\n(0) Logout\n"

    puts "What do you want to do?: "
    option = gets.chomp
    #send the selected option
    client.send(option, 0)

    #OPTION (1):The Client sends a file to the Server
    if(option == '1')
        puts "Enter the name of the file in your client repository that you want to upload(Ex: test.txt): "
        namefile = gets.chomp
        client.send(namefile, 0)

        File.open(namefile, 'rb') do |file|
            file.readlines.each do |data|
                client.send(data, 0)
            end
        end
        system "clear"
        puts "\n#{namefile} Sent!\n"

        client.close
        client = Socket.new(:INET, :STREAM)
        client.connect(Socket.sockaddr_in(PORT, 'localhost'))
        

    #OPTION (2): List the files available on the Server
    elsif(option == '2')
        system "clear"
        puts "\nFiles on the server:\n"
        while 1
            arch = client.recv(1000000)
            if arch.empty?
                break
            end
            puts(arch)
        end
        puts "\n"
        client.close
        client = Socket.new(:INET, :STREAM)
        client.connect(Socket.sockaddr_in(PORT, 'localhost'))

    #OPTION (3): The Server sends a file from the Client
    elsif(option == '3')

        puts "Enter the name of the file in your server repository that you want to receive(Ex: test.txt): "
        namefile = gets.chomp
        client.send(namefile, 0)
        File.open(namefile, 'wb') do |file|
            while 1
                data = client.recv(1000000)
                if data.empty?
                    break
                end
                file.write(data)
            end
        end
        system "clear"
        puts "#{namefile} Received!\n"

        client.close
        client = Socket.new(:INET, :STREAM)
        client.connect(Socket.sockaddr_in(PORT, 'localhost'))
        

    elsif(option == '0')
        system "clear"
        puts "Disconnected!!"
        client.close
    end
end
