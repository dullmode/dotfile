## Prerequisites

# Install Docker (Debian)
# https://docs.docker.com/engine/install/debian/

# Add user to docker group (to run docker without sudo)
sudo usermod -aG docker $USER
# Log out and log back in for group changes to take effect

# Install audio player
sudo apt-get install -y alsa-utils

# Install uv (for MCP integration)
curl -LsSf https://astral.sh/uv/install.sh | sh

## Installation

# Pull VOICEVOX Docker image
docker pull voicevox/voicevox_engine:cpu-ubuntu20.04-latest

## Running VOICEVOX

# Run in background
docker run -d --name voicevox \
  -p 50021:50021 \
  voicevox/voicevox_engine:cpu-ubuntu20.04-latest

# Or run in foreground (to see logs)
docker run --rm -p 50021:50021 voicevox/voicevox_engine:cpu-ubuntu20.04-latest

## Docker Management

# Stop VOICEVOX
docker stop voicevox

# Start VOICEVOX
docker start voicevox

# Restart VOICEVOX
docker restart voicevox

# Remove VOICEVOX container
docker rm -f voicevox

# View logs
docker logs voicevox

# View real-time logs
docker logs -f voicevox

## Testing VOICEVOX Installation

# 1. Check if container is running
docker ps | grep voicevox

# 2. Check version (should return JSON with version info)
curl http://localhost:50021/version

# 3. Test speaker list (should return list of available voices)
curl http://localhost:50021/speakers | jq '.[0]'

# 4. Quick speech synthesis test
curl -s -X POST "http://localhost:50021/audio_query?text=テスト&speaker=3" | \
curl -s -X POST "http://localhost:50021/synthesis?speaker=3" \
  -H "Content-Type: application/json" -d @- -o test.wav && \
aplay test.wav && echo "Test successful!"

## Common Speaker IDs
- 3 = ずんだもん (Zundamon) - Normal
- 2 = 四国めたん (Shikoku Metan) - Normal
- 8 = 春日部つむぎ (Kasukabe Tsumugi)

## Usage Examples

# Generate and save speech
curl -s -X POST "http://localhost:50021/audio_query?text=こんにちは世界&speaker=3" | \
curl -s -X POST "http://localhost:50021/synthesis?speaker=3" \
  -H "Content-Type: application/json" -d @- -o hello.wav

# Play audio
aplay hello.wav

## Claude Code MCP Integration

# Add VOICEVOX MCP server (one-time setup)
claude mcp add --transport stdio voicevox --scope user -- uvx mcp-server-voicevox --voicevox-url=http://localhost:50021

# Verify MCP server is installed
claude mcp list

# Available MCP tools in Claude Code:
# - get_voices: List available VOICEVOX speakers
# - text_to_speech: Convert text to speech (text, speaker_id, speed)

## Troubleshooting

# Check Docker logs for errors
docker logs voicevox

# Check if port 50021 is available
sudo netstat -tulpn | grep 50021

# Restart container if needed
docker restart voicevox

# Force recreate container
docker rm -f voicevox
docker run -d --name voicevox -p 50021:50021 voicevox/voicevox_engine:cpu-ubuntu20.04-latest
