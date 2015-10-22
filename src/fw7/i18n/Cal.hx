package fw7.i18n;

/**
 * ...
 * @author 
 */
class Cal
{
	static var monthNamesDE = ['Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August' , 'September' , 'Oktober', 'November', 'Dezember'];
	static var monthNamesShortDE = ['Jan', 'Feb', 'Mär', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez'];
	static var dayNamesDE = ['Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag'];
	static var dayNamesShortDE = ['So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa'];
	
	static public var DE: fw7.Calendar.CalendarParams = {
		monthNames: monthNamesDE,
		monthNamesShort: monthNamesShortDE,
		dayNames: dayNamesDE,
		dayNamesShort: dayNamesShortDE,
		dateFormat: 'dd.mm.yy',
		toolbarCloseText: 'Fertig',
	}
	
}