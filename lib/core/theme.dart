import 'package:flutter/material.dart';

mixin AppThemeData implements ThemeData {
  static ThemeData defaultThemeData(MaterialColor color) {
    return ThemeData(
      brightness: Brightness.light,
      platform: TargetPlatform.iOS,
      primarySwatch: color,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: color,
        brightness: Brightness.light,
      ).copyWith(
        secondary: Colors.red,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0.5,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.grey.shade100,
      dividerTheme: DividerThemeData(
        space: 1,
        thickness: 0.5,
        color: Colors.grey[200],
        indent: 20,
      ),
      cardTheme: const CardTheme(
        margin: EdgeInsets.zero,
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
      ),
    );
  }
}

// ThemeData getThemeData(MaterialColor color) {
//   return ThemeData(
//     primarySwatch: color,
//     brightness: Brightness.light,
//     platform: TargetPlatform.iOS,
//     primaryColor: Colors.white,
//     // backgroundColor: Colors.green,
//     scaffoldBackgroundColor: Colors.grey[200],
//     appBarTheme: const AppBarTheme(
//       elevation: 0.5,
//       backgroundColor: Colors.white,
//       foregroundColor: Colors.black,
//     ),
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: Colors.grey[200],
//     ),
//     textButtonTheme: TextButtonThemeData(
//       style: ButtonStyle(
//         splashFactory: NoSplash.splashFactory,
//         backgroundColor: MaterialStateProperty.all(Colors.black54),
//       ),
//     ),
//     iconTheme: const IconThemeData(
//       color: Colors.orange,
//     ),
//     primaryIconTheme: const IconThemeData(
//       color: Colors.red,
//     ),
//     textTheme: const TextTheme(
//       // 全黑色
//       displayLarge: TextStyle(
//         fontSize: HiConstant.largeFontSize,
//         color: Colors.black,
//         fontWeight: FontWeight.w500,
//       ),
//       displayMedium: TextStyle(
//         fontSize: HiConstant.mediumFontSize,
//         color: Colors.black,
//         fontWeight: FontWeight.normal,
//       ),
//       displaySmall: TextStyle(
//         fontSize: HiConstant.smallFontSize,
//         color: Colors.black,
//         fontWeight: FontWeight.w400,
//       ),
//       // Card's title
//       titleMedium: TextStyle(
//         fontSize: HiConstant.mediumFontSize - 1,
//         color: Colors.black87,
//       ),
//       // Card's detail
//       bodyMedium: TextStyle(
//         fontSize: HiConstant.mediumFontSize - 2,
//         color: Colors.black54,
//       ),
//     ),
    // cardTheme: const CardTheme(
    //   margin: EdgeInsets.zero,
    //   elevation: 0,
    //   color: Colors.white,
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.zero,
    //   ),
    // ),
//     primaryTextTheme: TextTheme(
//       // 主题色
//       displayLarge: TextStyle(
//         fontSize: HiConstant.largeFontSize,
//         color: color,
//         fontWeight: FontWeight.w500,
//       ),
//       displayMedium: TextStyle(
//         fontSize: HiConstant.mediumFontSize,
//         color: color,
//         fontWeight: FontWeight.normal,
//       ),
//       displaySmall: TextStyle(
//         fontSize: HiConstant.smallFontSize,
//         color: color,
//         fontWeight: FontWeight.w400,
//       ),
//       // // 主题色
//       // titleLarge: TextStyle(
//       //   fontSize: HiConstant.largeFontSize,
//       //   color: color,
//       //   fontWeight: FontWeight.w500,
//       // ),
//       // titleMedium: TextStyle(
//       //   fontSize: HiConstant.mediumFontSize,
//       //   color: color,
//       //   fontWeight: FontWeight.normal,
//       // ),
//       // titleSmall: TextStyle(
//       //   fontSize: HiConstant.smallFontSize,
//       //   color: color,
//       //   fontWeight: FontWeight.w400,
//       // ),
//     ),
//     dividerTheme: DividerThemeData(
//       thickness: 0.5,
//       color: Colors.grey[200],
//     ),
//     indicatorColor: Colors.grey,
//     tabBarTheme: TabBarTheme(
//       labelColor: color,
//       unselectedLabelColor: Colors.black,
//       labelStyle: const TextStyle(fontSize: 14),
//       unselectedLabelStyle: const TextStyle(fontSize: 14),
//     ),
//     colorScheme: ColorScheme.light(
//       primary: Colors.white,
//       onPrimary: color,
//     ),
//     // appBarTheme: AppBarTheme(
//     //   backgroundColor: Colors.green,
//     //   // systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
//     //   //   systemNavigationBarContrastEnforced: true,
//     //   //   systemStatusBarContrastEnforced: true,
//     //   //   systemNavigationBarColor: Colors.white,
//     //   //   statusBarColor: color,
//     //   //   systemNavigationBarDividerColor: Colors.green,
//     //   // ),
//     // ),
//     // 如果需要去除对应的水波纹效果
//     // splashFactory: NoSplash.splashFactory,
//     // textButtonTheme: TextButtonThemeData(
//     //   style: ButtonStyle(splashFactory: NoSplash.splashFactory),
//     // ),
//     // elevatedButtonTheme: ElevatedButtonThemeData(
//     //   style: ButtonStyle(splashFactory: NoSplash.splashFactory),
//     // ),
//   );
// }