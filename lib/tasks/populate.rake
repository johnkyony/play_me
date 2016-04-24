require 'ffaker'
require 'faker'

namespace :db do
  desc "Populate database with fake data"
  task populate: :environment do
    puts '.....'
    admin = User.find_by(email: 'admin@gmail.com') || User.create( name: 'admin', email: 'admin@gmail.com', password: 'topsecret', role: 1)
    john = User.find_by(email: 'jkyony@gmail.com') || User.create(name: 'john' , email: 'jkyony@gmail.com' , password: '(0) (0)' , role: 1)
    # Users
    20.times do 
      p full_name = Faker::Name.name
      User.create(
        name: full_name,
        email: Faker::Internet.email(full_name),
        password: "topsecret" 
      )
    end

    # Parties
    User.all.sample(10).each do |host|
      Party.create!(
        name: FFaker::Company.name,
        location: FFaker::Venue.name ,
        occurence: Faker::Date.between(2.years.ago, Date.today) ,
        user:  host
      )
    end

  # Videos
  30.times do |i|
    Video.create( 
                 title: FFaker::Music.song, 
                 link: "http://video#{i}" ,
                 voteup: i,
                 votedown: i/3
                )
  end

  # Tracks 
  30.times do |i|
    Track.create(
      name: FFaker::Music.song , 
      artwork_url: "http://track#{i}.jpg",
      length: 300 ,
      soundcloud_id: i*i,
      stream_url: "http://track#{i}/stream"
      )
  end

    # Guests and playlists
    Party.all.each do |party|
      # add admin as guest to all parties
      party.guests.build(user: admin).save
      User.all.sample(10).each do |user|
        party.guests.build(user: user  ).save
      end

      # add 3 videos to the playlist
      Video.all.sample(3).each do |video|  
        party.playlists.build(video: video).save
      end
    end
  end

end
