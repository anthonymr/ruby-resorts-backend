# 💎 Ruby Resorts API

### 🔐 AUTHENTICATION:

- **`POST` '/api/v1/authentication'** ✅
  - action: login
  - params: username and password
  - returns: jwt
- **`DELETE` '/api/v1/authentication'** ✅
  - action: logout
  - params: jwt
- **`GET` '/api/v1/authentication'** ✅
  - action: get logged user information
  - params: jwt

### 👥 USERS:

- **`POST` '/api/v1/users'** ✅
  - action: create new user
  - params: username, password, email
  - returns: jwt
- **`PATCH` '/api/v1/users'** ✅
cation: change current user password
  - params: password, jwt

### 🏨 HOTELS:

- **`GET` ‘/api/v1/hotels'** ✅
  - action: get all hotels
  - params: jwt
  - returns: array of hotels

### 🛌 ROOMS:

- **`GET` ‘/api/v1/rooms'** ✅
  - action: get all rooms
  - params: jwt
  - returns: array of rooms
- **`GET` ‘/api/v1/rooms/:id'** ✅
  - action: get room info
  - params: jwt
  - returns: a room
- **`POST` '/api/v1/rooms'** ✅
  - action: create a room
  - params: jwt, name, full_price, rating, description, reservation_price, image, reservation_fee
  - returns: new room
- **`DELETE` '/api/v1/rooms/:id'** ✅
  - action: delete room
  - params: jwt

### 🗓️ RESERVATIONS:

- **`GET` ‘/api/v1/reservations'** ✅
  - action: get all reservations
  - params: jwt
  - returns: array of reservations
- **`GET` ‘/api/v1/reservations/:id'** ✅
  - action: get reservation info
  - params: jwt
  - returns: a reservation
- **`POST` '/api/v1/reservations'** ✅
  - action: create a reservation
  - params: jwt, start_date, end_date, user_id, room_id, hotel_id (amount is not required)
  - returns: new room
- **`DELETE` '/api/v1/reservations/:id'** ✅
  - actions: delete a reservation
  - params: jwt
  - returns: deleted reservation