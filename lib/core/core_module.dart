// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get_it/get_it.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:buuka/config/firebase_production.dart';
// import 'package:buuka/config/firebase_staging.dart';
// import 'package:buuka/core/data/cache/cache.dart';
// import 'package:buuka/core/data/cache/secured_cache_impl.dart';
// import 'package:buuka/core/managers/app_env_manager.dart';
// import 'package:buuka/core/managers/deeplink_manager.dart';
// import 'package:buuka/core/managers/http_manager.dart';
// import 'package:buuka/core/managers/network_manager.dart';
// import 'package:buuka/core/managers/notification_manager.dart';
// import 'package:buuka/core/managers/remote_config_manager.dart';
// import 'package:buuka/core/widgets/in_app_notification.dart';
// import 'package:buuka/data/data_module.dart';
// import 'package:firebase_storage/firebase_storage.dart' as fstorage;
// import 'package:buuka/repository/repository_module.dart';
//
// final getIt = GetIt.instance;
//
// Future<void> initializeModules(AppEnv appEnv) async {
//   /// Initialize firebase
//   await Firebase.initializeApp(
//     options: appEnv == AppEnv.production
//         ? ProductionFirebaseConfig.options
//         : StagingFirebaseConfig.options,
//   );
//
//   // @{injectable modules}
//   const secureStorage = FlutterSecureStorage();
//   final firebaseFirestore = FirebaseFirestore.instance;
//   final firebaseFunctions = FirebaseFunctions.instance;
//   final firebaseAuth = FirebaseAuth.instance;
//   final firebaseStorage = fstorage.FirebaseStorage.instance;
//   final navigatorKey = GlobalKey<NavigatorState>();
//   final inAppNotificationKey = GlobalKey<InAppNotificationState>();
//
//   getIt.registerSingleton(navigatorKey);
//   getIt.registerSingleton(inAppNotificationKey);
//   getIt.registerSingleton(firebaseFirestore);
//   getIt.registerSingleton(firebaseFunctions);
//   getIt.registerSingleton(firebaseAuth);
//   getIt.registerSingleton(firebaseStorage);
//   getIt.registerSingleton<ILocalCache>(SecureLocalCache(secureStorage));
//
//   // @{managers}
//   getIt.registerSingleton(
//     HttpManager(
//       dio: Dio(),
//     ),
//   );
//   getIt.registerSingleton(AppEnvManager(appEnv));
//   getIt.registerSingleton(NetworkManager(Connectivity()));
//   getIt.registerSingleton(
//     NotificationManager(
//       FirebaseMessaging.instance,
//       FlutterLocalNotificationsPlugin(),
//     ),
//   );
//   getIt.registerSingleton(RemoteConfigManager(FirebaseRemoteConfig.instance));
//   getIt.registerSingleton(DeeplinkManager(FirebaseDynamicLinks.instance));
//
//   // @{datasources}
//   await injectDataSource(getIt);
//
//   // @{repositories}
//   await injectRepository(getIt);
// }
