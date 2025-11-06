## flutter_structure brick

This Mason brick scaffolds your requested Flutter structure:

- assets/{fonts, images, svg}
- firebase/
- lib/
   - core/
      - network/ (api_client.dart, api_constant.dart)
      - router/ (app_router.dart, route_names.dart)
      - themes/ (app_color.dart, app_theme.dart, responsive_screen.dart)
      - utils/ (app_constants.dart, images.dart, utils.dart)
   - data/
      - local/ (local_storage.dart)
      - models/
      - repositories/
      - sources/
      - providers/
   - presentation/
      - screens/
      - widgets/ (appbar_widget.dart, button_widget.dart, circular_progress_widget.dart, text_form_field_widget.dart, text_widget.dart)

It also updates `pubspec.yaml` to include `assets/images/` and `assets/svg/` via a post_gen hook.

Inputs:
- package_name: the Dart package name used in `package:` imports (defaults to `app`).

Usage:
1) Install Mason CLI (once): `dart pub global activate mason_cli`
2) Add the brick from this path:
   - Local path example: `mason add flutter_structure --path ./bricks/flutter_structure`
3) Generate in your Flutter project root:
   - `mason make flutter_structure --package_name your_package_name`
