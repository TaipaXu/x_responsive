# x_responsive

Utils for creating responsive widgets.

English | [中文](./README_ZH.md)

## Installation

```yaml
dependencies:
  x_responsive: ^0.1.0
```

## Usage

### Import

```dart
import 'package:x_responsive/x_responsive.dart';
```

### Usage

```dart
Responsive(
    condition: Condition(
        screenMin: Breakpoint.xs,
        screenMax: Breakpoint.md,
        platforms: [Platform.all],
    ),
    child: const Text('A'),
)
```

```dart
Responsive(
    condition:
        Condition.screenBetween(min: Breakpoint.sm, max: Breakpoint.md),
    child: const Text('B'),
)
```

```dart
Responsive(
    condition:
        Condition.screenBetween(min: Breakpoint.sm, max: Breakpoint.md)
            ..platforms([Platform.all]),
    child: const Text('C'),
)
```

```dart
Responsive.condition(
    condition: Condition.screenUp(Breakpoint.md),
    child: const Text('D'),
)
```

```dart
Responsive.conditions({
    Condition.screenBetween(min: Breakpoint.sm, max: Breakpoint.md):
        const Text('E'),
    Condition.screenBetween(min: Breakpoint.md, max: Breakpoint.xl):
        const Text('F'),
})
```

```dart
Responsive.conditions({
    Condition.screenUp(Breakpoint.xs): const Text('G'),
    Condition.screenUp(Breakpoint.sm): const Text('H'),
})
```

```dart
Container(
    child: Condition.screenUp(Breakpoint.md).check(context)
        ? const Text('I')
        : const Text('J'),
)
```
