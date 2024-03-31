# ImageMagick_Enc English version:
**ImageMagick Encoder is a small portable program that is written in Batch and allows you to easily convert photos while preserving all possible EXIF metadata.**

***How does it work?***
The installation file contains the program itself and does not contain a version of ImageMagick. [Official ***site of ImageMagick***](https://imagemagick.org/index.php)

***How to use it?***
1. You need to place the photo in the folder where the .bat file is located
2. Run "ImageMagick Encoder v. 1.5.2.bat" and enter the quality settings (skip if "silent" mode is selected in the config)
3. Wait until the process is finished. The script will write if there are any errors and show the number of converted/total files

***The following formats are supported:***
- jpg
- heic
- webp
- png
- and other

The advantage of this application is the native support of HEIC without addons, so if you are the owner of a Samsung, iPhone or other smartphone that takes photos in this format - this tool is for you!
![Screenshot 2023-08-15 225306 – 35% of quality on document photos – translate_waifu2x_noise0_scale4x](https://github.com/ArsenijN/ImageMagick_Enc/assets/67965122/af546f96-5505-4e9d-954f-1b201367cb89)


AVIF has a better compression capability and even with slight lossy conversion from jpg you get a much smaller file size, when using other formats it depends on the "complexity of the image", but also Samsung does not support **some** images after conversion (retest will take approx. from 01.04.2024), so to replace images from jpg or heic to avif for further use on a smartphone - not strong yet


*This shell project is open source, you can modify it and use parts of it in your projects. I try to leave comments on how the code works, but they can be written in Ukrainian if there is a new function in the code.*

You can support me and my developments through the following links:
[Thank you](https://arsenij-mine.diaka.ua/donate),
[buymeacoffee](https://www.buymeacoffee.com/arsenijnocQ),
[I really need to start a donatello]

A set of factors for a "complex" image to compress: my calculations
   - Large areas of the same image (eg background, sky, walls, etc.) - compression ratio: maximum
   - Color gradients/lighting (sea, landscape, etc.) - compression ratio: medium
   - Small objects (grass, bushes, trees, etc.) - degree of compression: depending on the type of object ~ not bad
   - Round objects (application interface, photos, etc.) - degree of compression: unknown (compression is carried out in the form of squares with a maximum size of 128x128)
   - Text (interface, screenshots, etc.) - degree of compression: unknown (depending on the quality of the image and the color of the text, the minimum size of the full text image is ≈ 2:1)

***

# ImageMagick_Enc Українська версія:
**ImageMagick Encoder - це маленька портативна програма, яка написана на Batch та дозволяє Вам легко конвертувати фотографії зі збереженням усіх можливих метаданих EXIF.**

***Як це працює?***
Інсталяційний файл містить саму програму та не містить версію ImageMagick. [Офіційний ***сайт ImageMagick***](https://imagemagick.org/index.php)

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


AVIF має ліпшу стискальну можливість, та навіть при незначних втратах конвертування з jpg ви отримуєте значне менший розмір файлу, при використанні інших форматів залежить від "складності зображення", але також Samsung не підтримує **деякі** зображення після конвертації (повторна перевірка триватиме приблизно з 01.04.2024), тому для заміни зображень з jpg або heic на avif для подальшого використання на смартфоні - поки не є сильним


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











Мені 14 🥳
I am 14 🥳
