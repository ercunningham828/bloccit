require 'rails_helper'

describe Vote do
  describe "validations" do
    before do
      @vote=Vote.create(value: 1)
      @badvote=Vote.create(value: 5)
  end

  describe "value validation" do
    it "only allows -1 or 1 as values" do
      expect(@vote.valid?).to eq(true)
    end
  end

  describe "invalid vote" do
    it "only allows -1 or 1 as values" do
      expect(@badvote.valid?).to eq(false)
    end
  end
end
end
