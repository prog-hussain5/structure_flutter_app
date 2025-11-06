# structure_flutter_app
## ♻️ إعادة الاستخدام في أي مشروع (Mason)

للاستخدام المتكرر في أي مشروع Flutter آخر، أضفنا Brick جاهز لمولّد Mason داخل `bricks/flutter_structure`:

1) تثبيت Mason (مرة واحدة على جهازك):

```powershell
dart pub global activate mason_cli
```

2) في أي مشروع Flutter، أضف الـ Brick (من هذا المسار المحلي أو من Git لاحقًا):

```powershell
# إذا نسخت مجلد bricks معك، أو تعمل من هذا الريبو
mason add flutter_structure -s path ./bricks/flutter_structure
```

3) وللتوليد داخل جذر المشروع الهدف:

```powershell
mason make flutter_structure --package_name your_package_name
```

هذا سيُنشئ نفس الهيكل ويُحدّث `pubspec.yaml` تلقائيًا لمسارات الأصول.

ملاحظة: استبدل `your_package_name` باسم الباكيج في `pubspec.yaml:name` لمشروعك (مثال: `structure_flutter_app`).

## ♻️ إعادة الاستخدام في أي مشروع (Mason)

للاستخدام المتكرر في أي مشروع Flutter آخر، أضفنا Brick جاهز لمولّد Mason داخل `bricks/flutter_structure`:

1) تثبيت Mason (مرة واحدة على جهازك):

```powershell
dart pub global activate mason_cli
```

2) في أي مشروع Flutter، أضف الـ Brick (من هذا المسار المحلي أو من Git لاحقًا):

```powershell
# إذا نسخت مجلد bricks معك، أو تعمل من هذا الريبو
mason add flutter_structure -s path ./bricks/flutter_structure
```

3) وللتوليد داخل جذر المشروع الهدف:

```powershell
mason make flutter_structure --package_name your_package_name
```

هذا سيُنشئ نفس الهيكل ويُحدّث `pubspec.yaml` تلقائيًا لمسارات الأصول.

ملاحظة: استبدل `your_package_name` باسم الباكيج في `pubspec.yaml:name` لمشروعك (مثال: `structure_flutter_app`).



A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
