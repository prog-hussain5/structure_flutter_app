import 'dart:convert';
import 'dart:io';
import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;
  final assetDirs = ['assets/images/', 'assets/svg/'];

  final pubspec = File('pubspec.yaml');
  if (!pubspec.existsSync()) {
    logger.warn('pubspec.yaml not found; skipping assets configuration');
    return;
  }

  final original = pubspec.readAsStringSync();
  final updated = _ensureAssetsInPubspec(original, assetDirs);
  if (updated != original) {
    pubspec.writeAsStringSync(updated);
    logger.info('Updated pubspec.yaml with assets: ${assetDirs.join(', ')}');
    logger.info('If you add fonts, remember to configure flutter: fonts: families.');
  } else {
    logger.detail('pubspec.yaml assets already configured.');
  }
}

String _ensureAssetsInPubspec(String yaml, List<String> assetDirs) {
  final lines = const LineSplitter().convert(yaml);

  int flutterIndex = -1;
  for (var i = 0; i < lines.length; i++) {
    if (lines[i].trim() == 'flutter:') {
      flutterIndex = i;
      break;
    }
  }
  if (flutterIndex == -1) return yaml;

  int insertBlockEnd = flutterIndex + 1;
  for (; insertBlockEnd < lines.length; insertBlockEnd++) {
    final line = lines[insertBlockEnd];
    if (line.trim().isEmpty) continue;
    final leadingSpaces = _countLeadingSpaces(line);
    if (leadingSpaces < 2 && !line.trim().startsWith('#')) {
      break;
    }
  }

  int assetsLineIndex = -1;
  for (var i = flutterIndex + 1; i < insertBlockEnd; i++) {
    if (lines[i].trim() == 'assets:' || lines[i].trim().startsWith('assets:')) {
      assetsLineIndex = i;
      break;
    }
  }

  final newLines = <String>[]..addAll(lines);

  if (assetsLineIndex == -1) {
    final insertionPoint = insertBlockEnd;
    final block = <String>['  assets:'];
    for (final dir in assetDirs) {
      block.add('    - $dir');
    }
    newLines.insertAll(insertionPoint, block);
  } else {
    final assetsIndent = _countLeadingSpaces(newLines[assetsLineIndex]);
    int insertAfter = assetsLineIndex + 1;
    for (var i = assetsLineIndex + 1; i < insertBlockEnd; i++) {
      final l = newLines[i];
      if (l.trim().isEmpty) {
        insertAfter = i;
        continue;
      }
      final sp = _countLeadingSpaces(l);
      if (sp <= assetsIndent) {
        break;
      }
      insertAfter = i + 1;
    }

    final existing = <String>{};
    for (var i = assetsLineIndex + 1; i < insertAfter; i++) {
      final t = newLines[i].trim();
      if (t.startsWith('-')) {
        final v = t.substring(1).trim();
        if (v.isNotEmpty) existing.add(v);
      }
    }

    int offset = 0;
    for (final dir in assetDirs) {
      if (!existing.contains(dir)) {
        newLines.insert(
          insertAfter + offset,
          '  ' * ((assetsIndent ~/ 2) + 1) + '- ' + dir,
        );
        offset++;
      }
    }
  }

  return newLines.join('\n');
}

int _countLeadingSpaces(String s) {
  var c = 0;
  for (var i = 0; i < s.length; i++) {
    if (s.codeUnitAt(i) == 32) {
      c++;
    } else {
      break;
    }
  }
  return c;
}
