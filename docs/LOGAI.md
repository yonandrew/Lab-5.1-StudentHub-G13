
# AI Usage Log

## Group: G13 – StudentHub

**Contributor:** Muhammad Izzan Danish Bin Mohd Taufik  
**Matric Number:** 102754  
**Branch:** feature/102754-ai-refactor  
**Date:** 18 November 2026

## AI Tools Used

### 1. ChatGPT Codex

**Prompt:** Refactor the navigation state management by moving `_currentIndex` from `MainShell` into a separate Provider ChangeNotifier class. Preserve drawer and bottom navigation, use null-safe Dart, minimise unnecessary rebuilds, and maintain Flutter test compatibility.

**AI suggestion:** Created `NavigationProvider` using `ChangeNotifier` and refactored `MainShell` using `Consumer`.

**Decision:** Not selected for integration.

**Reason:** The implementation is concise and includes index validation, but its `Consumer` rebuilds the shell when the selected index changes. A more modular approach was preferred.

### 2. Claude

**Prompt:** The same navigation refactoring requirements were provided to Claude.

**AI suggestion:** Created `NavigationProvider` and separated the navigation interface into smaller widgets using `context.select`.

**Decision:** Accepted with modifications.

**Reason:** The implementation separates navigation components and reduces unnecessary rebuilds.

**Correction made:** Added runtime index validation using `RangeError.checkValueInInterval(index, 0, 4, 'index')` to ensure only valid navigation destinations can be selected.

## Code Review Notes

- Both implementations used null-safe Dart.
- Both moved navigation state outside the original StatefulWidget.
- Codex used `Consumer`, while Claude used `context.select`.
- Claude's original validation relied on assertions, which may be disabled in release mode.
- The selected implementation was improved with runtime index validation.
- No additional unused imports or analysis issues were reported after testing.

## Testing Results

- `dart format` – Completed.
- `flutter analyze` – No issues found.
- `flutter test` – All tests passed.
- Android Emulator – Navigation Drawer tested successfully.
- GitHub commit: `f996a43`.
- Pull Request: #5.

## AI Tool Comparison

Both ChatGPT Codex and Claude successfully suggested moving navigation state into a separate Provider class.

Codex produced a shorter implementation using `Consumer`, making its solution easier to follow. It also included runtime index validation. However, the main shell was rebuilt when navigation changed.

Claude produced a more modular implementation using `context.select` for the AppBar title, page body, drawer and bottom navigation. This structure was preferred because it separates the UI into smaller widgets and allows more targeted rebuilds. However, Claude's original validation used assertions, so runtime range checking was added.

The group selected the Claude-based implementation with improved index validation. Local Flutter analysis and automated tests passed after integration.
