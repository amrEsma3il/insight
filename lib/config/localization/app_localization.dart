import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// The login page

  //language
  String get chooseLang;
  String get arabic;
  String get english;

  /// onboarding
  String get onBoardingbody1;
  String get onBoardingtitle1;
  String get onBoardingbody2;
  String get onBoardingtitle2;
  String get onBoardingbody3;
  String get onBoardingtitle3;
  String get onBoardingContinue;

  //authintication

  String get auth1;
  String get auth2;
  String get auth3;
  String get auth4;
  String get auth5;
  String get auth6;
  String get auth8;
  String get auth9;
  String get auth10;
  String get auth11;
  String get auth12;
  String get auth13;
  String get auth14;
  String get auth15;
  String get auth16;
  String get auth17;
  String get auth19;
  String get auth20;
  String get auth21;
  String get auth22;
  String get auth23;
  String get auth24;
  String get auth25;
  String get auth26;
  String get auth27;
  String get auth28;
  String get auth29;
  String get auth30;
  String get auth32;
  String get auth36;
  String get auth33;
  String get confirm;
  String get rePassword;
  String get alertTitle;
  String get alertBody;
  String get cancel;
  String get validatorl;
  String get validator2;
  String get validator3;
  String get  validatorEmail;
  String get validatorUsername;
   String get  validatorPhome;


  String verfiyEmail(String emailAddress);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}




















        //  {
       
        //   "8": ,
        //   "9": ,
        //   "10": ,
        //   "11":
        //       ,
        //   "12":,
        //   "13": ,
        //   "14": ,
        //   "15": ,
        //   "16": ,
        //   "17": ,
        //   "18": ,
        //   "19": ,
        //   "20": ,
        //   "21": ,
        //   "22": ,
        //   "23": ,
        //   "24":
        //       ,
        //   "25": ,
        //   "26": ,
        //   "27": ,
        //   "28": ,
        //   "29": ,
        //   "30": ,
        //   "31": ,
        //   "32": ,
        //   "33": ,
        //   "34":,
        //   "35": ,
        //   "36": ,
        //   "37": ,
        //   "38": 
        // }
        
        
        //  {
          
        //   "8": "Continue",
        //   "9": "Sign In",
        //   "10": "Welcome Back",
        //   "11":
        //       "Sign In Your Email And Password Or  Continue With Social Media",
        //   "12": "Enter Your Email",
        //   "13": "Enter Your Password",
        //   "14": "Forget Password",
        //   "15": "Sign In",
        //   "16": "Dont Have An Account ? ",
        //   "17": "Sign Up",
        //   "18": "Email",
        //   "19": "Password",
        //   "20": "Username",
        //   "21": "Phone",
        //   "22": "Enter Your Phone",
        //   "23": "Enter Your Username",
        //   "24":
        //       "Sign Up With Your Email And Password OR Continue With Social Media",
        //   "25": " have an account ? ",
        //   "26": "SignIn",
        //   "27": "Check Email",
        //   "28": "Account successfully created",
        //   "29": "please Enter Your Email Address To Recive A verification code",
        //   "30": "check",
        //   "31": "Go To Login",
        //   "32": "Success",
        //   "33": "save",
        //   "34": "Please Enter new Password",
        //   "35": "New Password",
        //   "36": "Password has been reset successfully",
        //   "37": "congratulations",
        //   "38": "successfully registered"
    