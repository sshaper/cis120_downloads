#!/usr/bin/env bash
set -euo pipefail

# Build a small filesystem sandbox for practicing `find` and regex-based
# searching with `grep` (chapter 8).
#
# Run from anywhere; this script creates ./find_regex relative to where you run it:
#   bash find_regex.sh
#
# If you want to overwrite an existing sandbox:
#   bash find_regex.sh --force

OUT_DIR="find_regex"

if [[ "${1:-}" == "--force" ]]; then
  rm -rf "$OUT_DIR"
fi

mkdir -p "$OUT_DIR"

mkdir -p "$OUT_DIR"/logs "$OUT_DIR"/docs "$OUT_DIR"/configs "$OUT_DIR"/html \
  "$OUT_DIR"/code "$OUT_DIR"/images "$OUT_DIR"/backups "$OUT_DIR"/misc \
  "$OUT_DIR"/nested/level1/level2 "$OUT_DIR"/nested/test "$OUT_DIR"/empty_dir

############################################################
# Files for grep/regex examples
############################################################

cat > "$OUT_DIR/logs/application.log" <<'EOF'
INFO: User login successful.
WARN: Disk space running low.
ERROR: Database connection error.
INFO: Data processed.
DEBUG: Cache cleared.
ERROR: API rate limit exceeded.
INFO: Report generated.
WARN: Unused variable detected.
ERROR: File not found.
SUCCESS: Operation completed.
EOF

cat > "$OUT_DIR/logs/access.log" <<'EOF'
Client 192.168.1.1 connected successfully.
Client 10.0.0.255 connected successfully.
Client 172.16.4.2 timed out.
Client 8.8.8.8 requested /index.html.
EOF

cat > "$OUT_DIR/logs/timestamped.log" <<'EOF'
2026-03-18 09:12:01 INFO: Boot complete.
2026-03-18 09:12:07 WARN: Disk almost full.
2026-03-18 09:12:09 ERROR: Database connection error.
2026-03-18 09:13:01 INFO: Data processed.
2026-03-18 09:13:20 ERROR: File not found.
EOF

cat > "$OUT_DIR/docs/document1.txt" <<'EOF'
From: John Doe
This is a test document.
Cat, dog, bat, run, sun.
My phone number is 555-123-4567.
Apple and awesome altitude.
Another line here.
End of the document.
EOF

cat > "$OUT_DIR/docs/document2.txt" <<'EOF'
This line has an error and a warning.
Playing and programming are fun activities.
The IP address is 192.168.1.1 and another is 10.0.0.255.
<div>This is a div</div> <p class="text">And a paragraph.</p>
Contact us at test@example.com or support@sub.domain.org.
EOF

cat > "$OUT_DIR/docs/document3.txt" <<'EOF'
123 This line starts with a digit.
Hello World! This contains only letters.
This line has some punctuation, like commas, periods, and question marks?
A Word Starting with an Uppercase Letter.
Trailing whitespace here.
EOF

cat > "$OUT_DIR/html/page.html" <<'EOF'
<html>
  <body>
    <div class="container">Welcome</div>
    <p class="text">This is a paragraph with <em>emphasis</em>.</p>
    <span>Span element</span>
  </body>
</html>
EOF

############################################################
# Files for `find` tests/actions examples
############################################################

# Config files (for -name/-iname, and locate -r).
cat > "$OUT_DIR/configs/server.conf" <<'EOF'
server {
  listen 80;
}
EOF

cat > "$OUT_DIR/configs/client.CONF" <<'EOF'
client {
  timeout 30;
}
EOF

# Code files (for grep -r --include=*.py)
cat > "$OUT_DIR/code/sample.py" <<'EOF'
def add(a, b):
    return a + b

def greet(name):
    return f"Hello, {name}!"

class Greeter:
    def __init__(self, name):
        self.name = name

    def say(self):
        return greet(self.name)
EOF

cat > "$OUT_DIR/code/sample.js" <<'EOF'
// TODO: refactor this function for clarity
function multiply(a, b) {
  return a * b;
}

// Another TODO: add input validation
EOF

# Include at least one shell script file for name filtering.
cat > "$OUT_DIR/misc/setup.sh" <<'EOF'
#!/usr/bin/env bash
echo "Setup complete."
EOF

chmod +x "$OUT_DIR/misc/setup.sh"

# Backups with dates in their names (for regex-in-find style tasks).
touch "$OUT_DIR/backups/backup_20220315.log"
touch "$OUT_DIR/backups/backup_20231127.txt"

# Image files (for extension filtering / exclusion patterns).
touch "$OUT_DIR/images/photo.jpg"
touch "$OUT_DIR/images/diagram.png"
touch "$OUT_DIR/images/icon.gif"
touch "$OUT_DIR/images/picture.bmp"

# Misc files with digits in names + multiple extensions.
touch "$OUT_DIR/misc/note_7.txt"
touch "$OUT_DIR/misc/note_42.txt"
touch "$OUT_DIR/misc/report1.log"
touch "$OUT_DIR/misc/report2.pdf"
touch "$OUT_DIR/misc/data.csv"
touch "$OUT_DIR/misc/script.php"
touch "$OUT_DIR/misc/abc123def.md"

# Nested structure.
touch "$OUT_DIR/nested/level1/level2/deep_99.txt"
touch "$OUT_DIR/nested/test/ignore_me.txt"

# Empty file + empty directories (for find -empty).
: > "$OUT_DIR/empty_file.txt"

# One file large enough to test -size.
dd if=/dev/zero of="$OUT_DIR/bigfile.bin" bs=1M count=2 2>/dev/null

echo "Created sandbox directory: ./$OUT_DIR"
echo "Try: cd \"$OUT_DIR\" && ls -R"