
require 'minitest/autorun'

require 'pathname'
ROOT = Pathname.new(File.expand_path('../../', __FILE__))
$LOAD_PATH.unshift((ROOT + 'lib').to_s)
$LOAD_PATH.unshift((ROOT + 'spec').to_s)

require 'slt_xcodeproj_helper'
require 'fileutils'

class SltXcodeprojHelperTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::SltXcodeprojHelper::VERSION
  end

  def test_it_does_something_useful
    # copy project
    root = File.absolute_path(ROOT)
    projectPath = root + '/test/fixtures/SLTDemoProject'
    cachePath = root + '/test/fixtures/cache'
    delPath = cachePath + '/SLTDemoProject'
    `rm -rf #{delPath}`
    FileUtils.cp_r projectPath, cachePath

    path = delPath + '/SLTDemoProject.xcodeproj'
    targetName = 'SLTDemoProject'
    key = 'DEVELOPMENT_TEAM'
    value = 'newTeam2'
    SLTProjectHelper.run(['--path='+path,'--target='+targetName,'--key='+key,'--value='+value])

    flag = false
    project = Xcodeproj::Project.open(path)
    project.targets.each do |target|
      if target.name == targetName
        target.build_configurations.each do |config|
          if config.build_settings[key] == value
            flag = true
          end
        end
      end
    end
    self.assert_equal(true,flag)
  end
end
