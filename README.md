
This repository is a work-in-progress on how to bundle together, for a particular system:
- the implementation (terraform, top-level)
- the system security plan (OpenControl in the directory: compliance/ )
- the system verification (Inspec, in the directory: inspec/)


## Implementation:

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

## Verification

Not yet fully functional:

```
cd inspec
bundle install --path vendor/bundle
bundle exec inspec exec ./profile
```

## Compliance

We break down compliance into components:
* AWS_core: The controls we have by dint of using AWS, period.
* AWS_implementation: The controls that come with this implementation + verification
