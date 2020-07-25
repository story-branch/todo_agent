require 'todo_tracker/commands/run'

RSpec.describe TodoTracker::Commands::Run do
  it "executes `run` command successfully" do
    output = StringIO.new
    path = nil
    options = {}
    command = TodoTracker::Commands::Run.new(path, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
