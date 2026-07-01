# Canonical Data Model

The normalized message format that all protocol adapters must produce (inbound) and consume (outbound). Adapters translate to/from this model - they never pass raw protocol frames to downstream consumers.

## Envelope

<!-- Define the top-level message envelope: device ID, timestamp, topic/channel, payload type -->

## Payload types

<!-- List the typed payload schemas (telemetry, command, event, ack, error) -->

## Versioning

<!-- Describe how the model version is carried in messages and how adapters handle version mismatches -->