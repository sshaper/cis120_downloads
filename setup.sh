#!/bin/bash

# Install tree, locate (mlocate), and find (findutils) if not already present.
# Safe to run multiple times: only runs the package manager when a command is missing.
if ! command -v tree &>/dev/null; then
    sudo apt-get update -qq && sudo apt-get install -y tree
fi
if ! command -v locate &>/dev/null; then
    sudo apt-get update -qq && sudo apt-get install -y mlocate
fi
if ! command -v find &>/dev/null; then
    sudo apt-get update -qq && sudo apt-get install -y findutils
fi

mkdir -p ~/assignments/assignment{1..12}
mkdir -p ~/playground/chapter{1..13}

# Chapter 1: practice files for the cat command lesson (~/playground/chapter1
CHAPTER1=~/playground/chapter1
mkdir -p "$CHAPTER1"

cat > "$CHAPTER1/hello.txt" << 'EOF'
Hello, World!
This is my first file.
EOF

cat > "$CHAPTER1/file1.txt" << 'EOF'
First file
EOF

cat > "$CHAPTER1/file2.txt" << 'EOF'
Second file
EOF

cat > "$CHAPTER1/mixed.txt" << 'EOF'
Line one

Line three

Line five
EOF

cat > "$CHAPTER1/special.txt" << 'EOF'
Word1	Word2
EOF

cat > "$CHAPTER1/spaces.txt" << 'EOF'
First line


Second line


Third line
EOF

cat > "$CHAPTER1/header.txt" << 'EOF'
Header
Title: My Report
EOF

cat > "$CHAPTER1/body.txt" << 'EOF'
Body content here
More details
EOF

cat > "$CHAPTER1/footer.txt" << 'EOF'
Footer
End of report
EOF

cat > "$CHAPTER1/debug.txt" << 'EOF'
Line with tab	here
Line with    spaces
Normal line
EOF

# Chapter 2: practice files and dirs for cp, mv, rm, wildcards, ln, less; FHS and disk_storage (df, du, lsblk, mount) use the live system — no extra practice files
CHAPTER2=~/playground/chapter2
mkdir -p "$CHAPTER2"

cat > "$CHAPTER2/notes.txt" << 'EOF'
My class notes
Line 2
More content here.
EOF

cat > "$CHAPTER2/report1.txt" << 'EOF'
Report 1 content
EOF

cat > "$CHAPTER2/report2.txt" << 'EOF'
Report 2 content
EOF

cat > "$CHAPTER2/report3.txt" << 'EOF'
Report 3 content
EOF

cat > "$CHAPTER2/data_old.txt" << 'EOF'
old data
EOF

cat > "$CHAPTER2/data_new.txt" << 'EOF'
new data
EOF

mkdir -p "$CHAPTER2/documents"
cat > "$CHAPTER2/documents/readme.txt" << 'EOF'
File inside documents folder
EOF

# dir1, dir2, and source.txt for the ln lesson (symbolic link relative-path example)
mkdir -p "$CHAPTER2/dir1"
mkdir -p "$CHAPTER2/dir2"
cat > "$CHAPTER2/dir1/source.txt" << 'EOF'
Source file for link example
EOF

# Long file for less command practice (many lines to scroll/search)
cat > "$CHAPTER2/longfile.txt" << 'LONGEOF'
Line 1 - practice text for the less command.
Line 2 - practice text for the less command.
Line 3 - practice text for the less command.
Line 4 - practice text for the less command.
Line 5 - practice text for the less command.
Line 6 - practice text for the less command.
Line 7 - practice text for the less command.
Line 8 - practice text for the less command.
Line 9 - practice text for the less command.
Line 10 - practice text for the less command.
Line 11 - practice text for the less command.
Line 12 - practice text for the less command.
Line 13 - practice text for the less command.
Line 14 - practice text for the less command.
Line 15 - practice text for the less command.
Line 16 - practice text for the less command.
Line 17 - practice text for the less command.
Line 18 - practice text for the less command.
Line 19 - practice text for the less command.
Line 20 - practice text for the less command.
LONGEOF

# Chapter 3: practice files for grep, pipelines, redirection, sort, tee
CHAPTER3=~/playground/chapter3
mkdir -p "$CHAPTER3"

# grep: notes, log, file1-3, code.py
cat > "$CHAPTER3/notes.txt" << 'EOF'
Hello, welcome to the notes file.
This file contains various information.
hello there, how are you?
Some lines have HELLO in uppercase.
Other lines have Hello with capital H.
This line doesn't have hello at all.
EOF

cat > "$CHAPTER3/log.txt" << 'EOF'
2024-01-01 10:00:00 System started successfully
2024-01-01 10:05:23 error: Connection failed
2024-01-01 10:10:45 User logged in successfully
2024-01-01 10:15:12 error: File not found
2024-01-01 10:20:30 Request processed successfully
2024-01-01 10:25:55 error: Timeout occurred
2024-01-01 10:30:18 Operation completed successfully
2024-01-01 10:35:42 System status OK
EOF

cat > "$CHAPTER3/file1.txt" << 'EOF'
This is an important document.
It contains important information.
Some lines are not important.
EOF

cat > "$CHAPTER3/file2.txt" << 'EOF'
Another file with some text.
This file has important notes.
Regular text here.
EOF

cat > "$CHAPTER3/file3.txt" << 'EOF'
This file doesn't have the word.
Just regular content here.
Nothing special in this file.
EOF

cat > "$CHAPTER3/code.py" << 'EOF'
def calculate_total(items):
    total = 0
    for item in items:
        total += item.price
    return total

# There's a bug in this function
def process_data(data):
    result = []
    for d in data:
        # Bug: missing validation
        result.append(d.value)
    return result

def main():
    print("Starting program")
    # No bug here
    print("Program complete")
EOF

# pipelines: error logs, scripts, file.txt, users, access.log, app.log, server.log, data.csv
cat > "$CHAPTER3/error_log.txt" << 'EOF'
Error log file content
EOF

cat > "$CHAPTER3/error_report.txt" << 'EOF'
Error report content
EOF

cat > "$CHAPTER3/normal_file.txt" << 'EOF'
Normal file content
EOF

cat > "$CHAPTER3/script1.py" << 'EOF'
print("Hello from script 1")
EOF

cat > "$CHAPTER3/script2.py" << 'EOF'
print("Hello from script 2")
EOF

cat > "$CHAPTER3/script3.py" << 'EOF'
print("Hello from script 3")
EOF

cat > "$CHAPTER3/file.txt" << 'EOF'
This is a sample file.
It contains multiple lines of text.
We can use it for pipeline examples.
Each line has different content.
EOF

cat > "$CHAPTER3/users.txt" << 'EOF'
alice:x:1001:1001:Alice User:/home/alice:/bin/bash
bob:x:1002:1002:Bob User:/home/bob:/bin/bash
charlie:x:1003:1003:Charlie User:/home/charlie:/bin/sh
diana:x:1004:1004:Diana User:/home/diana:/bin/bash
EOF

cat > "$CHAPTER3/access.log" << 'EOF'
IP: 192.168.1.100 Request successful
IP: 192.168.1.101 Request successful
IP: 192.168.1.100 Request failed
IP: 192.168.1.102 Request successful
IP: 192.168.1.100 Request successful
IP: 192.168.1.103 Request successful
EOF

cat > "$CHAPTER3/app.log" << 'EOF'
2024-01-01 10:00:00 error: Connection failed
2024-01-01 10:05:23 System started
2024-01-01 10:10:45 error: File not found
2024-01-01 10:15:12 Operation completed
EOF

cat > "$CHAPTER3/server.log" << 'EOF'
2024-01-01 10:20:30 error: Timeout occurred
2024-01-01 10:25:55 Request processed
2024-01-01 10:30:18 error: Connection failed
EOF

cat > "$CHAPTER3/data.csv" << 'EOF'
Alice,Engineer,50000
Bob,Manager,75000
Charlie,Engineer,55000
Diana,Designer,60000
Alice,Engineer,52000
Bob,Manager,76000
Charlie,Engineer,56000
EOF

# redirection: unsorted.txt, document.txt, numbers_unsorted.txt (for sort -n and redirection)
cat > "$CHAPTER3/unsorted.txt" << 'EOF'
zebra
apple
banana
cherry
date
EOF

cat > "$CHAPTER3/document.txt" << 'EOF'
This is a sample document with multiple words.
It contains several sentences for word counting.
We can use this file to practice input redirection.
EOF

cat > "$CHAPTER3/numbers_unsorted.txt" << 'EOF'
30
10
50
20
40
EOF

# sort/uniq: names, numbers, items, mixed_case, duplicates, data.txt, numbers_spaces, dates, unsorted_dupes.txt
cat > "$CHAPTER3/names.txt" << 'EOF'
John
Jane
Jim
Jill
John
Jane
EOF

cat > "$CHAPTER3/numbers.txt" << 'EOF'
10
20
30
40
EOF

cat > "$CHAPTER3/items.txt" << 'EOF'
apple
banana
orange
EOF

cat > "$CHAPTER3/mixed_case.txt" << 'EOF'
Apple
banana
Cherry
date
EOF

cat > "$CHAPTER3/duplicates.txt" << 'EOF'
apple
banana
apple
orange
banana
cherry
EOF

cat > "$CHAPTER3/data.txt" << 'EOF'
Alice 25 Engineer
Bob 30 Manager
Charlie 22 Student
Diana 28 Designer
EOF

cat > "$CHAPTER3/numbers_spaces.txt" << 'EOF'
   5
  15
   2
  10
EOF

cat > "$CHAPTER3/dates.txt" << 'EOF'
January
March
December
February
June
EOF

cat > "$CHAPTER3/unsorted_dupes.txt" << 'EOF'
apple
banana
apple
orange
banana
apple
cherry
EOF

# tee: original.txt, data_tee.txt (with errors for filtering), file_tee.txt (duplicates), diff1.txt, diff2.txt
cat > "$CHAPTER3/original.txt" << 'EOF'
zebra
apple
banana
cherry
date
EOF

cat > "$CHAPTER3/data_tee.txt" << 'EOF'
2024-01-01 10:00:00 System started
2024-01-01 10:05:23 error: Connection failed
2024-01-01 10:10:45 User logged in
2024-01-01 10:15:12 error: File not found
2024-01-01 10:20:30 Request processed
2024-01-01 10:25:55 error: Timeout occurred
2024-01-01 10:30:18 Operation completed
EOF

cat > "$CHAPTER3/file_tee.txt" << 'EOF'
banana
apple
cherry
banana
date
apple
EOF

cat > "$CHAPTER3/diff1.txt" << 'EOF'
Line one
Line two
Line three
Line four
EOF

cat > "$CHAPTER3/diff2.txt" << 'EOF'
Line one
Line two modified
Line three
Line five
EOF

# Chapter 4: practice files for expansion lesson (pathname, tilde, brace examples)
CHAPTER4=~/playground/chapter4
mkdir -p "$CHAPTER4"

# Pathname expansion: *.txt, file?.txt
cat > "$CHAPTER4/file1.txt" << 'EOF'
first
EOF
cat > "$CHAPTER4/file2.txt" << 'EOF'
second
EOF
cat > "$CHAPTER4/file3.txt" << 'EOF'
third
EOF
cat > "$CHAPTER4/fileA.txt" << 'EOF'
file A
EOF

# [a-c]*.jpg, *[0-9]*, [!0-9]*, [[:alpha:]]*
touch "$CHAPTER4/a.jpg" "$CHAPTER4/b.jpg" "$CHAPTER4/c.jpg"
cat > "$CHAPTER4/doc1.txt" << 'EOF'
doc 1
EOF
cat > "$CHAPTER4/doc2.txt" << 'EOF'
doc 2
EOF
cat > "$CHAPTER4/alpha.txt" << 'EOF'
alpha
EOF
cat > "$CHAPTER4/beta.txt" << 'EOF'
beta
EOF

# *.{txt,md}, *.{jpg,png,gif}
cat > "$CHAPTER4/readme.md" << 'EOF'
# Readme
EOF
cat > "$CHAPTER4/notes.md" << 'EOF'
# Notes
EOF
touch "$CHAPTER4/image1.jpg" "$CHAPTER4/image2.png" "$CHAPTER4/image3.gif"

# *[0-9][a-z].txt
cat > "$CHAPTER4/file1a.txt" << 'EOF'
file 1a
EOF
cat > "$CHAPTER4/file2b.txt" << 'EOF'
file 2b
EOF

# **/*.txt (subdirectory with .txt file)
mkdir -p "$CHAPTER4/subdir"
cat > "$CHAPTER4/subdir/other.txt" << 'EOF'
in subdir
EOF

# quotes lesson: file with space in name (for mv "Old Name.txt" "New Name.txt" example)
cat > "$CHAPTER4/Old Name.txt" << 'EOF'
old file with space in name
EOF

# Chapter 4: locate and find lesson — practice directory for locate/find examples
LOCATE_FIND="$CHAPTER4/locate_find"
mkdir -p "$LOCATE_FIND"
mkdir -p "$LOCATE_FIND/test"

# locate "homework"
cat > "$LOCATE_FIND/homework1.txt" << 'EOF'
homework 1
EOF
cat > "$LOCATE_FIND/homework2.txt" << 'EOF'
homework 2
EOF
touch "$LOCATE_FIND/my_homework.pdf"

# locate -i "report" (Report.pdf, REPORT.txt, weekly_report)
touch "$LOCATE_FIND/Report.pdf"
cat > "$LOCATE_FIND/REPORT.txt" << 'EOF'
REPORT content
EOF
cat > "$LOCATE_FIND/weekly_report.txt" << 'EOF'
weekly report
EOF

# locate -n 5 "*.pdf" and locate -c "*.py"
touch "$LOCATE_FIND/sample1.pdf" "$LOCATE_FIND/sample2.pdf" "$LOCATE_FIND/sample3.pdf"
touch "$LOCATE_FIND/sample4.pdf" "$LOCATE_FIND/sample5.pdf" "$LOCATE_FIND/sample6.pdf"
cat > "$LOCATE_FIND/file1.py" << 'EOF'
print("file1")
EOF
cat > "$LOCATE_FIND/file2.py" << 'EOF'
print("file2")
EOF
cat > "$LOCATE_FIND/script.py" << 'EOF'
print("script")
EOF

# find . -name "*.txt", . -empty, . -perm 0777
cat > "$LOCATE_FIND/notes.txt" << 'EOF'
notes
EOF
cat > "$LOCATE_FIND/data.txt" << 'EOF'
data
EOF
touch "$LOCATE_FIND/empty.txt"
# empty directory already created as locate_find/test; add another empty dir
mkdir -p "$LOCATE_FIND/empty_dir"

# find . -type f -size +100M and find . -type f -size +10M -size -100M (practice files)
dd if=/dev/zero of="$LOCATE_FIND/large_file.dat" bs=1M count=150 2>/dev/null || true
dd if=/dev/zero of="$LOCATE_FIND/medium_file.dat" bs=1M count=50 2>/dev/null || true

touch "$LOCATE_FIND/insecure.txt"
chmod 0777 "$LOCATE_FIND/insecure.txt" 2>/dev/null || true

# find . \( -name "*.png" -or -name "*.jpg" \)
touch "$LOCATE_FIND/image1.png" "$LOCATE_FIND/image2.jpg"

# find . \( -name "*.docx" -o -name "*.pdf" \)
touch "$LOCATE_FIND/doc1.docx"
touch "$LOCATE_FIND/doc2.pdf"

# find . -type f \( -name "*.java" -o -name "*.py" \) -not -path "*/test/*"
cat > "$LOCATE_FIND/Main.java" << 'EOF'
public class Main { }
EOF
cat > "$LOCATE_FIND/main.py" << 'EOF'
print("main")
EOF
cat > "$LOCATE_FIND/test/Test.java" << 'EOF'
public class Test { }
EOF
cat > "$LOCATE_FIND/test/test.py" << 'EOF'
print("test")
EOF

# find . -type f -executable -not -name "*.sh" (one executable without .sh)
cat > "$LOCATE_FIND/run_me" << 'EOF'
#!/bin/bash
echo "run_me"
EOF
chmod +x "$LOCATE_FIND/run_me" 2>/dev/null || true

# Reminder: run "sudo updatedb" after setup so locate finds these files

# Chapter 6: jobs, fg, bg lesson — script that writes a count to a file every 5 seconds
# Students run it in foreground (fg) or background (bg) and watch the output file to see the difference.
CHAPTER6=~/playground/chapter6
mkdir -p "$CHAPTER6"
cat > "$CHAPTER6/count_loop.sh" << 'COUNTEOF'
#!/bin/bash
# For the jobs/fg/bg lesson: writes a counter to a file every 5 seconds.
# Run in foreground: ./count_loop.sh  (terminal is busy; use Ctrl-Z to pause, then bg to run in background)
# Run in background: ./count_loop.sh &   then watch with: tail -f count_output.txt
OUTFILE="${1:-count_output.txt}"
count=0
echo "Started at $(date). Writing to $OUTFILE every 5 seconds. Use Ctrl-Z to pause, Ctrl-C to stop." > "$OUTFILE"
while true; do
  ((count++))
  echo "$(date '+%H:%M:%S') count=$count" >> "$OUTFILE"
  sleep 5
done
COUNTEOF
chmod +x "$CHAPTER6/count_loop.sh" 2>/dev/null || true

# Chapter 7: ping, network, wget/sftp, archiving — practice files and directories
CHAPTER7=~/playground/chapter7
mkdir -p "$CHAPTER7"

# Ping lesson: list of hosts for batch-style practice (ping -c 4 from script or manually)
cat > "$CHAPTER7/hosts_to_ping.txt" << 'EOF'
8.8.8.8
google.com
EOF

# Wget/SFTP lesson: URLs for wget -i and sample files for SFTP get/put practice
mkdir -p "$CHAPTER7/sftp_practice"
cat > "$CHAPTER7/sftp_practice/urls_to_download.txt" << 'EOF'
https://www.wccnet.edu/
EOF
cat > "$CHAPTER7/sftp_practice/important.txt" << 'EOF'
Sample file for SFTP get/put practice.
EOF
cat > "$CHAPTER7/sftp_practice/report.txt" << 'EOF'
Sample report for upload practice.
EOF

# Archiving lesson: files and directories for tar, gzip, zip examples
ARCHIVE_DIR="$CHAPTER7/archiving"
mkdir -p "$ARCHIVE_DIR"
mkdir -p "$ARCHIVE_DIR/src" "$ARCHIVE_DIR/docs" "$ARCHIVE_DIR/logs"
echo "Essay content for archiving practice." > "$ARCHIVE_DIR/essay.docx"
echo "Research content." > "$ARCHIVE_DIR/research.pdf"
cat > "$ARCHIVE_DIR/notes.txt" << 'EOF'
Notes for archiving practice.
EOF
cat > "$ARCHIVE_DIR/README.md" << 'EOF'
# Project
Practice archive.
EOF
cat > "$ARCHIVE_DIR/src/main.sh" << 'EOF'
#!/bin/bash
echo "main"
EOF
cat > "$ARCHIVE_DIR/docs/guide.txt" << 'EOF'
Guide content.
EOF
cat > "$ARCHIVE_DIR/logs/app.log" << 'EOF'
log line 1
log line 2
EOF
# Single file for gzip examples (compress one file, decompress)
cat > "$ARCHIVE_DIR/large_file.txt" << 'EOF'
Sample content for gzip practice. This file can be compressed with gzip and then decompressed with gzip -d.
EOF
echo "Report content." > "$ARCHIVE_DIR/report.docx"
echo "col1,col2" > "$ARCHIVE_DIR/data.csv"
touch "$ARCHIVE_DIR/images.jpg"

# Chapter 8: Package management — no practice files; students use system apt/snap/flatpak
CHAPTER8=~/playground/chapter8
mkdir -p "$CHAPTER8"

# Chapter 9: join, diff, tr practice files (cut/paste/join, comm/diff/patch, tr/sed/awk/aspell)
CHAPTER9=~/playground/chapter9
mkdir -p "$CHAPTER9"

# join/cut/paste lesson: cut (students.csv), paste (names.txt, scores.txt, shopping.txt), join (students.txt, grades.txt, students_csv.txt, grades_csv.txt, employees.txt, projects.txt)
cat > "$CHAPTER9/students.csv" << 'EOF'
ID,First Name,Last Name,Major,GPA
101,John,Doe,Computer Science,3.8
102,Jane,Smith,Biology,3.9
103,Mike,Johnson,Engineering,3.5
EOF

cat > "$CHAPTER9/names.txt" << 'EOF'
John
Jane
Mike
EOF

cat > "$CHAPTER9/scores.txt" << 'EOF'
85
92
78
EOF

cat > "$CHAPTER9/shopping.txt" << 'EOF'
Apples
Bananas
Milk
Bread
Eggs
Cheese
EOF

cat > "$CHAPTER9/students.txt" << 'EOF'
101 John Doe
102 Jane Smith
103 Mike Johnson
EOF

cat > "$CHAPTER9/grades.txt" << 'EOF'
101 A
102 B
103 B
EOF

cat > "$CHAPTER9/students_csv.txt" << 'EOF'
101,John,Doe
102,Jane,Smith
103,Mike,Johnson
EOF

cat > "$CHAPTER9/grades_csv.txt" << 'EOF'
101,A
102,B
103,B
EOF

cat > "$CHAPTER9/employees.txt" << 'EOF'
alice Alice Smith
bob Bob Jones
charlie Charlie Brown
EOF

cat > "$CHAPTER9/projects.txt" << 'EOF'
alice ProjectAlpha
bob ProjectBeta
EOF

# diff/comm/patch lesson: comm (todo1.txt, todo2.txt), diff/patch (recipe_v1.txt, recipe_v2.txt)
cat > "$CHAPTER9/todo1.txt" << 'EOF'
buy groceries
clean kitchen
finish homework
pay bills
EOF

cat > "$CHAPTER9/todo2.txt" << 'EOF'
buy groceries
call mom
finish homework
schedule dentist
EOF

cat > "$CHAPTER9/recipe_v1.txt" << 'EOF'
Pancake Recipe
--------------
2 cups flour
1 tablespoon sugar
1 teaspoon salt
2 eggs
1 cup milk
EOF

cat > "$CHAPTER9/recipe_v2.txt" << 'EOF'
Pancake Recipe
--------------
2 cups flour
2 tablespoons sugar
1 teaspoon baking powder
1 teaspoon salt
2 eggs
1 1/2 cups milk
EOF

# tr/sed/awk/aspell lesson: tr (message.txt), sed (email.txt), awk (sales.csv), aspell (report.txt)
cat > "$CHAPTER9/message.txt" << 'EOF'
hello   world!
this is SOME text with MiXeD case.
too    many     spaces   here.
EOF

cat > "$CHAPTER9/email.txt" << 'EOF'
Customer order #12345
Thank you for your order.
We will process your order soon.
Contact: support@example.com
EOF

cat > "$CHAPTER9/sales.csv" << 'EOF'
Item,Price,Quantity
Widget,25,10
Gadget,75,5
Gizmo,50,20
EOF

cat > "$CHAPTER9/report.txt" << 'EOF'
This is a sample report with some misspelled wrds.
Check the contenet for errors.
EOF

# Chapter 10: Vim and Bash scripting — practice files and directories
CHAPTER10=~/playground/chapter10
mkdir -p "$CHAPTER10" "$CHAPTER10/scripting"

# Vim lesson: files to open, edit, and use for multi-file/split examples
cat > "$CHAPTER10/myfile.txt" << 'EOF'
Hello, world!
This is a file for practicing Vim.
Use i to insert, Esc to return to Command mode.
Try gg to go to the top, G to go to the bottom.
EOF

cat > "$CHAPTER10/file1.txt" << 'EOF'
First file for Vim practice.
Line two.
Line three.
EOF

cat > "$CHAPTER10/file2.txt" << 'EOF'
Second file for split-screen practice.
EOF

cat > "$CHAPTER10/file3.txt" << 'EOF'
Third file for buffer and split examples.
EOF

# Bash lesson: foo.txt for variable/command-substitution example; scripting/ for navigation example
cat > "$CHAPTER10/foo.txt" << 'EOF'
Contents of foo.txt for command substitution.
EOF

# Chapter 11: Functions and conditionals — practice files for function (foo.txt) and if (data.txt)
CHAPTER11=~/playground/chapter11
mkdir -p "$CHAPTER11"

# Functions lesson: comm() example reads foo.txt (output: "the contents of the foo file is ...")
cat > "$CHAPTER11/foo.txt" << 'EOF'
this is the foo.txt file text
EOF

# Conditionals lesson: file test operator (-f) example checks if data.txt exists
cat > "$CHAPTER11/data.txt" << 'EOF'
Sample data for the file test operator example.
EOF

# Chapter 12: Loops and arrays — practice file for loops (sometext.txt; arrays examples need no files)
CHAPTER12=~/playground/chapter12
mkdir -p "$CHAPTER12"

# Loops lesson: "While loop processing a file character by character" reads sometext.txt (looks for "a")
cat > "$CHAPTER12/sometext.txt" << 'EOF'
sample text with a few a's for the character loop example
EOF

# Chapter 13: Strings/numbers and troubleshooting — practice files for examples
CHAPTER13=~/playground/chapter13
mkdir -p "$CHAPTER13"

# Strings lesson: "Finding the longest word" and "Performance" examples use a file of words
cat > "$CHAPTER13/file.txt" << 'EOF'
apple banana cherry date elderberry fig grape
hello world programming scripting bash shell
internationalization documentation configuration
one two three four five six seven eight nine ten
EOF

# Troubleshooting lesson: trace example shows "notes.txt has 42 lines" and "report.txt has 157 lines"
for i in {1..42}; do echo "Line $i"; done > "$CHAPTER13/notes.txt"
for i in {1..157}; do echo "Report line $i"; done > "$CHAPTER13/report.txt"