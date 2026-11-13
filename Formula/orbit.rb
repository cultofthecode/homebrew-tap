class Orbit < Formula
  desc "Run coding agents in sandboxes on OrbStack"
  homepage "https://github.com/cultofthecode/orbit"
  # The orbit release workflow sets url and sha256.
  url "https://github.com/cultofthecode/orbit/archive/refs/tags/v0.0.0-placeholder.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "Apache-2.0"
  head "https://github.com/cultofthecode/orbit.git", branch: "main"

  depends_on "go" => :build
  depends_on arch: :arm64
  depends_on :macos

  def install
    system "go", "build", *std_go_args(ldflags: "-X main.version=#{version}"), "./cmd/orbit"
    generate_completions_from_executable(bin/"orbit", "completion")
  end

  def caveats
    <<~EOS
      Orbit requires OrbStack, and does nothing without it. Install it with:
        brew install --cask orbstack
      or download it from https://orbstack.dev.
    EOS
  end

  test do
    assert_match "orbit version #{version}", shell_output("#{bin}/orbit --version")
    assert_match "complete", shell_output("#{bin}/orbit completion bash")
  end
end
