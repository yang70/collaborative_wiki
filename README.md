# Collaborative Wiki - Resources Practice App in Ruby on Rails

  <img src="https://s3-us-west-2.amazonaws.com/yangportfoliobucket/layoutpics/headshot.jpg" width="200">

By [Matthew Yang](http://www.matthewgyang.com).

## Description

This application was created in order to practice the `has_and_belongs_to_many` database association.  This was accomplished by creating an application that tracks topic pages that have a title and body.  These pages can be edited by users.  When a topic is edited, the user has that article associated to them, and therefore they are associated with that article.

User login was implemented with the [Devise](https://github.com/plataformatec/devise).

Devise implemented the `users` resource, and I created a `topics` resource with corresponding controller and views.

Next I added the `has_and_belongs_to_many :topics` line to the `user` model, and accordingly added `has_and_belongs_to_many :users` to the `topic` model.

I then created a table migration displayed below, which creates a "join table" that only contains `user_id`'s and `topic_id`'s that are associated:

```ruby
class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :topics, :users do |t|
      t.index [:topic_id, :user_id]
      t.index [:user_id, :topic_id]
    end
  end
end
```
After migrating the database, the `join table` allows for reference of topics and users in relation to each other.

For example if I set a user instance to `@user` and then want to see the topics that user has edited, I can  all `@user.topics` with will return an array like object that containing the topics.

As it also works in the other direction, if I set a topic instance to `@topic`, I can see all the users that have edited the topic with `@topic.users`.

## Special Notes

I was able to set up a `seed.rb` that I am pretty happy with that will seed the db with example data in order to see how this works.
