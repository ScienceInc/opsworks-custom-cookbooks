node[:deploy].each do |application, deploy|
  rails_env = deploy[:rails_env]
  current_path = deploy[:current_path]

  Chef::Log.info("Scheduling tracking number sync with environment #{rails_env}")

  execute 'schedule tracking number sync' do
    cwd current_path
    user 'deploy'
    command 'bundle exec whenever -w'
    environment 'RAILS_ENV' => rails_env
  end
end
