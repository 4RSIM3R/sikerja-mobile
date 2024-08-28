part of 'theme.dart';

class AppCoreTheme {
  static SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: true,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarContrastEnforced: true,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    primaryColor: ColorTheme.primary,
    scaffoldBackgroundColor: Colors.grey.shade100,
    progressIndicatorTheme: const ProgressIndicatorThemeData(color: ColorTheme.primary),
    textTheme: GoogleFonts.plusJakartaSansTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorTheme.primary,
        surfaceTintColor: ColorTheme.primary,
        foregroundColor: Colors.white,
        fixedSize: const Size.fromHeight(kBottomNavigationBarHeight - 12.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorTheme.primary,
      ),
    ),
    // FAB Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorTheme.primary,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),
    // ListTile Theme
    listTileTheme: const ListTileThemeData(dense: true),
    // Input Decoration
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 14),
      // contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      errorStyle: const TextStyle(height: 0),
      errorMaxLines: 1,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorTheme.primary,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      errorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      constraints: const BoxConstraints(
        minHeight: 55,
      ),
    ),
    // Modal Dialog Theme
    dialogTheme: DialogTheme(
      // titleTextStyle: TextStyle(fontSize: 12,),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    // Card Theme
    cardTheme: CardTheme(
      elevation: 1.0,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    // Tab Bar Theme
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.zero,
      labelColor: ColorTheme.primary,
      labelStyle: const TextStyle(
        color: ColorTheme.primary,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelColor: AppCoreColor.neutral.n60,
      unselectedLabelStyle: TextStyle(
        color: AppCoreColor.neutral.n60,
        fontSize: 14,
      ),
      dividerColor: Colors.transparent,
      indicatorColor: ColorTheme.primary,
      indicatorSize: TabBarIndicatorSize.label,
      overlayColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.pressed)) {
          return AppCoreColor.primary.focus;
        }

        return null;
      }),
    ),
    // ExpansionTile
    expansionTileTheme: const ExpansionTileThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
    // CheckBox Button Theme
    checkboxTheme: CheckboxThemeData(
      splashRadius: 5.0,
      fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return ColorTheme.primary;
        }

        return null;
      }),
    ),
    // Radio Button Theme
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        if (states.contains(WidgetState.selected)) {
          return ColorTheme.primary;
        }

        return ColorTheme.primary;
      }),
    ),
  );
}
