
def get_contents(function_name)
  File.read("templates/compile").gsub("FUNCTION_TO_CALL", function_name)
end

def get_previous_version
  `git tag -l`.scan(/^v(\d+)/).flatten.map(&:to_i).max || 0
end

def commit_and_tag_version(function_name, version)
  system <<~COMMAND
  set -x
  git add bin/compile &&
    git commit -m 'creating bin/compile for v#{version}-#{function_name}' &&
    git tag v#{version}-#{function_name} head &&
    git reset --hard head~1
COMMAND
end

def create_release(function_name, version)
  contents = get_contents(function_name)

  puts "save_rails_asset_directories -- writing bin/compile"
  File.write("bin/compile", contents)

  commit_and_tag_version(function_name, version)
end


desc ""
task :release do
  previous_version = get_previous_version
  current_version = previous_version.succ

  create_release("save_rails_assets", current_version)
  create_release("restore_rails_assets", current_version)
end
