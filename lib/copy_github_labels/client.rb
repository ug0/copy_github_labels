require 'colorize'
require 'octokit'
Octokit.default_media_type = "application/vnd.github.v3+json,application/vnd.github.symmetra-preview+json"

class CopyGithubLabels::Client
  attr_reader :client

  def initialize(opts = {})
    @client = Octokit::Client.new(opts)
    @client.auto_paginate = true
  end

  def labels(repo)
    client.labels(repo)
  end

  def copy_labels(source, target, opts = {})
    labels(source).map do |label|
      Thread.new do
      msg = copy_label(label, target, opts)
      puts msg.join(" ")
      end
    end.each(&:join)
    puts "DONE".green
  end

  private

  def copy_label(label, target_repo, opts = {})
    msg = [label.name.blue, ":"]

    begin
      add_label(target_repo, label.name, label.color)
      msg << "OK".green
    rescue Octokit::UnprocessableEntity => error
      if error.message =~ /already_exists/
        if opts[:override]
          update_label(target_repo, label.name, { color: label.color, description: label.description })
          msg += ["OK".green, "OVERRIDE".yellow]
        else
          msg << "SKIP".yellow
        end
      else
        msg += ["ERROR".red, error.message.light_black]
      end
    rescue => error
      msg += ["ERROR".red, error.message.light_black]
    end

    msg
  end

  def add_label(repo, label, color, description = "")
    client.add_label(repo, label, color, { description: description })
  end

  def update_label(repo, label, opts = {})
    client.update_label(repo, label, opts)
  end
end