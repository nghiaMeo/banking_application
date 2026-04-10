# Feature-first structure

Each feature should follow this structure:

- `application/`: dependency wiring (providers/DI composition root)
- `presentation/`: UI pages, widgets, state providers/notifiers
- `domain/`: business entities and repository contracts
- `data/`: models, mappers, datasources, repository implementations

## Example

```text
features/
  auth/
    application/
    presentation/
    domain/
    data/
```

Keep dependencies one-way:

- `presentation -> domain`
- `application -> presentation/domain/data`
- `data -> domain`
- `presentation` must not import from `data` directly.
