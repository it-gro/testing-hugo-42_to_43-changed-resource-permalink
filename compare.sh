#!/usr/bin/env bash

versions=""
versions="${versions} 0.42.2 "
versions="${versions} 0.43.0 "
versions="${versions} 0.47.1 "

cd $(dirname $0)

for version in ${versions}; do
  HUGO_CANONIFYURLS=true hugo-${version} -v                              \
  --baseURL https://example.com/foo/bar/                                 \
  --destination          public/${version}/subdir/canonify_true/foo/bar  \
  --cleanDestinationDir
done

for version in ${versions}; do
  HUGO_CANONIFYURLS=true hugo-${version} -v                              \
  --baseURL https://example.com/foo/bar/                                 \
  --destination          public/${version}/subdir/canonify_true/foo/bar  \
  --cleanDestinationDir
done


for version in ${versions}; do
  HUGO_CANONIFYURLS=true hugo-${version} -v                             \
  --baseURL https://example.com/                                        \
  --destination          public/${version}/root/canonify_true           \
  --cleanDestinationDir
done

for version in ${versions}; do
  hugo-${version} -v                                                  \
  --baseURL https://example.com/                                      \
  --destination          public/${version}/root/canonify_false        \
  --cleanDestinationDir
done

diff -r public/0.42.2/root public/0.43.0/root
diff -r public/0.43.0/root public/0.47.1/root

diff -r public/0.42.2/subdir public/0.43.0/subdir
diff -r public/0.43.0/subdir public/0.47.1/subdir
