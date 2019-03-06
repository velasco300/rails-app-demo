Rails.application.eager_load!
ApplicationController.descendants.each do |c|
  c.action_methods.each do |m|
    Permission.find_by(resource: c.name, action: m) || Permission.create!(resource: c.name, action: m)
  end
end
