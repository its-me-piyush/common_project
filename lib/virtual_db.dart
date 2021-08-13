//Following file will just hold a list of data. (10 hardcoded events)
//The data which we will be treating as a databse for the practise project
//All the data is virtual and for test purpose only.
//The event desu practise project for Internship
//Author=> Piyush, Devesh and Ritesh

final events = [
  //The event 1
  {
    'uid': 1,
    'title': 'The Youtube Seminar',
    'city': 'California',
    'ticketprice': 45.88,
    'time': '18:00 GMT',
    'image':
        'https://images.unsplash.com/photo-1554774853-aae0a22c8aa4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    'lat': 36.778259,
    'long': -119.417931,
    'description':
        'Lorem de ipsum Lorem de ipsum. Here is just a test dscription for the following event to showcase some good UI. The reader of the event description finds it intresting as he is yet reading till now. Come On pal!! Leave it. Its just a dummy text over here. Lorem de ipsum Lorem de ipsum.',
  },

  //The event 2
  {
    'uid': 2,
    'title': 'The Google Seminar',
    'city': 'London',
    'ticketprice': 75.66,
    'time': '02:00 GMT',
    'image':
        'https://images.unsplash.com/photo-1551808525-51a94da548ce?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=696&q=80',
    'lat': 51.507351,
    'long': -0.127758,
    'description':
        'Lorem de ipsum Lorem de ipsum. Here is just a test dscription for the following event to showcase some good UI. The reader of the event description finds it intresting as he is yet reading till now. Come On pal!! Leave it. Its just a dummy text over here. Lorem de ipsum Lorem de ipsum.',
  },

  //The event 3
  {
    'uid': 3,
    'title': 'The Flutter Workshop',
    'city': 'Sydney',
    'ticketprice': 175.96,
    'time': '06:00 GMT',
    'image':
        'https://images.unsplash.com/photo-1587620962725-abab7fe55159?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1189&q=80',
    'lat': -33.868820,
    'long': 151.209290,
    'description':
        'Lorem de ipsum Lorem de ipsum. Here is just a test dscription for the following event to showcase some good UI. The reader of the event description finds it intresting as he is yet reading till now. Come On pal!! Leave it. Its just a dummy text over here. Lorem de ipsum Lorem de ipsum.',
  },

  //The event 4
  {
    'uid': 4,
    'title': 'The Java Workshop',
    'city': 'Paris',
    'ticketprice': 45.96,
    'time': '08:00 GMT',
    'image':
        'https://images.unsplash.com/photo-1588239034647-25783cbfcfc1?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=400&q=80',
    'lat': 48.856613,
    'long': 2.352222,
    'description':
        'Lorem de ipsum Lorem de ipsum. Here is just a test dscription for the following event to showcase some good UI. The reader of the event description finds it intresting as he is yet reading till now. Come On pal!! Leave it. Its just a dummy text over here. Lorem de ipsum Lorem de ipsum.',
  },

  //The event 5
  {
    'uid': 5,
    'title': 'The React Workshop',
    'city': 'Vatican City',
    'ticketprice': 22.00,
    'time': '12:30 GMT',
    'image':
        'https://images.unsplash.com/photo-1536308037887-165852797016?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=712&q=80',
    'lat': 41.902916,
    'long': 12.453389,
    'description':
        'Lorem de ipsum Lorem de ipsum. Here is just a test dscription for the following event to showcase some good UI. The reader of the event description finds it intresting as he is yet reading till now. Come On pal!! Leave it. Its just a dummy text over here. Lorem de ipsum Lorem de ipsum.',
  },

  //The event 6
  {
    'uid': 6,
    'title': 'The Comedy Salza',
    'city': 'New York',
    'ticketprice': 235.99,
    'time': '11:00 GMT',
    'image':
        'https://images.unsplash.com/photo-1611956425642-d5a8169abd63?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=785&q=80',
    'lat': 40.7127281,
    'long': -74.0060152,
    'description':
        'Lorem de ipsum Lorem de ipsum. Here is just a test dscription for the following event to showcase some good UI. The reader of the event description finds it intresting as he is yet reading till now. Come On pal!! Leave it. Its just a dummy text over here. Lorem de ipsum Lorem de ipsum.',
  },

  //The event 7
  {
    'uid': 7,
    'title': 'The Dancing Nights',
    'city': 'New Jersey',
    'ticketprice': 25.95,
    'time': '19:00 GMT',
    'image':
        'https://images.unsplash.com/photo-1535525153412-5a42439a210d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    'lat': 40.0757384,
    'long': -74.4041622,
    'description':
        'Lorem de ipsum Lorem de ipsum. Here is just a test dscription for the following event to showcase some good UI. The reader of the event description finds it intresting as he is yet reading till now. Come On pal!! Leave it. Its just a dummy text over here. Lorem de ipsum Lorem de ipsum.',
  },

  //The event 8
  {
    'uid': 8,
    'title': 'The Voice Battle',
    'city': 'Boston',
    'ticketprice': 251.00,
    'time': '16:00 GMT',
    'image':
        'https://images.unsplash.com/photo-1527735095040-147bffb4cede?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=401&q=80',
    'lat': 42.3602534,
    'long': -71.0582912,
    'description':
        'Lorem de ipsum Lorem de ipsum. Here is just a test dscription for the following event to showcase some good UI. The reader of the event description finds it intresting as he is yet reading till now. Come On pal!! Leave it. Its just a dummy text over here. Lorem de ipsum Lorem de ipsum.',
  },

  //The event 9
  {
    'uid': 9,
    'title': 'The OldAge Marrathon',
    'city': 'Tokyo',
    'ticketprice': 51.00,
    'time': '12:00 GMT',
    'image':
        'https://images.unsplash.com/photo-1566053166065-79446ba9b79f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=614&q=80',
    'lat': 35.6828387,
    'long': 139.7594549,
    'description':
        'Lorem de ipsum Lorem de ipsum. Here is just a test dscription for the following event to showcase some good UI. The reader of the event description finds it intresting as he is yet reading till now. Come On pal!! Leave it. Its just a dummy text over here. Lorem de ipsum Lorem de ipsum.',
  },

  //The event 10
  {
    'uid': 10,
    'title': 'The Laser Show',
    'city': 'San Fransisco',
    'ticketprice': 51.00,
    'time': '10:00 GMT',
    'image':
        'https://images.unsplash.com/photo-1561907484-2cfeddf02318?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=667&q=80',
    'lat': 37.7790262,
    'long': -122.419906,
    'description':
        'Lorem de ipsum Lorem de ipsum. Here is just a test dscription for the following event to showcase some good UI. The reader of the event description finds it intresting as he is yet reading till now. Come On pal!! Leave it. Its just a dummy text over here. Lorem de ipsum Lorem de ipsum.',
  }
];
