# _Hair Salon_

#### _Web application that allows a Hair Salon owner to manage their stylists and clients. 12.9.16_

#### By _**Jonathan Thom**_

## Description

_Users can input new stylists, assign clients to stylists, and modify or delete stylists. They can also modify or delete individual clients._

## Setup/Installation Requirements

* _In the command line, run:_
```
$ postgres
$ psql
CREATE DATABASE hair_salon;
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);
CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```
* _Then, in another window:_
```
$ git clone https://github.com/JonathanWThom/Hair-Salon.git
$ cd salon
$ bundle
$ ruby app.rb
```

## Specifications
1. User can add and view a stylist page
  * Input example: "Homer Simpson"; Click("Homer Simpson")
  * Output: "This is Homer Simpson's Profile Page. Homer Simpson doesn't have any clients yet."

2. User can change a stylist's name
  * Input example: "Bart Simpson"; Click("Change Name")
  * Output: "This is Bart Simpson's Profile Page."

3. User can add a client to a stylist and view their profile
  * Input example: "Marge Simpson"; Click("Add Client"); Click("Marge Simpson")
  * Output: "This client's name is Marge Simpson."

4. User can change a client's name
  * Input example: "Lisa Simpson"; Click("Change Name")
  * Output: "This client's name is Lisa Simpson"

5. User can delete a client
  * Input example: Click("Delete 'Em")
  * Output: "This is Bart Simpson's Profile Page. Bart Simpson doesn't have any clients yet."

6. User can delete a stylist
  * Input example: Click("Get Outta My Sight!")
  * Output: "You don't have any stylists!"

## Support and contact details

_Contact Jonathan at: jonathan.thom1990@gmail.com_

## Technologies Used

_Ruby, Sinatra, PostgreSQL, HTML, Bootstrap_

### License

*MIT*

Copyright (c) 2016 **_Jonathan Thom_**
