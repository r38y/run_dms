require "spec_helper"

module RunDMS
  describe Client do
    it "can be initialized" do
      described_class.new("test")
    end
  end
end
