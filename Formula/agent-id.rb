class AgentId < Formula
  desc "Give an AI coding agent its own GitHub App identity"
  homepage "https://github.com/cultofthecode/agent-id"
  url "https://github.com/cultofthecode/agent-id/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "081dd80b23da117bdfeaa8dc4f9d5ff7ce0b6f7028fbdb1d6f8cd16fec34abaf"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X main.version=#{version}"
    system "go", "build", *std_go_args(ldflags:, output: bin/"agent-id"), "./cmd/agent-id"
  end

  test do
    assert_match "agent-id version #{version}", shell_output("#{bin}/agent-id --version")
  end
end
