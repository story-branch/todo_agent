RSpec.describe "`todo_tracker run` command", type: :cli do
  it "executes `todo_tracker help run` command successfully" do
    output = `todo_tracker help run`
    expected_output = <<-OUT
Usage:
  todo_tracker run [PATH]

Options:
  -h, [--help], [--no-help]  # Display usage information

Run todo tracker on tree from path
    OUT

    expect(output).to eq(expected_output)
  end
end
