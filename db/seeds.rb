Admin.create!([
  {email: "admin@system.com", encrypted_password: "$2a$11$xaLtehPsooLzOMbv8aM5Ve9PLg9Ycbnw66RXOza4HxUqlThcDg11G", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, name: "admin"}
])
Book.create!([
  {isbn: "1230456789", title: "DAA Cormen", language: "English", published: "2003", edition: "3", image: "", subject: "Computer Science, Discrete Mathematics, Computer Engineering", summary: "Introduction to Design and Analysis of Algorithms", special: false},
  {isbn: "9876543210", title: "OS Fundamentals", language: "English", published: "2006", edition: "4", image: "", subject: "Computer Science, Computer Engineering ", summary: "", special: false},
  {isbn: "9876541230", title: "Head First JAVA", language: "English", published: "2009", edition: "2", image: "", subject: "Computer Science, Information Technology and Science", summary: "Java Language Constructs", special: false},
  {isbn: "7896541230", title: "Head First Design Patterns", language: "English", published: "2007", edition: "4", image: "", subject: "Computer Science", summary: "Bible for Design Patterns", special: true},
  {isbn: "9638527410", title: "Engineering Software as a Service", language: "English", published: "2005", edition: "4", image: "", subject: "Computer Science, Informatio Technology", summary: "Armando Fox written introductory book for Engineering Softwares", special: false},
  {isbn: "3698521470", title: "Cloud Infrastructures and Networks", language: "English", published: "2011", edition: "2", image: "", subject: "Computer Science, Computer Networks", summary: "Comprehensive text for cloud data center networks", special: false},
  {isbn: "7415829630", title: "Distributed Algoritms", language: "English", published: "2001", edition: "2", image: "", subject: "Computer Science", summary: "Nancy Lynch written text for distributed algorithms", special: true},
  {isbn: "2582582580", title: "Agile Methodologies", language: "English", published: "2009", edition: "4", image: "", subject: "Product Management, Computer Softwares", summary: "Agile practices and methodologies", special: true}
])
BookLibraryMapping.create!([
  {book_id: 1, library_id: 1, quantity: 10},
  {book_id: 2, library_id: 2, quantity: 8},
  {book_id: 3, library_id: 1, quantity: 5},
  {book_id: 4, library_id: 1, quantity: 2},
  {book_id: 5, library_id: 3, quantity: 4},
  {book_id: 6, library_id: 5, quantity: 5},
  {book_id: 7, library_id: 6, quantity: 6},
  {book_id: 8, library_id: 5, quantity: 4}
])
Library.create!([
  {name: "Hunt Library", location: "Centennial Campus, Raleigh", max_days_blocking: 20, overdue_fines: 2, university_id: 1},
  {name: "Hill Library", location: "Main Campus, Raleigh", max_days_blocking: 20, overdue_fines: 2, university_id: 1},
  {name: "Davis Library", location: "Chapell Hill", max_days_blocking: 10, overdue_fines: 5, university_id: 2},
  {name: "Wilson Library", location: "Chapell Hill", max_days_blocking: 10, overdue_fines: 5, university_id: 2},
  {name: "J. Murrey Atkins Library", location: "Charlotte", max_days_blocking: 20, overdue_fines: 1, university_id: 4},
  {name: "Duke Kunshan Library", location: "Durham", max_days_blocking: 20, overdue_fines: 1, university_id: 3},
  {name: "ZSR Library", location: "Wake County", max_days_blocking: 20, overdue_fines: 1, university_id: 5}
])
University.create!([
  {name: "North Carolina State University", state: "North Carolina"},
  {name: "University of North Carolina - Chapell Hill", state: "North Carolina"},
  {name: "Duke University", state: "North Carolina"},
  {name: "University of North Carolina - Charlotte", state: "North Carolina"},
  {name: "Wake Forest University", state: "California"}
])
