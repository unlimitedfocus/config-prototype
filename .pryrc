# === EDITOR ===
Pry.editor = 'vim'

Pry.config.color = true
Pry.config.theme = "solarized"

# === CUSTOM PROMPT ===
# This prompt shows the ruby version (useful for RVM)
Pry.prompt = [proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level, _| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

# === Listing config ===
# Better colors - by default the headings for methods are too 
# similar to method name colors leading to a "soup"
# These colors are optimized for use with Solarized scheme 
# for your terminal
Pry.config.ls.separator = "\n" # new lines between methods
Pry.config.ls.heading_color = :magenta
Pry.config.ls.public_method_color = :green
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

# === CUSTOM COMMANDS ===
# from: https://gist.github.com/1297510
default_command_set = Pry::CommandSet.new do
  command "copy", "Copy argument to the clip-board" do |str|
     IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  end

  command "clear" do
    system 'clear'
    if ENV['RAILS_ENV']
      output.puts "Rails Environment: " + ENV['RAILS_ENV']
    end
  end

  command "sql", "Send sql over AR." do |query|
    if ENV['RAILS_ENV'] || defined?(Rails)
      pp ActiveRecord::Base.connection.select_all(query)
    else
      pp "No rails env defined"
    end
  end
  command "caller_method" do |depth|
    depth = depth.to_i || 1
    if /^(.+?):(\d+)(?::in `(.*)')?/ =~ caller(depth+1).first
      file   = Regexp.last_match[1]
      line   = Regexp.last_match[2].to_i
      method = Regexp.last_match[3]
      output.puts [file, line, method]
    end
  end
end

Pry.config.commands.import default_command_set

refinery_command_set = Pry::CommandSet.new do

  command 'init' do
    # DataImports.models(Refinery::Page,Refinery::Shop::Category,Refinery::Shop::Product)
  end
  command 'exp' do
    # DataImports.export_samples
  end
  command 'imp' do
    # DataImports.import("Refinery::Shop::Product")
  end
  command "what_i_want" do
    str="Dont know what I want but I know how to get it"
    ap str
    ap str[/(\w+) want/]
    ap str[/(?<a>\w+) want/, :a]
    /(?<a>\w+) want/ =~ str
    ap a
  end

  command "get_test_data" do  
    require 'nokogiri'
    
    # @p = Refinery::Shop::Product.find 'l-tyrosine-500-mg-60-caps'
    # @t = @p.description
    # @d = Nokogiri::HTML(@t)
    # @w = @d.css("div#contents")
  end
end

Pry.config.commands.import refinery_command_set

if defined?(::Rails) && Rails.env
  if Rails::VERSION::MAJOR == 3
    verbose, $VERBOSE = $VERBOSE, nil
    if defined?(Rails::Console)
      Rails::Console::IRB = ::Pry unless Rails::Console::IRB == ::Pry
    end  
    $VERBOSE = verbose

    unless defined? ::Pry::ExtendCommandBundle
      ::Pry::ExtendCommandBundle = Module.new
    end
  end

  if defined?(Rails) && Rails::VERSION::MAJOR == 4
    unless Rails.application.config.console == ::Pry
      Rails.application.config.console = ::Pry
    end
  end

  if ((Rails::VERSION::MAJOR == 3 && Rails::VERSION::MINOR >= 2) ||
      Rails::VERSION::MAJOR == 4)
    unless defined? ::Rails::ConsoleMethods
      require 'rails/console/app'
      require 'rails/console/helpers'

      TOPLEVEL_BINDING.eval('self').extend ::Rails::ConsoleMethods
    end
  end
end

def time(repetitions = 100, &block)
  require 'benchmark'
  Benchmark.bm{|b| b.report{repetitions.times(&block)}}
end

Pry.config.color = true
Pry.config.prompt = Pry::NAV_PROMPT

Pry.config.commands.alias_command "h", "hist -T 20", desc: "Last 20 commands"
Pry.config.commands.alias_command "hg", "hist -T 20 -G", desc: "Up to 20 commands matching expression"
Pry.config.commands.alias_command "hG", "hist -G", desc: "Commands matching expression ever used"
Pry.config.commands.alias_command "hr", "hist -r", desc: "hist -r <command number> to run a command"

if defined?(PryByebug)
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 'e', 'finish'
  Pry.commands.alias_command 'u', 'up'
  Pry.commands.alias_command 'd', 'down'
  Pry.commands.alias_command 'f', 'frame'
  Pry.commands.alias_command 'b', 'break'
  Pry.commands.alias_command 'w', 'whereami'
end

begin
  require 'awesome_print'
  # Pry.config.print = proc { |output, value| output.puts value.ai }
  AwesomePrint.defaults={:theme=>:solorized}
  AwesomePrint.pry!
rescue LoadError => err
  puts "no awesome_print :("
end

my_hook = Pry::Hooks.new.add_hook(:before_session, :add_dirs_to_load_path) do
  # adds the directories /spec and /test directories to the path if they exist and not already included
  dir = `pwd`.chomp
  dirs_added = []
  %w(spec test lib).map{ |d| "#{dir}/#{d}" }.each do |p|
    if File.exist?(p) && !$:.include?(p)
      $: << p
      dirs_added << p
    end
  end
  puts "Added #{ dirs_added.join(", ") } to load path in ~/.pryrc." if dirs_added.present?
end

my_hook.exec_hook(:before_session)
