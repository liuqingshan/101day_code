require_relative "../command"

class MicroCommand < Command

  def initialize(commands)
    @commands = commands
  end

  def execute
    @commands.each do |cmd|
       cmd.execute
    end
  end

  def undo
    @commands.each do |cmd|
      cmd.undo
    end
  end
end