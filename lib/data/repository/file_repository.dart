
import '../../utils/images/app_images.dart';
import '../models/file_data_model.dart';

class FileRepository {
  List<FileDataModel> files = [
    FileDataModel(
      iconPath: AppImages.python,
      fileName: "PythonBooks",
      fileUrl: "https://bilimlar.uz/wp-content/uploads/2021/02/k100001.pdf",
      bookGenre: 'Science',
    ),
    FileDataModel(
      iconPath: AppImages.navoiy,
      fileName: "Sittai zaruriya",
      fileUrl: "https://n.ziyouz.com/books/alisher_navoiy_asarlari/Alisher%20Navoiy%20(Foniy).%20Sittai%20zaruriya.pdf",
      bookGenre: 'poem',
    ), FileDataModel(
      iconPath: AppImages.navoiy,
      fileName: "A.Navoiy Arbain",
      fileUrl: "https://n.ziyouz.com/books/alisher_navoiy_asarlari/Alisher%20Navoiy.%20Arba'in.pdf",
      bookGenre: 'poem',
    ), FileDataModel(
      iconPath: AppImages.vabo,
      fileName: "Albert Kamyu Vabo",
      fileUrl: "https://n.ziyouz.com/books/jahon_nasri/Alber%20Kamyu.%20Vabo%20(roman).pdf",
      bookGenre: 'roman',
    ), FileDataModel(
      iconPath: AppImages.toshqin,
      fileName: "Alber Lixanov Toshqin",
      fileUrl: "https://n.ziyouz.com/books/jahon_nasri/Albert%20Lixanov.%20Toshqin%20(qissalar).pdf",
      bookGenre: 'action',
    ), FileDataModel(
      iconPath: AppImages.jamila,
      fileName: "Ch.Aytmatov jamila",
      fileUrl: "https://n.ziyouz.com/books/jahon_nasri/Chingiz%20Aytmatov.%20Jamila%20(qissa).pdf",
      bookGenre: 'qissa',
    ), FileDataModel(
      iconPath: AppImages.hamal,
      fileName: "E.Zolya Hamal",
      fileUrl: "https://n.ziyouz.com/books/jahon_nasri/Emil%20Zolya.%20Hamal%20(roman).pdf",
      bookGenre: 'qissa',
    ), FileDataModel(
      iconPath: AppImages.buxoro,
      fileName: "Qadimgi Buxoro",
      fileUrl: "https://n.ziyouz.com/books/tarixiy/Abdulahad%20Muhammadjonov.%20Amir%20Temur%20va%20temuriylar%20saltanati.pdf",
      bookGenre: 'tarix',
    ), FileDataModel(
      iconPath: AppImages.toshkent,
      fileName: "Qadimgi Toshkent",
      fileUrl: "https://n.ziyouz.com/books/tarixiy/Abdulahad%20Muhammadjonov.%20Qadimgi%20Toshkent.pdf",
      bookGenre: 'tarix',
    ), FileDataModel(
      iconPath: AppImages.shajarayi,
      fileName: "Shajarayi Turk",
      fileUrl: "https://n.ziyouz.com/books/tarixiy/Abulg'oziy%20Bahodirxon.%20Shajarai%20turk.pdf",
      bookGenre: 'tarix',
    ),FileDataModel(
      iconPath: AppImages.zafar,
      fileName: "Zafar Yo'li",
      fileUrl: "https://n.ziyouz.com/books/tarixiy/Amir%20Temur.%20Zafar%20yo'li.pdf",
      bookGenre: 'tarix',
    ),
  ];
}