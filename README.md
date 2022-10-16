# Get Last Login for Github Commits

Github allows users to post websites for free but does not have an easy way to see when was the last user activity. This script generates a file that shows activity based on userid and last commit dates. The file is useful for checking last logins of users.

# Pre-requisites

a. Install pre-requisite programs using the command sudo apt install curl html2text grep gawk

b. Internet access to github from the installed machine.

# Example on how to use

a. Install the files in a directory.

b. Run ./getcommits.sh URL where URL is the commit page, eg https://github.com/repo-name/commits/master

c. You will get a tab delimited file finalresult.txt that has the ID and Date of Last Commit in YYYYMMDD format. Each ID has the last login date.

