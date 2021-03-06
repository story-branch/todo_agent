require 'todo_agent/commands/run'

RSpec.describe TodoAgent::Commands::Run do
  it "executes `run` command successfully" do
    output = StringIO.new
    path = nil
    options = {}
    command = TodoAgent::Commands::Run.new(path, options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
