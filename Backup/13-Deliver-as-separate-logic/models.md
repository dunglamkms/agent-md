# Model Defaults

Shared baseline for all agents. Agents inherit unless overridden.

## Defaults

| Setting       | Value                      |
|---------------|----------------------------|
| `provider`    | copilot                    |
| `model`       | Claude Sonnet 4 (copilot)  |
| `temperature` | 0.3                        |
| `max_tokens`  | 2048                       |
| `timeout`     | 30                         |

## Debug Flags

| Flag             | Value |
|------------------|-------|
| `debug_config`   | off   |
| `debug_dispatch` | off   |
| `debug_memory`   | off   |
| `debug_merge`    | off   |

## Debug Log

| Setting          | Value                                    |
|------------------|------------------------------------------|
| `log_directory`  | `output/`                                |
| `log_filename`   | `debug-{topic-slug}-{YYYY-MM-DD}.log`    |
| `log_mode`       | `append`                                 |
| `log_format`     | `{ISO-timestamp} [DEBUG:{flag}] {message}` |
