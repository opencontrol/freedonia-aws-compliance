
```
# Make sure you have env vars for
# AWS_REGION
# AWS_ACCESS_KEY_ID
# AWS_SECRET_ACCESS_KEY

alias tf='terraform'
tf plan
tf apply

tf output
export VPCID=$(tf output | cut -d ' ' -f 3)
cd inspec
bundle exec runner.rb
```
