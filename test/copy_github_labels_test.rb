require "test_helper"

class CopyGithubLabelsTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CopyGithubLabels::VERSION
  end
end
