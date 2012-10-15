require 'benchmark'
require 'open3'
module Dropkick
  class Command
    def self.secure_exec(command, arguments = [])
      stdout = nil
      stderr = nil
      exit_code = nil 

      command_array = arguments.unshift(command)

      duration = Benchmark.realtime do
        Open3.popen3(*command_array) do |stdin, out, err, wait_thr|
          stdout = out.read
          stderr = err.read
          exit_code = wait_thr.value.exitstatus
        end
      end
      
      CommandResult.new(stdout, stderr, exit_code, duration)
    end
  end
end
