# ImageMagick_Enc English version:
**ImageMagick Encoder is a small portable program written in Batch and allows you to easily convert photos while preserving all possible EXIF ​​metadata.**

***How ​​does it work?***

The installation file contains only the shell itself. You need to download `ImageMagick` from the [official ***site***](https://imagemagick.org/index.php)

***How ​​to use it?***

1. You need to place the photo in the folder where the .bat file is located
2. Run "ImageMagick Encoder v. 1.5.2.bat" and enter the quality settings (skip if the "silent" mode is selected in the config)
3. Wait until the process is finished. The script will write if there are errors and show the number of converted/total files

***The following formats are supported:***
- jpg
- heic
- webp
- png
- and others

The advantages of this application are native support for HEIC without add-ons, so if you are the owner of a Samsung, iPhone or other smartphone that takes photos in this format - this tool is for you!
![Screenshot 2023-08-15 225306 – 35% of quality on document photos – translate_waifu2x_noise0_scale4x](https://github.com/ArsenijN/ImageMagick_Enc/assets/67965122/af546f96-5505-4e9d-954f-1b201367cb89)

AVIF has better compression capability, and even with minor loss of conversion from jpg you get significantly smaller file size, when using other formats it depends on the "complexity of the image", but also Samsung does not support **some** images after conversion (retesting will continue from 12/31/2024), so to replace images from jpg or heic to avif for further use on a smartphone - is not yet reliable

*This shell project is open, you can adjust it and use parts of it in your projects. I try to leave comments on the code, but they can be written in Ukrainian if there is a new feature in the code.*

You can support me and my developments at the following link:
[Dyaka](https://arsenij-mine.diaka.ua/donate),
[buymeacoffee](https://www.buymeacoffee.com/arsenijnocQ),
[I really need to start a donatello]

The set of factors of a "complex" image for compression: my calculations
- Large areas of the same image (e.g. background, sky, walls, etc.) - compression ratio: maximum
- Color/lighting gradients (sea, landscape, etc.) - compression ratio: average
- Small objects (grass, bushes, trees, etc.) - compression ratio: depending on the type of object ~ not bad
- Rounded objects (application interface, photos, etc.) - compression ratio: unknown (compression is performed in the form of squares that have maximum size 128x128)
- Text (interface, screenshots, etc.) - compression level: unknown (depending on image quality and text color, minimum size of full image with text ≈ 2:1)


Current problems/bugs/some things:
- [ ] Because `wmic` on Windows (11?) deprecated, datetime will not work and IM "GUI" will fail to move files (as I noticed so far, it affected only move of old files), so... Sorry! Please keep an eye when I'll release patch

***

# ImageMagick_Enc Українська версія:
**ImageMagick Encoder - це маленька портативна програма, яка написана на Batch та дозволяє Вам легко конвертувати фотографії зі збереженням усіх можливих метаданих EXIF.**

***Як це працює?***
Інсталяційний файл містить тільки саму оболонку. Вам необхідно завантажити `ImageMagick` з [офіційного ***сайту***](https://imagemagick.org/index.php)

***Як цим користуватись?***
1. Вам необхідно помістити фото у папку де знаходиться файл .bat файл
2. Запустіть "ImageMagick Encoder v. 1.5.2.bat" та введіть налаштування якості (пропустіть, якщо у конфігу вибрано режим "тиші")
3. Зачекайте доки процесс буде закінчений. Скрипт напише, якщо виникнуть помилки та покаже кількість конвертованих/усього файлів

***Підтримуються наступні формати:***
- jpg
- heic
- webp
- png
- та інші

Переваги цього застосунку полягає в нативній підтримці HEIC без аддонів, тому якщо ви власник Samsung, iPhone чи іншого смартфону який робить фотографії у такому форматі - цей засіб для вас!
![Знімок екрана 2023-08-15 225306 – 35% of quality on document photos – translate_waifu2x_noise0_scale4x](https://github.com/ArsenijN/ImageMagick_Enc/assets/67965122/af546f96-5505-4e9d-954f-1b201367cb89)


AVIF має ліпшу стискальну можливість, та навіть при незначних втратах конвертування з jpg ви отримуєте значне менший розмір файлу, при використанні інших форматів залежить від "складності зображення", але також Samsung не підтримує **деякі** зображення після конвертації (повторна перевірка триватиме  з 31.12.2024), тому для заміни зображень з jpg або heic на avif для подальшого використання на смартфоні - поки не є надійним


*Ця оболонка-проект є відкритою, ви можете корегувати його та використовувати його частини у своїх проектах. Я намагаюся залишати коментарі роботи коду, але вони можуть бути написані на Українській мові якщо є нова функція в коді.*

Ви можете підтримати мене та мої розробки по наступним посиланням:
[Дяка](https://arsenij-mine.diaka.ua/donate),
[buymeacoffee](https://www.buymeacoffee.com/arsenijnocQ),
[Мені дійсно потрібно завести donatello]

Сукупність факторів "складного" зображення для стисканння: мої підрахунки
  - Великі області однакового зображення (напр. фон, небо, стіни тощо) - ступінь стискання: максимальна
  - Градієнти кольорів/освітлення (море, пейзаж тощо) - ступінь стискання: середня
  - Дрібні об'єкти (трава, кусти, дерев'я тощо) - ступінь стискання: в залежності від типу об'єкту ~ непогана
  - Округлі об'єкти (інтерфейс додатку, фотографії тощо) - ступінь стискання: невідомо (стиснення здійснюється у формі квадратів, які мають максимальний розмір 128x128)
  - Текст (інтерфейс, скріншоти тощо) - ступінь стиснстискання: невідомо (в залежності від якості зображення та кольору тексту, мінімальний розмір повного зображення текстом ≈ 2:1)

Поточні проблеми/баги/речі:
- [ ] Через те, що `wmic` на Windows (11?) тепер застарілий, datetime не буде тепер працювати (він відповідає за створення тек з теперішніми датою та часом) та IM "GUI" не зможе перемістити файли (наскільки я знаю - коли переміщуються старі файли), тому... Прошу вибачення! Слідкуйте за тим, коли я випущу патч-версію для вирішення цієї проблеми










Мені 16 🥳
I am 16 🥳
