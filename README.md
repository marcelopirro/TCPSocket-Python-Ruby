--Overview
Given the two repositories Client and Server.
Both repositories have the program related to them, that is, in the Client repository we have the client program,
already in the Server repository we have the server program.

Programs recognize your repositories as their own repositories, i.e.
the Server will recognize the files present inside the Server repository, and will natively save in that repository
the Client will know the files present in the Client repository, and will save the files that they receive natively in that repository.

If you go inside the Client repository you will see two files: the Client program made in Ruby and a 'b.txt' file, used for testing,
the same thing will happen if you enter the Server repository, it will have the Server program in python and an 'a.txt' file, also used for testing.

---Running
First you must run the server and then the client, once connected the client will have 4 options:
    (1) Upload: upload a file to the server
    (2) List: List of files that are present in the server repository
    (3) Download: receive a file from the server
    (0) Logout: the client is disconnected from the server

--- Testing
To test the List command, the client must select option '2', then it will return a list containing
the files present on the server, in this case for example, './a.txt ./Server.py' would be returned because initially
the repository has these two files

To test the file sending function, the customer must select option '1'.
Next, the client will be asked to inform the file he wants to send, to send the present file 'b'
in the client repository, type 'b.txt'.
A message stating that the file has been uploaded will appear, and if it checks now the 'b.txt' file is present on the server.

To test the receipt of the files, the customer must select option '3', then he will be asked to
he inserts which file he wants to receive, remembering that the file needs to exist for the transfer to be motivated,
if you want to receive the file 'a' the client needs to type 'a.txt' in this way a message will be displayed and the file is now in the client's repository

To test the Logout option, the client needs to select option '4' and then it will be disconnected from the server
