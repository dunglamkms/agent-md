# Model Defaults

Shared baseline configuration for all agents. Each agent inherits these values unless it declares an override.

## Defaults

| Setting       | Value                      |
|---------------|----------------------------|
| `provider`    | copilot                    |
| `model`       | Claude Sonnet 4 (copilot)  |
| `temperature` | 0.3                        |
| `max_tokens`  | 2048                       |
| `timeout`     | 30                         |

> **Resolution rule:** If an agent's `## Model` section lists an override for a setting, the override wins. Any setting not listed in the agent inherits the default above.
