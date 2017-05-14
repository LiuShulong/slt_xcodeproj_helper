# encoding: utf-8

require "slt_xcodeproj_helper/version"
require 'claide'
require 'xcodeproj'


class SLTProjectHelper < CLAide::Command

  self.description = 'set xcode project build options'

  self.command = 'set'

  def self.options
    [
        ['--path', 'project path'],
        ['--target', 'target path'],
        ['--key', 'build option name'],
        ['--value', 'build option value']
    ].concat(super)
  end

  def initialize(argv)
    @path = argv.option('path','')
    @target = argv.option('target','')
    @key = argv.option('key','')
    @value = argv.option('value','')
    super
  end

  def validate!
    super
    if @path.length == 0 || @target.length == 0 || @key.length == 0 || @value.length == 0
      help! "para cannot be nil"
    end
  end

  def run
    # read project
    project_path = @path
    project = Xcodeproj::Project.open(project_path)
    project.targets.each do |target|
      if target.name == @target
        target.build_configurations.each do |config|
          config.build_settings[@key] = @value
        end
      end
    end
    project.save
  end


end

# SLTProjectHelper.run(ARGV)
