# frozen_string_literal: true

require 'active_record'
require 'pg'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'kkerrigan',
  password: '12345678',
  database: 'activerecord'
)

class User < ActiveRecord::Base
  after_update :disable_subscriptions
  has_many :subscriptions
  has_many :podcasts, source: :subscribable, through: :subscriptions
  has_many :newspapers, source: :subscribable, through: :subscriptions
  validates :username, presence: true, uniqueness: true
  def disable_subscriptions
    subscriptions.update(status: :disabled)
  end
end

class CreateUserTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users, if_not_exists: true do |table|
      table.string :username, null: false, unique: true
      table.timestamps
      table.boolean :active, null: false, default: true
    end
  end
end

class Podcast < ActiveRecord::Base
  has_many :subscriptions, as: :subscribable
  has_many :users, source: :user, foreign_key: 'user_id', through: :subscriptions
  validates :name, presence: true, uniqueness: true
end

class CreatePodcastTable < ActiveRecord::Migration[7.0]
  def change
    create_table :podcasts, if_not_exists: true do |table|
      table.string :name, null: false, unique: true
      table.string :kind, null: false
      table.timestamps
    end
  end
end

class Newspaper < ActiveRecord::Base
  has_many :subscriptions, as: :subscribable
  has_many :users, source: :user, foreign_key: 'user_id', through: :subscriptions
  validates :name, presence: true, uniqueness: true
  enum newspaper_type: %i[type1 type2 type3]
end

class CreateNewspaperTable < ActiveRecord::Migration[7.0]
  def change
    create_table :newspapers, if_not_exists: true do |table|
      table.string :name, null: false, unique: true
      table.string :kind, null: false
      table.timestamps
    end
  end
end

class Subscription < ActiveRecord::Base
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :subscribable, polymorphic: true
end

class CreateSubscriptionTable < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions, if_not_exists: true do |table|
      table.integer :user_id
      table.references :subscribable, polymorphic: true
      table.column :status, :integer, default: 0
      table.timestamps
    end
  end
end

CreateUserTable.migrate(:up)
CreatePodcastTable.migrate(:up)
CreateNewspaperTable.migrate(:up)
CreateSubscriptionTable.migrate(:up)

user1 = User.new(username: 'kkerrigan')
user1.save

user2 = User.new(username: 'polina')
user2.save

podcast1 = Podcast.new(name: 'Cringe', kind: 'Comedy')
podcast1.users << User.find_by(username: 'polina')
podcast1.save

newspaper1 = Newspaper.new(name: 'Apmath', kind: 'University')
newspaper1.users << User.find_by(username: 'kkerrigan')
newspaper1.users << User.find_by(username: 'polina')
newspaper1.save

user2.update(active: false)



