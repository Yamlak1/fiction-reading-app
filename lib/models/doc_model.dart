class Document {
  String? doc_title;
  String? doc_url;
  String? doc_date;
  int? page_num;
  String? coverImageAsset;
  String? genre; // Add the genre property

  Document(this.doc_title, this.doc_url, this.doc_date, this.page_num,
      this.coverImageAsset,
      {this.genre = ''});

  static List<Document> doc_list = [
    Document(
      "The Adventures of Tom Sawyer",
      "https://www.planetebook.com/free-ebooks/the-adventures-of-tom-sawyer.pdf",
      "1-1-1884",
      200,
      "lib/assets/BookCoverTheAdventuresofTomSawyer.png",
      genre: "Adventure",
    ),
    Document(
      "The Great Gatsby",
      "https://www.planetebook.com/free-ebooks/the-great-gatsby.pdf",
      "1-1-1925",
      193,
      "lib/assets/Book-Cover-The-Great-Gatsby.png",
      genre: "Fiction",
    ),
    Document(
      "Frankenstein",
      "https://www.planetebook.com/free-ebooks/frankenstein.pdf",
      "1-1-1818",
      277,
      "lib/assets/Book-Cover-Frankenstein.png",
      genre: "Horror",
    ),
    Document(
      "Alice's Adventures in Wonderland",
      "https://www.planetebook.com/free-ebooks/alices-adventures-in-wonderland.pdf",
      "1-1-1865",
      111,
      "lib/assets/Book-Cover-Alices-Adventures-in-Wonderland.png",
      genre: "Fantasy",
    ),
    Document(
      "The lightning thief",
      "https://ia601608.us.archive.org/14/items/pdfy-vJFcaYG7Xau9y5ZZ/01_The_Lightning_Thief.pdf",
      "1-1-2005",
      189,
      "lib/assets/lightningthief.jpg",
      genre: "Fantasy",
    ),
    Document(
      "The wonderful wizard of Oz",
      "https://ia601209.us.archive.org/11/items/wonderfulwizardo00baumiala/wonderfulwizardo00baumiala.pdf",
      "1-1-1900",
      312,
      "lib/assets/WWOO.jpg",
      genre: "Fantasy",
    ),

    Document(
      "Great Expectations",
      "https://www.planetebook.com/free-ebooks/great-expectations.pdf",
      "1-1-1860",
      685,
      "lib/assets/Book-Cover-Great-Expectations.png",
      genre: "Classic",
    ),
    Document(
      "The Merry Adventures of Robin Hood",
      "https://www.planetebook.com/free-ebooks/the-merry-adventures-of-robin-hood.pdf",
      "1-1-1883",
      395,
      "lib/assets/Book-Cover-The-Merry-Adventures-of-Robin-Hood-1.png",
      genre: "Adventure",
    ),
    Document(
      "Flutter How Auth works",
      "https://ia601800.us.archive.org/28/items/flutter-dart-the-complete-guide-2020-edition/11.%20Adding%20User%20Authentication%20%5BSHOP%20APP%5D/2.1%20how-auth-works.pdf",
      "1-1-2024",
      1,
      "lib/assets/flutter.jpg",
      genre: "Educational",
    ),
    Document(
      "Responsive Flutter",
      "https://ia801800.us.archive.org/28/items/flutter-dart-the-complete-guide-2020-edition/5.%20Responsive%20%26%20Adaptive%20User%20Interfaces%20and%20Apps/2.1%20responsive-adaptive.pdf",
      "1-1-2024",
      3,
      "lib/assets/flutter.jpg",
      genre: "Educational",
    ),

    // Document(
    //   "c++ Tutorial",
    //   "https://cplusplus.com/files/tutorial.pdf",
    //   "1-1-2024",
    //   114,
    //   "lib/assets/",
    //   genre: "Educational",
    // ),

    // Document(
    //   "c# Tutorial",
    //   "https://www.ssw.jku.at/Teaching/Lectures/CSharp/Tutorial/Part1.pdf",
    //   "1-1-2024",
    //   65,
    //   "lib/assets/",
    //   genre: "Educational",
    // ),
    // Document(
    //   "c# Tutorial Part 2",
    //   "https://www.ssw.jku.at/Teaching/Lectures/CSharp/Tutorial/Part2.pdf",
    //   "1-1-2024",
    //   65,
    //   "lib/assets/",
    //   genre: "Educational",
    // ),

    Document(
      "I Can Summon All the Gods ",
      "https://www.webnovel.com/book/i-can-summon-all-the-gods_22693836006031505/chapter-1-the-system-of-gods_60918329094764437",
      "1-1-2022",
      416,
      "lib/assets/I Can Summon All the Gods.jpg",
      genre: "Fantasy",
    ),
    Document(
      "YUGIOH: It's Time to Duel!",
      "https://www.webnovel.com/book/yugioh-it's-time-to-duel!_25986290006831205/what-is-this!_69756494811297952",
      "1-1-2022",
      60,
      "lib/assets/yugioh.jpg",
      genre: "Fantasy",
    ),

    // Add more documents with different genres as needed
  ];
}
