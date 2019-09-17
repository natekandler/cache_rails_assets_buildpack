function save_assets() {
  local save_dir="$1"
  local cache_dir="$2"

  if [ -d "$save_dir" ]; then
    echo "- caching tmp$save_dir"
    mkdir -p "$cache_dir"
    cp -r "$save_dir/." "$cache_dir"
  fi
}

function restore_assets() {
  local save_dir="$1"
  local cache_dir="$2"

  if [ -d "$cache_dir" ]; then
    echo "- restoring tmp$cache_dir"
    du -sh "$cache_dir"
    mkdir -p "$(dirname $save_dir)"
    cp -r "$cache_dir/." "$save_dir"
  fi
}
