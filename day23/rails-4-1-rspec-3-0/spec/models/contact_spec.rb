require "rails_helper"

describe Contact do
  it "is valid with a firstname, lastname and email" do
    contact = Contact.new(
      firstname: "Aaron",
      lastname: "Sumner",
      email: "test@example.com"
    )
    expect(contact).to be_valid
  end
  it "is valid without a firstname" do
    contact = Contact.new(
      firstname: nil,
      lastname: "Sumner",
      email: "test@example.com"
    )
    expect(contact).not_to be_valid
    expect(contact.errors[:firstname]).to include("can't be blank")
  end
  it "is valid without a lastname" do
     contact = Contact.new(lastname: nil)
     contact.valid?
     expect(contact.errors[:lastname]).to include("can't be blank")
  end
  it "is valid with an email address" do
     contact = Contact.new(email: nil)
     contact.valid?
     expect(contact.errors[:email]).to include("can't be blank")
  end
  it "is valid with a duplicate email address" do
    Contact.create(
      firstname: "zhangsan", lastname: "Lisi",
      email: "1@1.com"
    )

    contact = Contact.new(
      firstname: "zhangsan", lastname: "Lisi",
      email: "1@1.com"
    )

    contact.valid?
    expect(contact.errors[:email]).to include("has already been taken")
  end

  it "return a contact's full name as a string" do
     contact = Contact.new(firstname: "san", lastname: "zhang", email: "zhangsan@1.com")
     expect(contact.name).to eq "san zhang"
  end

  it "returns a sorted array of results that match" do
    c1 = Contact.create(
       firstname: "ming",
       lastname: "xiao",
       email: "xiaoming@1.com"
    )

    c2 = Contact.create(
       firstname: "san1",
       lastname: "min",
       email: "mingsan@1.com"
    )

    c3 = Contact.create(
       firstname: "san2",
       lastname: "min",
       email: "minsan@1.com"
    )
    expect(Contact.by_letter("m")).to eq [c2, c3]
    expect(Contact.by_letter("m")).not_to include c1
  end
end

# https://github.com/rspec/rspec-expectations
