# FluidPirates-server

Liquid democracy API.

* **Delegate**: a person who is chosen or elected to vote or act for others

## Documentation

### Sessions

* `POST /api/sessions`
* `DELETE /api/sessions`

### Users

* `GET /api/users/current`
* `GET /api/users`
* `GET /api/users/:id`
* `PATCH /api/users/:id`
* `PUT /api/users/:id`
* `DELETE /api/users/:id`

### Groups

* `GET /api/groups/current`
* `GET /api/groups`
* `GET /api/groups/:id`
* `PATCH /api/groups/:id`
* `PUT /api/groups/:id`
* `DELETE /api/groups/:id`

### Invitations

* `POST /api/groups/:group_id/invitations/accept`
* `GET /api/groups/:group_id/invitations`
* `GET /api/groups/:group_id/invitations/:id`
* `PATCH /api/groups/:group_id/invitations/:id`
* `PUT /api/groups/:group_id/invitations/:id`
* `DELETE /api/groups/:group_id/invitations/:id`

### Memberships

* `GET /api/groups/:group_id/memberships`
* `GET /api/groups/:group_id/memberships/:id`
* `PATCH /api/groups/:group_id/memberships/:id`
* `PUT /api/groups/:group_id/memberships/:id`
* `DELETE /api/groups/:group_id/memberships/:id`

### Delegations 

* `GET /api/groups/:group_id/categories/:category_id/delegations`
* `GET /api/groups/:group_id/categories/:category_id/delegations/:id`
* `PATCH /api/groups/:group_id/categories/:category_id/delegations/:id`
* `PUT /api/groups/:group_id/categories/:category_id/delegations/:id`
* `DELETE /api/groups/:group_id/categories/:category_id/delegations/:id`

### Votes

* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:choice_id/votes/current`
* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:choice_id/votes`
* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:choice_id/votes/:id`
* `PATCH /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:choice_id/votes/:id`
* `PUT /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:choice_id/votes/:id`
* `DELETE /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:choice_id/votes/:id`

### Choices

* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices`
* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:id`
* `PATCH /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:id`
* `PUT /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:id`
* `DELETE /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:proposition_id/choices/:id`

### Propositions

* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions`
* `GET /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:id`
* `PATCH /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:id`
* `PUT /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:id`
* `DELETE /api/groups/:group_id/categories/:category_id/polls/:poll_id/propositions/:id`

### Polls

* `GET /api/groups/:group_id/categories/:category_id/polls`
* `GET /api/groups/:group_id/categories/:category_id/polls/:id`
* `PATCH /api/groups/:group_id/categories/:category_id/polls/:id`
* `PUT /api/groups/:group_id/categories/:category_id/polls/:id`
* `DELETE /api/groups/:group_id/categories/:category_id/polls/:id`

### Categories

* `GET /api/groups/:group_id/categories`
* `GET /api/groups/:group_id/categories/:id`
* `PATCH /api/groups/:group_id/categories/:id`
* `PUT /api/groups/:group_id/categories/:id`
* `DELETE /api/groups/:group_id/categories/:id`

