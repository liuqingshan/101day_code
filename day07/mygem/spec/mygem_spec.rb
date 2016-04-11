require 'spec_helper'

describe Mygem do
  it 'has a version number' do
    expect(Mygem::VERSION).not_to be nil
  end

  it 'should be say hello' do
    expect(Mygem.hello).to eq("hello mygem!")
  end
end
