require 'benchmark'
require 'open3'
class Command
  def self.secure_exec(command, arguments = [])
    stdout = nil
    stderr = nil
    exit_code = 100

    command_array = arguments.unshift(command)

    duration = Benchmark.realtime do
      begin
        Open3.popen3(*command_array) do |stdin, out, err, wait_thr|
          stdout = out.read
          stderr = err.read
          exit_code = wait_thr.value.exitstatus
        end
      rescue Exception => error
        stdout = '' if stdout.nil?
        stderr = error.message 
      end
    end
    
    CommandResult.new(stdout, stderr, exit_code, duration)
  end
end
