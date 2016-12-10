require "spec_helper"

describe RunDMS do
  it "has a version number" do
    expect(RunDMS::VERSION).not_to be nil
  end

  describe ".snitch(token)" do
    it "can be called" do
      described_class.snitch("test", cond: false) {  }
    end
  end
end
