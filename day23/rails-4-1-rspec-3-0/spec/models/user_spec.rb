require "rails_helper"

describe User do

#  it "is valid with a name, email" do
#    expect(build(:user)).to be_valid
#  end
#
#  it "is invalid without a name" do
#    user = build(:user, name: nil)
#
#    user.valid?
#    expect(user.errors[:name]).to include("can't be blank")
#  end
#
#  it "is invalid without a email" do
#    user = build(:user, email: nil)
#
#    user.valid?
#    expect(user.errors[:email]).to include("can't be blank")
#  end
#
#  it "is invalid without a duplicate email address" do
#    create(:user, name: "zhangsan", email: "zhangsan@test.com")
#    user = build(:user, name: "lisi", email: "zhangsan@test.com")
#
#    user.valid?
#    expect(user.errors[:email]).to include("has already been taken")
#  end
#
#  it "returns a sorted array of results that match" do
#    zhangsan = create(:user, name: "zhangsan")
#    zhangming = create(:user, name: "zhangming")
#    xiaoming = create(:user, name: "xiaoming")
#
#    expect(User.match_name("zhang")).to eq [zhangming, zhangsan]
#    expect(User.match_name("zhang")).not_to include xiaoming
#  end
end
