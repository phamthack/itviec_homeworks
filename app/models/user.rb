class User < ActiveRecord::Base
  has_many :posts

  enum status: { active: 0, inactive: 1, banned: 2, pending: 3 }
  enum city: { hcm: 'HCM', hn: 'HN', dn: 'DN', other: 'Other' }
  enum subscribe_status: { subscribed: 0, unsubscribed: 1 }

  def exists?(status, city)
    pluck(:status, :city).count{|user| user.status == status && user.city == city} > 0
  end

  # Based on the schema in https://gist.github.com/ancv1990/0187a1fecad17e11331565b73db93042
  # This method was slow because column `user_id` in the table `posts` does not index.
  # We should add an index to the column in which we using it where the clause
  def self.bad_sol
    User.select("*, (select count(*) from posts where posts.user_id=users.id) as post_count")
    .order("post_count desc")
  end
end