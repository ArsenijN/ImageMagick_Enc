# ImageMagick_Enc
ArsenijN ImageMagick converter is a small visual shell with flexible options.
This small program is written in Batch and allows you to easily convert photos while preserving all possible EXIF metadata.

***How does it work?***
The installation file contains the program itself and does not contain a version of ImageMagick. [**Official ImageMagick website**](https://imagemagick.org/index.php)


This project is open source, you can modify it and use parts of it in your projects. I try to leave comments on how the code works, but they can be written in Ukrainian if there is a new function in the code, so **don't delay**

You can support me and my developments through the following links:
[DIAKA](https://arsenij-mine.diaka.ua/donate)
[buymeacoffee](https://www.buymeacoffee.com/arsenijnocQ)
[donatello]


# ImageMagick_Enc Українська версія:
**ImageMagick Encoder - це маленька програма, яка написана на Batch та дозволяє Вам легко конвертувати фотографії зі збереженням усіх можливих метаданих EXIF.**

***Як це працює?***
Інсталяційний файл містить саму програму та не містить версію ImageMagick. [Офіційний ***сайт ImageMagick***](https://imagemagick.org/index.php)

***Як цим користуватись?***
1. Вам необхідно помістити фото у папку де знаходиться файл bat
2. Запустіть ImageMagick Encoder.bat та введіть налаштування якості (пропустіть, якщо у конфігу вибрано режим "тиші")
3. Зачекайте доки процесс буде закінчений. Скріпт напише, яякщо виникнуть помилки та покаже кількість конвертованих/усього файлів

***Підтримуються наступні формати:***
- jpg
- heic
- webp
- png
- та інші

Переваги цього застосунку полягає в нативній підтримці HEIC без аддонів, тому якщо ви власник Samsung, iPhone чи іншого смартфону який робить фотографії у такому форматі - цей засіб для вас!
![Знімок екрана 2023-08-15 225306 – 35% of quality on document photos](https://github.com/ArsenijN/ImageMagick_Enc/assets/67965122/e543f9ec-9ea6-483d-b553-dd3cd2839513)

AVIF має ліпшу стискальну можливість, та навіть при незначних втратах конвертування з jpg ви отримуєте значне менший розмір файлу, при використанні інших форматів залежить від "складності зображення", але також Samsung не підтримує **деякі** зображення після конвертації, тому для заміни зображень з jpg або heic на avif для подальшого використання на смартфоні - поки не є сильним

*Ця оболонка-проект є відкритою, ви можете корегувати його та використовувати його частини у своїх проектах. Я намагаюся залишати коментарі роботи коду, але вони можуть бути написані на Українській мові якщо є нова функція в коді.*

Ви можете підтримати мене та мої розробки по наступним посиланням:
[Дяка](https://arsenij-mine.diaka.ua/donate)
[buymeacoffee](https://www.buymeacoffee.com/arsenijnocQ)
[Потрібно дійсно завести donatello]

* Сукупність факторів "складного" зображення для стисканння:
  - Великі області однакового зображення (напр. фон, небо, стіни тощо) - ступінь стискання: максимальна
  - Градієнти кольорів/освітлення (море, пейзаж тощо) - ступінь стискання: середня
  - Дрібні об'єкти (трава, кусти, дерев'я тощо) - ступінь стискання: в залежності від типу об'єкту ~ непогана
  - Округлі об'єкти (інтерфейс додатку, фотографії тощо) - ступінь стискання: невідомо (стиснення здійснюється у формі квадратів, які мають максимальний розмір 128x128)
  - Текст (інтерфейс, скріншоти тощо) - ступінь стиснстискання: невідомо (в залежності від якості зображення та кольору тексту, мінімальний розмір повного зображення текстом ≈ 2:1)











Мені 14 🥳
I am 14 🥳
