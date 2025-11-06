# structure_flutter_app

Opinionated Flutter project structure as a reusable Mason brick. Generate the same clean, scalable layout in any project with a single command.

## Why
- Consistent folder structure across apps.
- Faster bootstrapping for new projects and features.
- Built-in assets wiring (images/svg) via a post-gen hook.

## What it generates

Top-level:
- `assets/` (fonts, images, svg)
- `firebase/`
- `lib/`
	- `core/`
		- `network/` (api_client.dart, api_constant.dart)
		- `router/` (app_router.dart, route_names.dart)
		- `themes/` (app_color.dart, app_theme.dart, responsive_screen.dart)
		- `utils/` (app_constants.dart, images.dart, utils.dart)
	- `data/`
		- `local/` (local_storage.dart)
		- `models/` (empty, ready for your models)
		- `repositories/` (empty)
		- `sources/` (empty)
		- `providers/` (empty)
	- `presentation/`
		- `screens/` (empty)
		- `widgets/` (appbar_widget.dart, button_widget.dart, circular_progress_widget.dart, text_form_field_widget.dart, text_widget.dart)

Post-gen hook updates `pubspec.yaml` to include:
- `assets/images/`
- `assets/svg/`

Fonts are not auto-configured; add them under `flutter: fonts:` when you include actual files.

## Use the brick in any project

1) Install Mason (once):
```powershell
dart pub global activate mason_cli
```

2) Add the brick (choose one):
- From GitHub (recommended):
```powershell
mason add flutter_structure --git-url https://github.com/your-username/structure_flutter_app.git --git-path bricks/flutter_structure
```
- From local path (within this repo):
```powershell
mason add flutter_structure --path ./bricks/flutter_structure
```

3) Generate inside your Flutter project root:
```powershell
mason make flutter_structure --package_name your_package_name
flutter pub get
```

Replace `your_package_name` with the `name` from your project's `pubspec.yaml`.

## Notes
- Generation is idempotent; use `--on-conflict skip` to avoid overwriting existing files.
- After adding assets, run `flutter pub get`.
- You can fork this repo and customize the brick to your team’s conventions.
