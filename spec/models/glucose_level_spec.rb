require "rails_helper"
RSpec.describe GlucoseLevel, :type => :model do
	let(:user) { FactoryGirl.create(:user) }
	subject { described_class.new(user_id: user.id, reading: 2) }

  it 'belongs to user' do
    assc = described_class.reflect_on_association(:user)
    expect(assc.macro).to eq :belongs_to
  end

	it 'without reading is not valid' do
		subject.reading = nil
		expect(subject).to_not be_valid
	end

	it 'without user is not valid' do
		subject.user_id = nil
		expect(subject).to_not be_valid
	end

	it 'with user and reading is valid' do
		expect(subject).to be_valid
	end

	it 'with two digit reading is not valid' do
		subject.reading = 12
		expect(subject).to_not be_valid
	end

	it 'with string type reading is not valid' do
		subject.reading = '12'
		expect(subject).to_not be_valid
	end
end