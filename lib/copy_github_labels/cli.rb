require 'optparse'
require 'tty-prompt'

class CopyGithubLabels::CLI
  class << self
    def run(args)
      parsed_options = parse_args(args)
      options = parsed_options.fetch(:options)
      credentials = parsed_options.fetch(:credentials)
      args = parsed_options.fetch(:args)

      if args.length != 2
        puts parse_args(%W(--help))
      else
        source, target = args

        if credentials[:login]
          credentials[:password] = TTY::Prompt.new.mask("GitHub account password: ")
        end

        CopyGithubLabels::Client.new(credentials)
                                .copy_labels(source, target, options.slice(:override))
      end
    end

    def parse_args(args)
      options = { override: false }
      credentials = {}

      OptionParser.new do |opts|
        opts.banner = "Usage: copy_github_labels [OPTION]... SOURCE_REPO TARGET_REPO"

        opts.on("-f", "--force", "Override existing labels") do
          options[:override] = true
        end

        opts.on("-uUSERNAME", "--username==USERNAME", "GitHub username") do |username|
          credentials[:login] = username
        end

        opts.on("-tTOKEN", "--token==TOKEN", "GitHub access token") do |token|
          credentials[:access_token] = token
        end

        opts.on("-h", "--help", "Print help") do
          puts opts
          exit
        end
      end.parse!(args)

      {
        args: args,
        credentials: credentials,
        options: options
      }
    end
  end
end