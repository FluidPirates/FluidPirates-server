# FluidPirates-server

Liquid democracy API.

* **Delegate**: a person who is chosen or elected to vote or act for others

## Database schema

The [db/schema.rb](db/schema.rb) contains the list of all the tables and their attributes.

## Documentation

Most methods require a `token` params that can be acquired by registering (`POST /api/users`) or logging in (`POST /api/sessions`).

### Sessions

* `POST /api/sessions`
  * Required: `session[email]`, `session[password]`
  * Returns `token`
* `DELETE /api/sessions`

### Users

* `GET /api/users/current`
* `GET /api/users`
* `GET /api/users/:id`
* `POST /api/users`
  * Required: `user[name]`, `user[email]`, `user[password]`
  * Returns `token`
* `PATCH /api/users/:id`
* `DELETE /api/users/:id`

### Groups

* `GET /api/groups/current`
* `GET /api/groups`
* `GET /api/groups/:id`
* `POST /api/groups`
  * Required: `group[name]`
  * Optional: `group[description]`
* `PATCH /api/groups/:id`
* `DELETE /api/groups/:id`

### Invitations

* `POST /api/groups/:group_id/invitations/accept`
  * Required: invitation[key]
* `GET /api/groups/:group_id/invitations`
* `GET /api/groups/:group_id/invitations/:id`
* `POST /api/groups/:group_id/invitations`
  * Required: invitation[email]
* `PATCH /api/groups/:group_id/invitations/:id`
* `DELETE /api/groups/:group_id/invitations/:id`

### Memberships

* `GET /api/groups/:group_id/memberships`
* `GET /api/groups/:group_id/memberships/:id`
* `POST /api/groups/:group_id/memberships`
  * Required: membership[user_id]
  * Optional: membership[role] 
    * member or admin (default: member)
* `PATCH /api/groups/:group_id/memberships/:id`
* `DELETE /api/groups/:group_id/memberships/:id`

### Delegations 

* `GET /api/groups/:group_id/categories/:category_id/delegations`
* `GET /api/groups/:group_id/categories/:category_id/delegations/:id`
* `POST /api/groups/:group_id/categories/:category_id/delegations`
  * Required: delegation[delegatee_id]
* `PATCH /api/groups/:group_id/categories/:category_id/delegations/:id`
* `DELETE /api/groups/:group_id/categories/:category_id/delegations/:id`

### Votes

* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:choice_id/votes/current`
* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:choice_id/votes`
* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:choice_id/votes/:id`
* `POST /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:choice_id/votes`
* `PATCH /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:choice_id/votes/:id`
* `DELETE /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:choice_id/votes/:id`

### Choices

* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices`
* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:id`
* `POST /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices`
  * Required: choice[name]
* `PATCH /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:id`
* `DELETE /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:id`

### Propositions

* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions`
* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:id`
* `POST /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions`
  * Required: proposition[name]
  * Optional: proposition[description]
* `PATCH /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:id`
* `DELETE /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:id`

### Polls

* `GET /api/groups/:group_id/categories/:category_id/polls`
* `GET /api/groups/:group_id/categories/:category_id/polls/:id`
* `POST /api/groups/:group_id/categories/:category_id/polls`
  * Required: poll[name]
  * Optional: poll[description]
* `PATCH /api/groups/:group_id/categories/:category_id/polls/:id`
* `DELETE /api/groups/:group_id/categories/:category_id/polls/:id`

### Categories

* `GET /api/groups/:group_id/categories`
* `GET /api/groups/:group_id/categories/:id`
* `POST /api/groups/:group_id/categories`
  * Required: category[name]
  * Optional: category[description]
* `PATCH /api/groups/:group_id/categories/:id`
* `DELETE /api/groups/:group_id/categories/:id`

