/// flutter:
///   fonts:
///    - family:  HomeIcons
///      fonts:
///       - asset: fonts/HomeIcons.ttf
///
/// 
///
import 'package:flutter/widgets.dart';

class HomeIcons {
	HomeIcons._();

	static const _kFontFam = 'HomeIcons';

	static const IconData menu_nativo = const IconData( 0xe000, fontFamily: _kFontFam, fontPackage: 'cloudcrm-ui');
	static const IconData bot_o_transa__o_online = const IconData( 0xe001, fontFamily: _kFontFam, fontPackage: 'cloudcrm-ui');
	static const IconData bot_o_link_de_pagamento = const IconData( 0xe002, fontFamily: _kFontFam, fontPackage: 'cloudcrm-ui');
	static const IconData bot_o_boleto = const IconData( 0xe003, fontFamily: _kFontFam, fontPackage: 'cloudcrm-ui');
	static const IconData bot_o_mpos = const IconData( 0xe004, fontFamily: _kFontFam, fontPackage: 'cloudcrm-ui');
	static const IconData menu_superior = const IconData( 0xe005, fontFamily: _kFontFam, fontPackage: 'cloudcrm-ui');
}
