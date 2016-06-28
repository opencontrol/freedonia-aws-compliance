
control 'sg-1' do
  impact 1.0
  title 'Security Group: No ingress access to CIDR block 0.0.0.0/0'
  desc 'Security Groups must not allow inbound access from anywhere'

  describe Vpc.new(id:'vpc-e81ba68f') do
     its(:id) { should eq 'vpc-e81ba68f' }
  end
end

control 'sg-2' do
  impact 0.9
  title 'a'
  desc  'b'

  Vpc.new(id: 'vpc-e81ba68f').security_groups.each do |security_group|
    describe SecurityGroup.new(id:security_group.id) do
      it { should_not have_ingress_rule().with_source('0.0.0.0/0') }
    end
  end
end
