
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр ВзаиморасчетыСКлиентом Расход
	Движения.ВзаиморасчетыСКлиентом.Записывать = Истина;
	Движение = Движения.ВзаиморасчетыСКлиентом.Добавить();
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	СчетНаОплату.Ссылка КАК Ссылка,
	|	СчетНаОплату.СуммаДокумента КАК СуммаДокумента,
	|	СчетНаОплату.ЗаказКлиента.Клиент КАК Клиент,
	|	СчетНаОплату.Дата КАК Дата
	|ИЗ
	|	Документ.СчетНаОплату КАК СчетНаОплату
	|ГДЕ
	|	СчетНаОплату.Ссылка = &Ссылка";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	Выборка = Запрос.Выполнить().Выбрать();
	Выборка.Следующий();
	
	Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
	Движение.Период = Выборка.Дата;
	Движение.Клиент = Выборка.Клиент;
	Движение.Сумма = Выборка.СуммаДокумента;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры
