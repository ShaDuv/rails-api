# _Rails API_

#### By _**Shawna Duvall 23 August 2019**_

## Description

'Rails API' is an open RESTful API that provides information from a datatbase of states and parks The repo can be fond at: https://github.com/ShaDuv/rails-api.

## Setup/Installation Requirements

* _Clone the repo_
* _From the folder,`bundle install`_
* _Create the database locally using `rails db:create` in the terminal_
* _Run `rake db:migrate`_
* _Run `rake db:seed` to seed database_
* _Run `rails s` to start server_
* _Use Postman, or similar program, to make calls to localhost:3000 API_
* _Use preferred text editor to edit_

## Endpoints

### Parks
#### get parks by state
* Get all parks belonging to state_id provided
* Example: `get '/states/12/parks'`
```
/states/:state_id/parks
```
#### get a park by id
* Get a single park based on id belonging to state_id provided
* Example: `get '/states/12/parks/2'`
```
/states/:state_id/parks/:id
```
#### create a park belonging to state id
* Create a park based belonging to the state_id provided
* Params {name, address, city}
* Example: `post '/states/12/parks'`
```
/states/:state_id/parks
```
#### update a park by id
* Update a park belonging to the state_id provided
* Params {name, address, city}
* Example: `patch '/states/12/parks/2'`
```
/states/:state_id/parks/:id
```
#### delete a park by id
* Destroy a park based belonging to the state_id provided
* Example: `delete '/states/12/parks/2'`
```
/states/:state_id/parks/:id
```

### States
#### get all states
* Get all states
* Example: `get '/states'`
```
/states
```
#### get a state by id
* Get a single state based on id
* Example: `get '/states/12'`
```
/states/:state_id
```
#### create a state
* Create a state
* Params {name}
* Example: `post '/states'`
```
/states
```
#### update a state by id
* Update a state based id provided
* Params {name}
* Example: `patch '/states/12'`
```
/states/state_id
```
#### delete a state by id
* Destroy a state based on id provided
* Example: `delete '/states/12'`
```
/states/:state_id
```
## Known Bugs

  _No known bugs at this time._

## Support and contact details

  _Update/make suggestions/refactor this code as you like. Please contact Shawna Duvall at shawnabduvall@gmail.com with questions._

## Technologies Used

  * _Ruby_
  * _Ruby on Rails_
  * _ActiveRecord_
  * _SQL_
  * _PostgreSQL_
  * _Git_
  * _rspec_

### License

  *This software is licensed under the MIT license.*

  Copyright (c) 2019 **_Shawna Duvall_**
