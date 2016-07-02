User.destroy_all
user = User.new(email: 'oliver@futureworkz.com', password: '123123123', name: 'Oliver')
user.save!