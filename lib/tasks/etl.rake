desc "import"
  task :import => :environment do
    users = JSON.parse( HTTParty.get("http://localhost:4567/access").body) 
    users.each do | user | 
        u = User.find_or_create_by(:username => user['username'], :role => user['role'])
        u.app_name      = user['app_name'] 
        u.upn           = user['upn']
        u.full_name     = user['full_name']
        u.username      = user['username']
        u.role          = user['role'] 
        u.dept          = user['dept'] 
        u.title         = user['title']
        u.active        = user['active']
        u.term          = user['term']
        u.save
    end

    apps = JSON.parse( HTTParty.get("http://localhost:4567/apps").body) 
    apps.each do | app | 
        a = App.find_or_create_by(:name => app['name'])
        a.name                          = app['name']
        a.description                   = app['description']
        a.ad_group                      = app['ad_group']
        a.vendor_contact_name           = app['vendor_contact_name']
        a.vendor_contact_email          = app['vendor_contact_email']
        a.business_name                 = app['business_name']
        a.business_email                = app['business_email']
        a.admin_name                    = app['admin_name']
        a.admin_email                   = app['admin_email']
        a.primary_review_name           = app['primary_review_name']
        a.primary_review_email          = app['primary_review_email']
        a.secondary_review_name         = app['secondary_review_name']
        a.secondary_review_email        = app['secondary_review_email']
        a.active_date                   = app['active_date']
        a.remove_date                   = app['remove_date']
        a.active                        = app['active']
        a.found                         = app['found']
        a.api                           = app['api']
        a.okta                          = app['okta']
        a.save
    end
end