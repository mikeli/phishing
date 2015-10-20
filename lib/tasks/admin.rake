
# Show Database
desc "show accounts"
task :show_accounts do 
  Accounts.all.each do | app | 
    p app.attributes  
  end
  p Accounts.all.count
end

