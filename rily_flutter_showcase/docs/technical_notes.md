# Technical Notes

## Architecture

The project uses a feature-first architecture:

- `core`: shared constants, theme, network and reusable widgets.
- `features/auth`: login and session state.
- `features/beauty`: salon listing and details.
- `features/parking`: parking listing and details.
- `features/reservations`: booking history and creation.

## State Management

Provider is used because it is simple, readable and suitable for junior/mid-level Flutter projects.

## Error Handling

Each provider exposes:

- `isLoading`
- `errorMessage`
- domain data

This makes the UI easy to debug and extend.

## Production Readiness

To make this production-ready, the next steps are:

1. replace `MockApiClient` with secured HTTP calls;
2. add token persistence;
3. add refresh-token handling;
4. add form validation layer;
5. add CI build artifacts;
6. add Play Store / App Store release checklist.
