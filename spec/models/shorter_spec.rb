require 'rails_helper'

RSpec.describe Shorter, type: :model do
  it 'should create a Link' do
    link1 = Shorter.create({long_url: 'www.google.com',short_url: 'qwer'})
    link2 = Shorter.create({long_url: 'www.twitter.com',short_url: 'werk'})
    link3 = Shorter.create({long_url: 'www.facebook.com',short_url: 'rytw'})

    expect(link1).to be_valid
    expect(link2).to be_valid
  end

  it "should require a long_url" do
    expect(Shorter.new(:long_url => "")).not_to be_valid
  end

  it "should require a short_url" do
    expect(Shorter.new(:short_url => "")).not_to be_valid
  end

  it "should have a unique short_url" do
    Shorter.create({long_url: 'www.google.com', short_url: 'Foo'})
    shorter = Shorter.create({long_url: 'www.google.com', short_url: 'Foo'})
    expect(shorter).not_to be_valid
  end
end
