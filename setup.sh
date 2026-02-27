#!/bin/bash

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

# Chapter 2: practice files and dirs for cp, mv, rm, wildcards, ln, less
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