include FactoryGirl::Syntax::Methods

admin = create(:user, name: "Admin", email: "admin@example.com", password: "admin")
token = create(:token, user: admin, expires_at: 1000.years.from_now, value: "1")

USERS = 8
OTHERS = 3

users = create_list(:user, USERS).each { |user| create(:token, user: user) }

create_list(:group, OTHERS).each do |group|
  puts "Creating group \"#{group}\""
  delegates = users.sample(2)
  group_users = (users - delegates).sample(USERS - 2)
  sub_delegates = group_users.sample(2)
  group_users -= sub_delegates

  group.users << delegates
  group.users << sub_delegates
  group.users << group_users
  group.add_admin(admin)

  create_list(:invitation, OTHERS, group: group)

  ActiveRecord::Base.transaction do
    create_list(:category, OTHERS, group: group).each do |category|
      puts "Creating category \"#{category}\""
      group_users.each do |user|
        create(:delegation, delegator: user, delegate: (delegates + sub_delegates).sample, category: category)
      end

      sub_delegates.each do |user|
        create(:delegation, delegator: user, delegate: delegates.sample, category: category)
      end

      OTHERS.times do
        poll = create(:poll, category: category, user: group.users.sample)
        create_list(:proposition, OTHERS, poll: poll).each do |proposition|
          choices = create_list(:choice, OTHERS, proposition: proposition)

          group.users.each do |user|
            create(:vote, user: user, choice: choices.sample)
          end
        end
      end
    end
  end
end
