require "rails_helper"

RSpec.describe Trip, type: :model do

	describe "relationships" do
    it { should have_many(:trails).through(:trip_trails) }
		it { should have_many(:trip_trails) }
	end
end
