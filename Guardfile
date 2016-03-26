# vim: ft=ruby

guard :minitest,  spring: 'rake test' do
  # with Minitest::Unit
  watch(%r{^test/(.*)\/?test_(.*)\.rb$})
  watch(%r{^lib/(.*/)?([^/]+)\.rb$})     { |m| "test/#{m[1]}test_#{m[2]}.rb" }
  watch(%r{^test/test_helper\.rb$})      { 'test' }

  # Rails 4
  watch(%r{app/views/.+\.(erb|haml|slim)$}) {|m| 'test'}
   watch(%r{^app/(.+)\.rb$})                               { |m| "test" }
   watch(%r{^app/controllers/application_controller\.rb$}) { 'test/controllers' }
   watch(%r{^app/controllers/(.+)_controller\.rb$})        { |m| "test/integration/#{m[1]}_test.rb" }
   watch(%r{^lib/(.+)\.rb$})                               { |m| "test/lib/#{m[1]}_test.rb" }
   watch(%r{^test/.+_test\.rb$})
   watch(%r{^test/test_helper\.rb$}) { 'test' }
end

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end


guard :bundler do
  watch('Gemfile')
end
