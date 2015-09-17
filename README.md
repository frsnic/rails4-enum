# rails4 enum

#### app/models/user.rb
```ruby
class User < ActiveRecord::Base
  enum role: [:admin, :manager, :client]
end
```
***
#### db/seeds.rb
```ruby
User.create(name: 'Admin',   role: User.roles[:admin])
User.create(name: 'Manager', role: User.roles[:manager])
User.create(name: 'Client',  role: User.roles[:client])
```
***
#### User.all.pluck(:name, :role)
```sql
User Load (0.1ms)  SELECT "users"."name", "users"."role" FROM "users"
 => [["Admin", 0], ["Manager", 1], ["Client", 2]]
```
***
#### User.last.role
```sql
User Load (0.1ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" DESC LIMIT 1
 => "client"
```
***
#### User.first.admin?
```sql
User Load (0.2ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" ASC LIMIT 1
 => true
```
***
#### User.first.client?
```sql
User Load (0.2ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" ASC LIMIT 1
 => false
```
***
#### User.where(role: User.roles[:client]) 
##### (P.S It's roles, not role)
```sql
User Load (0.1ms)  SELECT "users".* FROM "users" WHERE "users"."role" = ?  [["role", 2]]
 => #<ActiveRecord::Relation [#<User id: 3, name: "Client", role: 2, created_at: "2015-09-17 02:06:51", updated_at: "2015-09-17 02:06:51">]>
```
