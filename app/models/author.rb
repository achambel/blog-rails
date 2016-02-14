class Author
  def self.top(limit = 1)
    User.joins(:posts)
        .group('users.name', 'users.slug', 'users.email')
        .order('count_id desc')
        .limit(limit)
        .count(:id)
  end
end
