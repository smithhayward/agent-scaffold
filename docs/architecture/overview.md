# System Overview

## Components

<!-- Describe the major components: broker connections, adapter layer, router/dispatcher, canonical model transformer, outbound sinks -->

## Data flow

```
[Device] → [Inbound Adapter] → [Canonical Message] → [Router] → [Outbound Adapter] → [Consumer]
```

<!-- Expand with a real diagram once the design is set -->

## Failure modes

<!-- Describe what happens when: a broker disconnects, a payload is malformed, the router is overloaded -->
