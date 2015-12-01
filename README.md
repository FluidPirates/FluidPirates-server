# FluidPirates-server

Fluid votes server

## Log of commands

```
srails g scaffold Group name
srails g scaffold Category name group:references
srails g scaffold User name email encrypted_password
srails g scaffold Membership user:references group:references
srails g scaffold Delegation delegee:references representative:references category:references
srails g scaffold Poll name user:references category:references
srails g scaffold Proposition name poll:references
srails g scaffold Choice name proposition:references
srails g scaffold Vote user:references choice:references

srake db:migrate
```
