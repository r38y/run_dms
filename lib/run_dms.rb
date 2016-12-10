require "run_dms/client"

module RunDMS
  def self.snitch(id, cond: true, debug: false, &block)
    dead_man = Client.new(id, cond: cond, debug: debug)
    block.call
    dead_man.snitch
  end
end
