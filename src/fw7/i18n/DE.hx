package fw7.i18n;

/**
 * ...
 * @author 
 */
class DE
{
	static public var monthNames = ['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August' , 'September' , 'Oktober', 'November', 'Dezember'];
	static public var monthNamesShort = ['Jan', 'Feb', 'Mär', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez'];
	static public var dayNames = ['Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag'];
	static public var dayNamesShort = ['So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa'];
	inline static public var backText = "Zurück";
	inline static public var closeText = "Schließen";
	inline static public var doneText = "Fertig";
	inline static public var abortText = "Abbrechen";
	inline static public var cancelText = "Abbrechen";
	inline static public var okText = "OK";
	
	static public var Cal = {
		monthNames: monthNames,
		monthNamesShort: monthNamesShort,
		dayNames: dayNames,
		dayNamesShort: dayNamesShort,
		dateFormat: 'dd.mm.yy',
		toolbarCloseText: 'Fertig',
	};
	
	static public var SmartSelect = {
		smartSelectBackText: backText,
		smartSelectPopupCloseText: closeText,
		smartSelectPickerCloseText: doneText,		
	};

	static public var Modals = {
		modalButtonOk: okText,
		modalButtonCancel: cancelText,
		modalPreloaderTitle: "wird geladen...",		
	};
	
	static public var Notifications = {
		notificationCloseButtonText: closeText,
	};
	
}