# Architecture
**Pattern:** Lightweight VIPER

## Engineering choices
- Swift + UIKit only (no SwiftUI)
- Storyboard owns initial navigation and root controller lifecycle
- Dependencies are injected from a composition root (`AppContainer`)
- Protocols isolate services/repositories for testability
- `async/await` is used for asynchronous flows
- Feature code is separated from infrastructure and UI helpers
