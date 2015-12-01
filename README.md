# FluidPirates-server

Fluid votes server

## Log of commands

```
rails g scaffold Group name
rails g scaffold Category name group:references
rails g scaffold User name email encrypted_password
rails g scaffold Membership user:references group:references
rails g scaffold Delegation delegee:references representative:references category:references
rails g scaffold Poll name user:references category:references
rails g scaffold Proposition name poll:references
rails g scaffold Choice name proposition:references
rails g scaffold Vote user:references choice:references
rake db:migrate
```
