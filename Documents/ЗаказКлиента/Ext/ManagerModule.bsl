
Процедура Печать(ТабДок, Ссылка) Экспорт
	//{{_КОНСТРУКТОР_ПЕЧАТИ(Печать)
	Макет = Документы.ЗаказКлиента.ПолучитьМакет("Печать");
	Запрос = Новый Запрос;
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ЗаказКлиента.Клиент,
	|	ЗаказКлиента.Номер,
	|	ЗаказКлиента.Статус,
	|	ЗаказКлиента.Цена,
	|	ЗаказКлиента.Количество,
	|	ЗаказКлиента.СуммаДокумента
	|ИЗ
	|	Документ.ЗаказКлиента КАК ЗаказКлиента
	|ГДЕ
	|	ЗаказКлиента.Ссылка В (&Ссылка)";
	
	//Текст запроса новый
	// например хотим получить телефон клиента в печатную форму
	Запрос.Текст =
	"ВЫБРАТЬ
	|	ЗаказКлиента.Клиент,
	|	ЗаказКлиента.Клиент.Телефон КАК Телефон,
	|	ЗаказКлиента.Номер,
	|	ЗаказКлиента.Статус,
	|	ЗаказКлиента.Цена,
	|	ЗаказКлиента.Количество,
	|	ЗаказКлиента.СуммаДокумента
	|ИЗ
	|	Документ.ЗаказКлиента КАК ЗаказКлиента
	|ГДЕ
	|	ЗаказКлиента.Ссылка В (&Ссылка)";
	
	
	Запрос.Параметры.Вставить("Ссылка", Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();

	ОбластьЗаголовок = Макет.ПолучитьОбласть("Заголовок");
	Шапка = Макет.ПолучитьОбласть("Шапка");
	ТабДок.Очистить();

	ВставлятьРазделительСтраниц = Ложь;
	Пока Выборка.Следующий() Цикл
		Если ВставлятьРазделительСтраниц Тогда
			ТабДок.ВывестиГоризонтальныйРазделительСтраниц();
		КонецЕсли;

		ТабДок.Вывести(ОбластьЗаголовок);
		
		Шапка.Параметры.Заполнить(Выборка);
		Если Шапка.Параметры.СуммаДокумента = 0 Тогда
			Шапка.Параметры.СуммаДокумента = Выборка.Цена * Выборка.Количество;			
		КонецЕсли;
		
		ТабДок.Вывести(Шапка, Выборка.Уровень());		
		
		ВставлятьРазделительСтраниц = Истина;
	КонецЦикла;
	//}}
КонецПроцедуры
