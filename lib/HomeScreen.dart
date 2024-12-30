import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:warisan_budaya_mobile/blog_detail_page.dart';

class HomeScreen extends StatelessWidget {
int _selectedIndex =
      0; // Untuk menandai item yang dipilih di BottomNavigationBar
  final List<Map<String, String>> data = [
    {
      'image': 'assets/images/jawa_barat/gambar1.jpeg',
      'name': 'Gedung Sate',
      'location': 'Bandung, Jawa Barat',
      'description':
          'Gedung Sate (bahasa Sunda: ᮌᮨᮓᮧᮀ ᮞᮒᮦ, translit. Gedong Saté) merupakan gedung kantor Gubernur Jawa Barat. Gedung ini memiliki ciri khas berupa ornamen tusuk sate pada menara sentralnya, yang telah lama menjadi penanda atau markah tanah Kota Bandung yang tidak saja dikenal masyarakat di Jawa Barat, tetapi juga seluruh Indonesia bahkan model bangunan itu dijadikan pertanda bagi beberapa bangunan dan tanda-tanda kota di Jawa Barat. Misalnya bentuk gedung bagian depan Stasiun Kereta Api Tasikmalaya. Gedung berwarna putih ini mulai dibangun pada tahun 1920 dan masih berdiri kokoh hingga saat ini.',
      'image2': 'assets/images/jawa_barat/gambar2.jpg',
      'description2':
          'Gedung Sate yang pada masa Hindia Belanda dibangun sebagai kantor Departemen Badan Usaha Milik Negara Hindia Belanda (bahasa Belanda: Department van Gouvernementsbedrijven), peletakan batu pertama dilakukan oleh Johanna Catherina Coops, puteri sulung walikota Bandung, Bertus Coops dan Petronella Roelofsen, mewakili Gubernur Jenderal di Batavia, J.P. Graaf van Limburg Stirum pada tanggal 27 Juli 1920, merupakan hasil perencanaan sebuah tim yang terdiri dari Ir.J.Gerber, arsitek muda kenamaan lulusan Fakultas Teknik Delft Nederland, Ir. Eh. De Roo dan Ir. G. Hendriks serta pihak Gemeente van Bandoeng, diketuai Kol. Pur. VL. Slors dengan melibatkan 2000 pekerja, 150 orang di antaranya pemahat, atau ahli bongpay pengukir batu nisan dan pengukir kayu berkebangsaan China yang berasal dari Konghu atau Kanton, dibantu tukang batu, kuli aduk dan peladen yang berasal dari penduduk Kampung Sekeloa, Kampung Coblong Dago, Kampung Gandok dan Kampung Cibarengkok, yang sebelumnya mereka menggarap Gedong Sirap (Kampus ITB) dan Gedong Papak (Balai Kota Bandung).',
      'image3': 'assets/images/jawa_barat/gambar3.jpg',
      'description3':
          'Selama kurun waktu 4 tahun pada bulan September 1924 berhasil diselesaikan pembangunan induk bangunan utama Gouverments Bedrijven, termasuk kantor pusat PTT (Pos, Telepon dan Telegraf) dan Perpustakaan. Perpustakaan Gedung Sate memuat 250.000 buku yang didapat dari perusahaan kereta api, dinas pos, telegraf dan telepon, dan dinas pertambangan. Perpustakaan ini menjadi perpustakan terbesar di Hindia Belanda untuk kategori ilmu pengetahuan. Sementara untuk kategori umum, perpustakaan Gedung Sate menjadi yang terbesar kedua setelah perpustakaan “Bataviaasch Genootschap van Kunsten en Wetenschappen”[1].',
    },
    {
      'image': 'assets/images/jakarta/gambar1.jpg',
      'name': 'Monumen Nasional',
      'location': 'Jakarta',
      'description':
          'Monumen Nasional atau yang disingkat dengan Monas atau Tugu Monas adalah monumen peringatan setinggi 132 meter (433 kaki) yang terletak tepat di tengah Lapangan Medan Merdeka, Jakarta Pusat. Monas didirikan untuk mengenang perlawanan dan perjuangan rakyat Indonesia dalam merebut kemerdekaan dari pemerintahan kolonial Kerajaan Belanda. Pembangunan dimulai pada 17 Agustus 1961 di bawah perintah Presiden Soekarno dan diresmikan hingga dibuka untuk umum pada 12 Juli 1975 oleh Presiden Soeharto. Tugu ini dimahkotai lidah api yang dilapisi lembaran emas yang melambangkan semangat perjuangan yang menyala-nyala dari rakyat Indonesia.',
      'image2': 'assets/images/jakarta/gambar2.jpg',
      'description2':
          'Ide awal pendirian Monumen adalah seorang warga negara RI biasa, seorang swasta, warga kota sederhana dari Jakarta bernama Sarwoko Martokoesoemo,” kata Sudiro. Setelah pusat pemerintahan Negara Kesatuan Republik Indonesia kembali ke Jakarta yang sebelumnya berkedudukan di Yogyakarta pada tahun 1950, menyusul pengakuan kedaulatan Negara Kesatuan Republik Indonesia oleh pemerintahan kolonial Kekaisaran Belanda pada tahun 1949, perencanaan pembangunan sebuah Monumen Nasional yang setara dengan Menara Eiffel di lapangan tepat di depan Istana Merdeka. Pembangunan Tugu Monas bertujuan mengenang dan melestarikan perjuangan bangsa Indonesia pada masa revolusi kemerdekaan 1945, agar terus membangkitkan inspirasi dan semangat patriotisme generasi penerus bangsa.',
      'image3': 'assets/images/jakarta/background.jpg',
      'description3':
          'Pada tanggal 17 Agustus 1954, sebuah komite nasional dibentuk dan sayembara perancangan Monumen Nasional digelar pada tahun 1955. Terdapat 51 karya yang masuk, akan tetapi hanya satu karya yang dibuat oleh Friedrich Silaban yang memenuhi kriteria yang ditentukan komite, antara lain menggambarkan karakter bangsa Indonesia dan dapat bertahan selama berabad-abad. Sayembara kedua digelar pada tahun 1960 tetapi sekali lagi tak satupun dari 136 peserta yang memenuhi kriteria. Ketua juri kemudian meminta Silaban untuk menunjukkan rancangannya kepada Soekarno. Akan tetapi Soekarno kurang menyukai rancangan itu dan ia menginginkan monumen itu berbentuk lingga dan yoni. Silaban kemudian diminta merancang monumen dengan tema seperti itu, akan tetapi rancangan yang diajukan Silaban terlalu luar biasa sehingga biayanya sangat besar dan tidak mampu ditanggung oleh anggaran negara, terlebih kondisi ekonomi saat itu cukup buruk. Silaban menolak untuk merancang bangunan yang lebih kecil dan menyarankan pembangunan ditunda hingga ekonomi Indonesia membaik. Soekarno kemudian meminta arsitek Soedarsono untuk melanjutkan rancangan itu. Soedarsono memasukkan angka 17, 8 dan 45 melambangkan 17 Agustus 1945 memulai Proklamasi Kemerdekaan Indonesia ke dalam rancangan monumen itu. Tugu Peringatan Nasional ini kemudian dibangun di areal seluas 80 hektare. Tugu ini diarsiteki oleh Friedrich Silaban dan Soedarsono mulai dibangun 17 Agustus 1961.',
    },
    {
      'image': 'assets/images/sumatera_barat/gambar3.jpg',
      'name': 'Rumah Gadang',
      'location': 'Sumatera Barat',
      'description':
          'Rumah Gadang adalah nama untuk rumah adat Minangkabau yang merupakan rumah tradisional dan banyak dijumpai di Sumatera Barat, Indonesia. Rumah ini juga disebut dengan nama lain oleh masyarakat setempat dengan nama Rumah Bagonjong atau ada juga yang menyebut dengan nama Rumah Baanjuang. Rumah dengan model ini juga banyak dijumpai di Sumatera Barat. Namun tidak semua kawasan di Minangkabau (darek) yang boleh didirikan rumah adat ini, hanya pada kawasan yang sudah memiliki status sebagai nagari saja Rumah Gadang ini boleh didirikan. Begitu juga pada kawasan yang disebut dengan rantau, rumah adat ini juga dahulunya tidak ada yang didirikan oleh para perantau Minangkabau.',
      'image2': 'assets/images/sumatera_barat/gambar2.jpg',
      'description2':
          'Rumah adat ini memiliki keunikan bentuk arsitektur dengan bentuk puncak atapnya runcing yang menyerupai tanduk kerbau dan dahulunya dibuat dari bahan ijuk yang dapat tahan sampai puluhan tahun,[3] namun belakangan atap rumah ini banyak berganti dengan atap seng. Rumah Gadang ini dibuat berbentuk empat persegi panjang dan dibagi atas dua bagian, muka dan belakang. Bagian depan dari Rumah Gadang biasanya penuh dengan ukiran ornamen dan umumnya bermotif akar, bunga, daun serta bidang persegi empat dan genjang.[1] Sedangkan bagian luar belakang dilapisi dengan belahan bambu. Rumah tradisional ini dibina dari tiang-tiang panjang, bangunan rumah dibuat besar ke atas, tetapi tidak mudah runtuh oleh goncangan,[1] dan setiap elemen dari Rumah Gadang mempunyai makna tersendiri yang dilatari oleh tambo yang ada dalam adat dan budaya masyarakat setempat.',
      'image3': 'assets/images/sumatera_barat/gambar1.jpg',
      'description3':
          'Pada umumnya, Rumah Gadang mempunyai satu tangga yang terletak pada bagian depan. Sementara dapur dibangun terpisah pada bagian belakang rumah yang didempet pada dinding. Karena wilayah Minangkabau rawan gempa sejak dulunya karena berada di pegunungan Bukit Barisan, maka arsitektur Rumah Gadang juga memperhitungkan desain yang tahan gempa. Seluruh tiang Rumah Gadang tidak ditanamkan ke dalam tanah, tetapi bertumpu ke atas batu datar yang kuat dan lebar. Seluruh sambungan setiap pertemuan tiang dan kasau (kaso) besar tidak memakai paku, tetapi memakai pasak yang juga terbuat dari kayu. Ketika gempa terjadi Rumah Gadang akan bergeser secara fleksibel seperti menari di atas batu datar tempat tonggak atau tiang berdiri. Begitu pula setiap sambungan yang dihubungkan oleh pasak kayu juga bergerak secara fleksibel, sehingga Rumah Gadang yang dibangun secara benar akan tahan terhadap gempa.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 75),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(height: 1),
                          children: [
                            TextSpan(
                              text: 'Mari Mengenal\n',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: 'Warisan',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: 'Budaya',
                              style: GoogleFonts.poppins(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: '.\n',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: ' Berbahaya Jika Tak BerBudaya!',
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/logo_barong.png',
                      width: 160,
                      height: 160,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final item = data[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlogDetailPage(
                                image: item['image']!,
                                name: item['name']!,
                                location: item['location']!,
                                description: item['description']!,
                                image2: item['image2']!,
                                description2: item['description2']!,
                                image3: item['image3']!,
                                description3: item['description3']!,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                                child: Image.asset(
                                  item['image']!,
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name']!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      item['location']!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      item['description']!,
                                      style: GoogleFonts.poppins(
                                        fontSize: 12,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
             ),
    ),

            );
  }
}