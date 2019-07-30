
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "copy_github_labels/version"

Gem::Specification.new do |spec|
  spec.name          = "copy_github_labels"
  spec.version       = CopyGithubLabels::VERSION
  spec.authors       = ["ug0"]
  spec.email         = ["ug600@icloud.com"]

  spec.summary       = %q{Easily copy labels from one GitHub repository to another.}
  spec.description   = %q{Easily copy labels from one GitHub repository to another.}
  spec.homepage      = "https://github.com/ug0/copy_github_labels"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "octokit", "~> 4.0"
  spec.add_dependency "colorize"
  spec.add_dependency "tty-prompt"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
