rake db:seed:dump  MODEL=Admin
rake db:seed:dump  APPEND=true MODEL=Author
rake db:seed:dump  APPEND=true MODEL=Book
rake db:seed:dump  APPEND=true MODEL=BookAuthorMapping
rake db:seed:dump  APPEND=true MODEL=BookHoldRequest
rake db:seed:dump  APPEND=true MODEL=BookLibraryMapping
rake db:seed:dump  APPEND=true MODEL=BorrowingHistory
rake db:seed:dump  APPEND=true MODEL=Librarian
rake db:seed:dump  APPEND=true MODEL=Library
rake db:seed:dump  APPEND=true MODEL=StudentBookmark
rake db:seed:dump  APPEND=true MODEL=Student
rake db:seed:dump  APPEND=true MODEL=University


echo "Dumping done.!!"



