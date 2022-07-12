class User < ActiveRecord::Base
  has_many :posts

  enum status: { active: 0, inactive: 1, banned: 2, pending: 3 }
  enum city: { hcm: 'HCM', hn: 'HN', dn: 'DN', other: 'Other' }
  enum subscribe_status: { subscribed: 0, unsubscribed: 1 }

  # We should change the name method because it gets confused with the method exists? of ActiveRecord
  def exists_by_status_city?(status, city)
    User.exists?(status: status, city: city)
  end

  def self.bad_sol
    User.select("*, (select count(*) from posts where posts.user_id=users.id) as post_count")
    .order("post_count desc")
  end
end