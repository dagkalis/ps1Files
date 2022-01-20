$branch= &git rev-parse --abbrev-ref HEAD
echo "git pull origin $branch"
git pull origin $branch