require 'bcrypt'

rom = ROM.container(:sql, "sqlite://#{Dir.pwd}/db.sqlite") do |config|
  config.default.connection.create_table(:users) do
    primary_key :id
    column :username, String, null: false
    column :email, String, null: false
    column :password_hash, String, null: false
  end
end

class UserRepo < ROM::Repository[:users]
  # find all users with the given attributes
  def query(conditions)
    users.where(conditions).as(User)
  end

  def by_id(id)
    users.by_pk(id).one!
  end

  # collect a list of all user ids
  def ids
    users.pluck(:id)
  end

  def authenticate(attempted_password)
    attempted_password_hash = BCrypt::Password.new(attempted_password)
    if self.password_hash == attempted_password_hash
      true
    else
      false
    end
  end

end

class User
  attr_reader :id, :username, :email, :password

  def initialize(attributes)
    @id, @name, @email, @password_hash = attributes.values_at(:id, :name, :email, :password_hash)
  end
end


# Create a test User
#if User.count == 0
#  @user = User.create(username: "admin")#
#  @user.password = "admin"
#  @user.save
#end
