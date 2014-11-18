require 'rake'
require 'fileutils'

task :install do
  # move bash files in
  all_opts = { overwrite: false, backup: false }

  Dir.glob("home/*").each do |file|
    file_opts = { overwrite: false, backup: false }

    filename = file.sub("home/", "")
    repo_filepath = "#{FileUtils.pwd}/home/#{filename}"
    dest_filepath = "#{ENV['HOME']}/.#{filename}"

    if File.exists?(dest_filepath) || File.symlink?(dest_filepath)
      unless all_opts.any? { |_, v| v == true }
        puts "File already exists: #{dest_filepath}"
        puts "What do you want to do? [o]verwrite, [O]verwrite all remaining, [b]ackup, [B]ackup all remaining, [s]kip, [S]kip all remaining"

        case STDIN.gets.chomp
        when 'o' then file_opts[:overwrite] = true
        when 'b' then file_opts[:backup] = true
        when 's' then next
        when 'O' then all_opts[:overwrite] = true
        when 'B' then all_opts[:backup] = true
        when 'S' then break
        else
          puts "not a valid selection. skipping"
        end
      end

      if all_opts[:backup] or file_opts[:backup]
        FileUtils.mv(dest_filepath, "#{dest_filepath}.backup", :verbose => true)
      end
    end

    FileUtils.cp(repo_filepath, dest_filepath, :verbose => true)
  end

  # TODO: vimrc, tmux.conf, etc
end
