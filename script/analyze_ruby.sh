#!/bin/sh -eux

cd "$(dirname "$0")"/../

export TZ=Asia/Tokyo
log_dir=logs/ruby/$(date +"%Y%m%d_%H%M%S")
mkdir -p "${log_dir}"
cd ruby
estackprof list -f app.rb > ../"${log_dir}"/estackprof
estackprof flamegraph
mv ./tmp ../"${log_dir}"/logs