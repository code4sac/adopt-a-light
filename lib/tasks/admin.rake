namespace :admin do
  desc "Fetch lat longs from gmail"
  task :addGmailLights => :environment do
    gmail = Gmail.new('adoptsac@gmail.com', '@d0pt4Sac!');
    num = gmail.inbox.count

    puts num
    gmail.logout
  end
end 
