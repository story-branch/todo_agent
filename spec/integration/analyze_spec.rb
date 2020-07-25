RSpec.describe "`todo_agent run` command", type: :cli do
  it "executes `todo_agent help run` command successfully" do
    output = `todo_agent help run`
    expected_output = <<-OUT
Usage:
  todo_agent run [PATH]

Options:
  -h, [--help], [--no-help]  # Display usage information

Run todo tracker on tree from path
    OUT

    expect(output).to eq(expected_output)
  end
end
