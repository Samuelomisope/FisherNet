#!/data/data/com.termux/files/usr/bin/bash

# Minify CSS
cleancss -o style/style.min.css style/style.css

# Optimize and resize images
for img in *.{jpg,jpeg,png}; do
  if [ -f "$img" ]; then
    mogrify -resize 1200x1200\> -strip -interlace Plane -quality 85% "$img"
  fi
done

# Optional: Minify HTML
for file in *.html; do
  if [ -f "$file" ]; then
    html-minifier --collapse-whitespace --remove-comments -o "${file%.html}.min.html" "$file"
  fi
done

# Stage all changes
git add .

# Commit with a message
git commit -m "Optimized CSS, resized images, minified HTML, updated site"

# Push to GitHub
git push origin main

