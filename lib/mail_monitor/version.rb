# encoding: utf-8
module MailMonitor

    version = {}
    File.read(File.join(File.dirname(__FILE__), '../', 'VERSION')).each_line do |line|
      type, value = line.chomp.split(":")
      next if type =~ /^\s+$/  || value =~ /^\s+$/
      version[type] = value
    end

    MAJOR = version['major']
    MINOR = version['minor']
    PATCH = version['patch']
    BUILD = version['build']

    VERSION = [MAJOR, MINOR, PATCH, BUILD].compact.join('.')

end