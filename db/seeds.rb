include FactoryGirl::Syntax::Methods

admin = create(:user, name: "Admin", email: "admin@example.com", password: "admin")
token = create(:token, user: admin, expires_at: 1000.years.from_now, value: "1")

N = 5

users = create_list(:user, 2 * N).each { |user| create(:token, user: user) }

create_list(:group, N).each do |group|
  delegates = users.sample(2)
  group_users = (users - delegates).sample(N - 2)

  group.users << delegates
  group.users << group_users
  group.add_admin(admin)

  create_list(:invitation, N, group: group)

  create_list(:category, N, group: group).each do |category|
    group_users.each do |user|
      create(:delegation, user: user, delegate: delegates.sample, category: category)
    end

    N.times do
      poll = create(:poll, category: category, user: group.users.sample)
      create_list(:proposition, N, poll: poll).each do |proposition|
        choices = create_list(:choice, N, proposition: proposition)

        group.users.each do |user|
          create(:vote, user: user, choice: choices.sample)
        end
      end
    end
  end
end
