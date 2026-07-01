# System Overview

## Components

**Ingestion layer** — receives telemetry from user-defined sources (webhook, MQTT subscription, HTTP poll). Normalizes raw payloads for downstream processing.

**Mapping engine** — applies user-defined rules to extract source fields and write their values into named variables. Maintains the current state of all variables.

**Variable store** — holds the current value, type, timestamp, and staleness state of every variable. Acts as the stable interface between ingestion and display.

**Layout service** — stores layout definitions (elements, bindings, dimensions). Composes a renderable payload by merging a layout with current variable values on demand.

**Device API** — the authenticated polling endpoint that ESP32 devices call. Returns a composed layout+values payload or a no-change signal.

**Management API** — the REST surface for operators to configure sources, variables, layouts, and device assignments.

## Data flow

```
[Source] → [Ingestion Layer] → [Mapping Engine] → [Variable Store]
                                                         ↓
[ESP32 Device] → polls → [Device API] → [Layout Service] → composed payload → [ESP32 renders]
```

## Key decoupling points

- **Sources and variables are decoupled** — a source can be replaced or reconfigured without changing layouts or device firmware
- **Variables and layouts are decoupled** — a layout can be redesigned without touching data sources or device config
- **Layouts and devices are decoupled** — a device's assigned layout can change without reflashing firmware

## Failure modes

<!-- Describe what happens when: a source goes silent (variable staleness), the service is unreachable (device fallback behavior), a layout references a deleted variable -->
