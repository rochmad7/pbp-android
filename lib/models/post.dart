part of 'models.dart';

class Post extends Equatable {
  final int idPost;
  final int idKategori;
  final String namaKategori;
  final String namaPenulis;
  final String judul;
  final String slug;
  final String isiPost;
  final String fileGambar;
  final int jmlhKomentar;
  final DateTime tglInsert;
  final DateTime tglUpdate;

  Post({
    this.idPost,
    this.idKategori,
    this.namaKategori,
    this.namaPenulis,
    this.judul,
    this.slug,
    this.isiPost,
    this.fileGambar,
    this.jmlhKomentar,
    this.tglInsert,
    this.tglUpdate,
  });

  factory Post.fromJson(Map<String, dynamic> data) {
    return Post(
      idPost: int.parse(data["idpost"].toString()),
      idKategori: int.parse(data["idkategori"].toString()),
      namaKategori: data["namakategori"],
      namaPenulis: data["namapenulis"],
      judul: data["judul"],
      slug: data["slug"],
      isiPost: data["isi_post"],
      fileGambar: baseURLImg + 'post/' + data['file_gambar'].trim(),
      jmlhKomentar: int.parse(data["jmlhkomentar"].toString()),
      tglInsert: DateTime.parse(data["tgl_insert"].toString()),
      tglUpdate: DateTime.parse(data["tgl_update"].toString()),
    );
  }

  @override
  List<Object> get props => [
        idPost,
        idKategori,
        namaKategori,
        namaPenulis,
        judul,
        slug,
        isiPost,
        fileGambar,
        jmlhKomentar,
        tglInsert,
        tglUpdate
      ];
}

// Our demo Post

List<Post> mockPosts = [
  Post(
    idPost: 1,
    idKategori: 3,
    namaKategori: "Olahraga",
    namaPenulis: "Rochmad",
    judul: "GOR Undip Ditutup Selama Pandemi Corona",
    slug: "gor-undip-ditutup-selama-pandemi-corona",
    isiPost:
        '<p>SEMARANG, suaramerdeka.com - Suasana lengang terlihat di lapangan sepakbola Undip Semarang, Senin (27/4). Dari pantauan, tak ada aktivitas warga di lapangan ini. Kios makanan yang berada di sisi kiri stadion juga tutup. Petugas keamanan GOR Undip, Argi mengatakan seluruh kegiatan dihentikan sejak wabah Corona melanda tanah air khususnya di Kota Semarang.<br><br>"GOR ditutup satu bulan lalu, ya sejak ramai corona, sebelumnya pasti ramai untuk kegiatan seperti joging, memanah, di sini juga ada klub sepak bola, tapi untuk sementara kegiatan di GOR Undip dihentikan sementara," ujarnya.<br><br>Berbeda dengan GOR Undip, suasana ramai justru tampak di area waduk Diponegoro yang lokasinya bersebelahan dengan GOR Undip. Berbagai kegiatan dilakukan warga seperti memancing, joging, bersepeda atau sekedar nongkrong menghabiskan waktu.<br><br>Andi, salah seorang pemancing asal Bulusan, Tembalang mengatakan jika waduk selalu ramai dibulan puasa. Menurutnya, banyak yang menghabiskan waktu dengan memancing sambil menunggu waktu berbuka tiba. "Biasanya hari Minggu ramai, tapi puasa ini juga ramai, kalau di sini (waduk) mancing Nila," bebernya.<br><br>Terkait program Pembatasan Kegiatan Masyarakat (PKM) yang digelar pemerintah kota, pihaknya mengaku mendukung. Namun dirinya lebih sepakat jika pembatasan kegiatan tidak kepada tugasnya dalam mencari penghasilan.<br><br>"Ya setuju, tapi lebih kepada pembatasan kegiatan yang sifatnya nongkrong, kalau untuk pekerjaan kalau bisa jangan, saya sendiri sudah tiga minggu tidak kerja karena proyek ditutup sementara, kalau memang dihentikan seluruh kegiatan ya disiapkan juga bantuan untuk warga khususnya yang pekerjaannya terdampak Corona," tandasnya.Source : https://www.suaramerdeka.com/sport/cabang-olahraga/227372-gor-undip-ditutup-selama-pandemi-corona</p>',
    fileGambar: baseURLImg + 'post/artikel1.jpg',
  ),
  Post(
    idPost: 2,
    idKategori: 2,
    namaKategori: "Ilmu Pengetahuan",
    namaPenulis: "Husni",
    judul: "Pakar Undip: Pentingnya Iptek bagi Ketersediaan Air Tawar",
    slug: "pakar-undip--pentingnya-iptek-bagi-ketersediaan-air-tawar",
    isiPost:
        '<p>KOMPAS.com - Sumber daya alam (SDA) yang ada di bumi harus dijaga. Seperti halnya air tawar juga penting dijaga demi masa depan.<br><br>Untuk itu, akademisi yang juga Pakar Lingkungan dari Universitas Diponegoro ( Undip), Prof. Dr. Ir. Syafrudin CES MT, mengingatkan pentingnya memakai pendekatan Iptek (Ilmu Pengetahuan dan Teknologi).<br><br>Tentu untuk menjaga ketersediaan air tawar sebagai strategi mempertahankan ketersediaan air bersih di bumi. Pendekatan Iptek mendesak untuk dilakukan karena pemanfaatan air tawar sudah berlebihan.<br><br>Menurut Prof. Syafrudin, ketersediaan air di bumi hanya 2,5 persen yang berupa air tawar. Dari jumlah itu, tak lebih dari 1 persen yang bisa dimanfaatkan dengan biaya rendah. Selebihnya pemanfaatannya membutuhkan biaya tinggi.<br><br>Dijelaskan, air tawar yang bisa dimanfaatkan dengan biaya rendah berupa air di danau, sungai, waduk dan sumber air tanah dangkal.<br><br>"Diperlukan upaya bersama untuk mempertahankan keberadaannya demi kelangsungan kehidupan peradaban yang sekarang dan yang akan datang," ujar Prof. Syafrudin seperti dikutip dari laman Undip, Senin (28/9/2020).<br><br>Karena itulah diperlukan pengelolaan sumber daya air yang baik berbasis ilmu pengetahuan dan teknologi. tentu agar ada ketersediaan air bersih yang memenuhi baku mutu berkelanjutan.<br><br><em>Iptek jadi dasar pengelolaan</em><br><br>Disamping itu, Iptek harus menjadi dasar pengelolaan, mulai dari pengaturan sumber daya air mulai dari perencanaannya, pelaksanaan, pemantauan, evaluasi penyelenggaraan konservasi sumber daya air, pendayagunaan sumber daya air, sampai pengendalian daya rusak air.<br><br>Dia menilai, saat ini daya tampung lingkungan makin menurun, sementara penggunaan air untuk kebutuhan sehari-hari manusia sudah berlebihan.<br><br>Salah satu penyebab menurunnya daya dukung lingkungan bisa dilihat dari pencemaran air mulai dari hulu sampai hilir, padahal seharusnya kondisinya jernih dan layak untuk dikonsumsi.<br><br>Ada pula karena jumlah penduduk yang semakin meningkat, terjadi eksploitasi lahan secara masif tanpa memperhatikan daya tampung sehingga semua dijadikan pemukiman, dipakai kegiatan publik, mengakibatkan Daerah Aliran Sungai atau DAS menjadi kritis.<br><br>Akibatnya air tidak lagi masuk dalam struktur tanah, saat kemarau terjadi kekeringan sedangkan saat penghujan terjadi banjir. Akibat lainnya terjadi pencemaran lingkungan serta penumpukan sampah.<br><br>Karenanya, peran sungai dan danau yang tidak hanya menjadi sumber air tawar bagi masyarakat, menuntut penanganan yang bijak.<br><br>Kini sungai juga menjadi sarana transportasi, sumber air untuk irigasi dan air baku, pembangkit tenaga listrik, budi daya perikanan, sumber makanan dan minuman unsur biotik, tempat rekreasi dan olahraga, serta tempat hidup sehari-hari dan kelangsungan ekosistem menuntut penanganan yang terpadu.<br><br>"Selain danau, dikhawatirkan fungsi sungai juga terus terdegradasi. Karena itu, disarankan agar penggunaan air di sekitar DAS dibatasi," katanya.<br><br><em>Dua pendekatan penanganan sungai</em><br><br>Dalam konteks inilah, Iptek diperlukan untuk membantu menangani masalah-masalah yang berkait dengan ketersediaan dan kelestarian air tawar untuk umat manusia.<br><br>Dijelaskan, ada dua pendekatan untuk menangani sungai-sungai yang ada, yakni:<br><br><em>1. Pendekatan non-struktural</em><br><br>Iptek bisa dipakai untuk membantu menentukan daya dukung dan daya tampung, penentuan baku mutu perairan, penentuan garis sepadan sungai, penentuan peruntukan sungai, peningkatan peran serta masyarakat dan lainnya.<br><br><em>2. Pendekatan struktural</em><br><br>Pendekatan struktural yang mencakup perbaikan alur sungai, perkuatan tebing, pengambilan sedimen, penanggulangan erosi tebing sungai, pembangunan IPAL domestik komunal, pemasangan perangkap sampah, pemasangan pengukur muka air dan lainnya.<br><br>',
    fileGambar: baseURLImg + 'post/artikel2.jpg',
  ),
  Post(
    idPost: 3,
    idKategori: 1,
    namaKategori: "Berita",
    namaPenulis: "Fatah",
    judul: "Undip akan Dorong Semua Kampus Buka Posko Pengaduan",
    slug: "undip-akan-dorong-semua-kampus-buka-posko-pengaduan",
    isiPost:
        '<p><em>REPUBLIKA.CO.ID, SEMARANG --</em> Langah Pemerintah Provinsi (Pemprov) Jawa Tengah membuka posko pengaduan aspirasi Undang-undang Cipta Kerja guna menampung aspirasi pihak-pihak yang masih menolak mendapat dukungan kampus. Salah satunya dari Universitas Diponegoro (Undip) yang juga bakal menyiapkan posko serupa guna menampung aspirasi dari masyarakat.<br><br>“Undip juga akan membantu pemerintah, dengan membuka posko aspirasi dan pengaduan Undang-undang Cipta Kerja di kampus,” ungkap Rektor Universitas Diponegoro (Undip) Semarang, Prof Dr Yos Johan Utama SH MHum, di Semarang, Senin (12/10).<br><br>Ia mengatakan, Undip juga akan mendorong seluruh kampus di Indonesia melakukan hal yang sama. Sebagai Ketua Dewan Pertimbangan Forum Rektor Indonesia (FRI), Yos Johan mengaku bisa melakukan hal itu.<br><br>“Tidak hanya Undip, tapi semua kampus akan kami gerakkan. Masak urusan seperti ini hanya Undip saja, semua harus bergerak untuk menampung sebanyak mungkin masukan dari masyarakat,” jelasnya.<br><br>Ia juga mendesak Pemerintah Pusat segera memberikan salinan resmi Undang-undang Cipta Kerja kepada masyarakat, agar semuanya memiliki landasan yang pasti untuk menentukan sikapnya.<br><br>Sebab sampai hari ini, salinan resmi itu belum ada. “Jadi, kami harap ini segera diberikan sebagai pedoman dalam memberikan pendampingan atau melayani konsultasi kepada masyarakat,” katanya.<br><br>Sebelumnya, Gubernur Jawa Tengah, Ganjar Pranowo memang membuka ruang kepada masyarakat untuk memberikan masukan terkait Undang-undang Cipta Kerja. Ia telah memerintahkan Dinas Tenaga Kerja dan Transmigrasi untuk membuka posko pengaduan.<br><br>Harapannya, posko tersebut bisa menjadi alternative dalam menyerap aspirasi dari masyarakat yang dapat disampaikan kepada Pemerintah Pusat. “Sebab tidak hanya buruh, tapi juga ada pengusaha, masyarakat, akademisi dan lainnya yang berkepentingan di sana,” jelasnya.<br><br>Kabar baiknya, lanjut Ganjar, kampus juga tergerak untuk membuka layanan dalam upaya menampung aspirasi masyarakat luas tersebut. maka masyarakat bisa mendapatkan akses luas untuk menyampaikan pendapatnya. “Ternyata pihak kampus mendukung ini, dan mereka akan membuat posko serupa untuk menampung aspirasi masyarakat terkait dengan polemik persoalan undang Undang Cipta Kerja,” tegas gubernur.<br><br>Sumber : https://republika.co.id/berita/qi32b6384/undip-akan-dorong-semua-kampus-buka-posko-pengaduan</p>',
    fileGambar: baseURLImg + 'post/artikel3.jpg',
  ),
  Post(
    idPost: 4,
    idKategori: 1,
    namaKategori: "Berita",
    namaPenulis: "Rizqi",
    judul:
        "Undip Sebut Masalah Hukum Mahasiswanya yang Melakukan Tindakan Anarkis Merupakan Masalah Pribadi",
    slug:
        "undip-sebut-masalah-hukum-mahasiswanya-yang-melakukan-tindakan-anarkis-merupakan-masalah-pribadia",
    isiPost:
        '<p>TRIBUNJATENG.COM,SEMARANG - Universitas Diponegoro (Undip) tidak akan campur tangan terhadap satu mahasiswanya yang ditahan di Polrestabes Semarang karena diduga melakukan tindakan anarkis saat unjuk rasa penolakan Omnibus Law di depan kantor Gubernuran.<br><br>Kepala Kantor Hukum Undip, Sukinta mengatakan ada syarat yang diminta Polrestabes untuk pengalihan penahanan tersangka yakni adanya penjamin dari Dekan maupun pimpinan fakultas.<br><br>Namun permasalahan yang menimpa mahasiswanya tersebut merupakan masalah pribadi. Oleh sebab itu diperlukan adanya permohonan dari yang bersangkutan maupun orang tuanya.<br><br>"Kami sarankan ke Badan Eksekutif Mahasiswa (BEM) agar yang bersangkutan membuat surat permohonan kepada Dekan untuk menjadi penjamin,"ujar dia saat dihubungi Tribun Jateng, Senin (19/10/2020).<br><br>Menurut Sukinta, ada resiko hukum yang harus diterima dari penjamin. Oleh sebab itu diperlukan adanya permintaan dari yang bersangkutan.<br><br>"Menjadi penjamin bukan karena permintaan sendiri. Harus ada permintaan dari yang bersangkutan untuk menjadi dasar,"tuturnya.<br><br>Selain itu, kata dia, mahasiswanya tersebut harus melampirkan surat pernyataan pada surat permohonan tersebut. Surat pernyataan yang harus dibuat yakni tidak melarikan diri, tidak mengulangi tindak pidananya, tidak menghilangkan barang bukti, dan menghadiri pemeriksaan.<br><br>"Harus ada pernyataan yang bersangkutan untuk meyakinkan. Karena menjadi penjamin harus berhati-hati. Kalau yang bersangkutan mengingkari Khan bahaya," ucap dia.<br><br>Tanggung Jawab Pribadi<br><br>Sukinta menegaskan terkait permohonan untuk menjadi penjamin Undip tidak berbelit. Pihaknya menilai kasus hukum yang menimpa mahasiswanya merupakan masalah pribadi.<br><br>"Kami tidak mempermasalahkan demonya. Tapi disitu Kepolisian menetapkan tersangka karena dugaan melakukan penyerangan maupun perusakan barang atau orang,"jelasnya.<br><br>Menurutnya, ulah mahasiswanya yang ditahan tersebut di luar kendali Undip. Oleh sebab itu menjadi tanggung jawab pribadi tersangka.<br><br>"Jadi keterlibatan Dekan untuk menjadi penjamin harus ada permohonan dari yang bersangkutan,"terangnya.<br><br>Kedepannya, ia mengatakan jika mahasiswanya terbukti bersalah, Undip tidak segan-segan memberikan sanksi tersendiri. Sanksi teringan berupa teguran dan sanksi terberat pemutusan hubungan studi atau Drop Out (DO).<br><br>"Secara hukum sudah memenuhi syarat penuntutan. Di Undip juga mempunyai aturan dimana sejak awal masuk mahasiswa sudah menandatangani surat bermaterai diantaranya mematuhi perundang-undangan yang berlaku," paparnya. (*)<br><br>Artikel ini telah tayang di Tribunjateng.com dengan judul Undip Sebut Masalah Hukum Mahasiswanya yang Melakukan Tindakan Anarkis Merupakan Masalah Pribadi, https://jateng.tribunnews.com/2020/10/20/undip-sebut-masalah-hukum-mahasiswanya-yang-melakukan-tindakan-anarkis-merupakan-masalah-pribadi.Penulis: rahdyan trijoko pamungkasEditor: sujarwo</p>',
    fileGambar: baseURLImg + 'post/artikel4.jpg',
  ),
  Post(
    idPost: 5,
    idKategori: 4,
    namaKategori: "Prestasi",
    namaPenulis: "Husni",
    judul:
        "128 Mahasiswa UNDIP Rebut Posisi Terhormat di Program Kreatifitas Mahasiswa (PKM) Tahun 2020",
    slug:
        "128-mahasiswa-undip-rebut-posisi-terhormat-di-program-kreatifitas-mahasiswa-pkm-tahun-2020",
    isiPost:
        '<p><strong>SEMARANG&nbsp;</strong>&ndash; Sebanyak 128 mahasiswa mampu merebut posisi terhormat dalam kompetisi Program Kreatifitas Mahasiswa (PKM) Tahun 2020 yang diselenggarakan Kementerian Pendidikan dan Kebudayaan. Dengan masuknya 128 proposal mahasiswa tersebut sekaligus mencatatkan&nbsp;<a href="http://undip.ac.id/">Undip</a>&nbsp;sebagai perguruan tinggi terbanyak ke-2 PKM Tahun 2020.</p><p>Wakil Rektor 1 Undip Bidang Akademik dan Kemahasiswaan, Prof. Budi Setiyono SSos, M.Pol.Admin., PhD, mengaku bangga dengan apa yang diraih para mahasiswanya dalam ajang kompetisi kreatifitas yang cukup bergengsi ini. &ldquo;Terus terang kami bangga dengan capaian para mahasiswa di PKM 2020. Kami akan lakukan semaksimal yang mungkin dilakukan untuk mensupport para penerima dana PKM supaya hasil akhirnya gemilang,&rdquo;kata Prof Budi Setiyono, Kamis (8/8/2020).</p><p>Menurut Warek-1 Undip, ada 58 proposal penelitian yang disetujui Kemendikbud melalui PKM 2020, kemudian ada 31 proposal pengabdian kepada masyarakat, 7 proposal program kewirausahaan, 4 proposal teknologi dan 14 proposal karsa cipta. &ldquo;Para penerima dana PKM akan kami dorong untuk dapat berhasil menembus ajang Pimnas dan mendapatkan medali emas,&rdquo; harapnya.</p><p>Pimnas atau Pekan Ilmiah Mahasiswa Nasional adalah ajang kompetisi karya kreatif mahasiswa Diploma dan S1 tingkat nasional yang diadakan oleh Dirjen Pendidikan Tinggi. Dalam ajang ini bertanding bermacam mahasiswa, dari bermacam jurusan, dan bermacam penjuru Indonesia. Tahun 2020 adalah pelaksanaan Pimnas ke-30.</p><p>Budi Setiyono mengungkapkan bahwa PKM menjadi modal penting untuk Pimnas. Meski begitu, dia menyatakan bahwa apa yang diperoleh dari PKM adalah keberhasilan tersendiri. Karena itu dari universitas akan melakukan&nbsp;<em>couching</em>&nbsp;dan pendampingan intensif bagi mahasiswa yang lolos PKM 2020. &ldquo;Universitas juga sedang menyiapkan skema insentif dana bagi para peraih medali,&rdquo; tambah dia.</p><p>Ditanya jenis-jenis penelitian dan inivasi teknologi yang masuk dalam PKM 2020, Budi menyebutkan sangat beragam. Dia juga menyebut perolehan itu juga hampir merata di seluruh fakultas. &ldquo;Yang prinsip, temanya pasti menarik dan berdaya guna. Karena itu, kami akan membantu hilirisasinya juga supaya hasil penelitiannya bisa dirasakan masyarakat luas.&rdquo;</p><p>Kementerian Pendidikan dan Kebudayaan melalui Direktorat Pembelajaran dan Kemahasiswaan Dirjen Dikti, mengumumkan peserta program PKM yang proposalnya mendapat persetujuan dan pendanaan dari pemerintah. Universitas Gajah Mada (UGM) menempatkan 197 mahasiswanya di ajang kompetisi ini, disusul Undip dengan 128 mahasiswa, kemudian Universitas Hasanuddin Makassar (113 mahasiswa), Universitas Brawijaya Malang (111 mahasiswa) dan Universitas Sebelas Maret Surakarta (103), serta Institut Pertanian Bogor (98 mahasiswa).</p><p>Proposal yang disetujui akan mendapatkan penyaluran dana melalui kontrak kerja antara Direktorat Pembelajaran dan Kemahasiswaan dengan Perguruan Tinggi untuk pendanaan dari Perguruan Tinggi Negeri. Sedangkan untuk perguruan tinggi swasta kontrak akan dilakukan dengan Lembaga Layanan Pendidikan Tinggi Wilayah.</p>',
    fileGambar: baseURLImg +
        'post/128-mahasiswa-undip-rebut-posisi-terhormat-di-program-kreatifitas-mahasiswa-pkm-tahun-2020.jpeg',
  ),
  Post(
    idPost: 6,
    idKategori: 4,
    namaKategori: "Prestasi",
    namaPenulis: "Rochmad",
    judul: "Mahasiswa Asing UNDIP Sabet Juara I LBBI 2020 di Surakarta",
    slug: "mahasiswa-asing-undip-sabet-juara-i-lbbi-2020-di-surakarta",
    isiPost:
        '<p>Jum&rsquo;at (24/7/2020) &ndash; Baru saja&nbsp;<a href="http://undip.ac.id/">UNDIP</a>&nbsp;mengenalkan Mahasiswa program beasiswa Kemitraan Negara Berkembang dari&nbsp;<a href="http://undip.ac.id/">Universitas Diponegoro</a>, Lalaina Tienh Andriamampionona, yang menjuarai Lomba Bernyanyi Bahasa Indonesia 2020. Acara jumpa pers digelar di ruang Media Center ULT Undip. Adapun lomba diadakan di Universitas Muhammadiyah Surakarta pada bulan Juni-Juli secara virtual. Lomba ini diikuti oleh mahasiswa asing program dharma siswa dan program beasiswa kemitraan negara berkembang yang diinisiasi oleh Kementerian Pendidikan dan Kebudayaan Republik Indonesia. Selain sebagai ajang unjuk bakat dalam menyanyi, lomba ini juga merupakan program untuk memperkenalkan bahasa dan budaya Indonesia kepada mahasiswa dari seluruh dunia.</p><p>Meskipun lomba diselenggarakan di tengah kondisi pandemi, hal ini tidak menyurutkan semangat Lalaina untuk tetap mengikuti lomba. Video audisi dikirimkan secara online dan telah disaksikan oleh sekitar 2.700 orang. Dalam kompetisi ini, Lalaina mendapatkan juara pertama dengan meraih skor sejumlah 268 poin. Lalaina menyanyikan satu lagu nasional dan satu lagu berbahasa Indonesia pilihan. Kepala&nbsp;<a href="http://io.undip.ac.id/">Kantor Internasional Undip</a>, Kartika Widya Utama, S.H., M.H., dalam jumpa pers yang dilaksanakan pagi ini mengucapkan terima kasih kepada Lalaina. Beliau juga mengungkapkan rasa bangganya terhadap mahasiswa Magister Ilmu Politik asal Madagascar ini karena telah mempelajari bahasa Indonesia dan terlebih mendapatkan juara dalam kompetisi yang menggunakan bahasa Indonesia.</p><p>Dalam jumpa pers ini Lalaina mengungkapkan rasa terima kasih kepada seluruh pembimbing yang telah membantu selama berada di Undip. &ldquo;Undip adalah bagian dari kehidupan saya di selama di Semarang dan di Indonesia. Saya banyak belajar bukan cuma di kampus tetapi juga belajar ilmu kehidupan dan budaya kehidupan di Jawa. Senang dan bersyukur melewati semuanya dan dapat banyak lesson dari pengalaman selama di sini&rdquo;, tutur mahasiswa KNB Scholarship angkatan 2017 ini. Lalaina mengatakan bahwa hasil yang telah diraih bukan merupakan usaha dari dirinya sendiri, melainkan dari dukungan banyak pihak yaitu dari kolega yang berada di Indonesia maupun di Madagascar.</p>',
    fileGambar: baseURLImg +
        'post/mahasiswa-asing-undip-sabet-juara-i-lbbi-2020-di-surakarta.jpeg',
  ),
  Post(
    idPost: 7,
    idKategori: 2,
    namaKategori: "Ilmu Pengetahuan",
    namaPenulis: "Fatah",
    judul:
        "Rehabilitasi Ekosistem Mangrove di Wilayah Terdampak Rob dan Erosi di Pesisir Tambakrejo",
    slug:
        "rehabilitasi-ekosistem-mangrove-di-wilayah-terdampak-rob-dan-erosi-di-pesisir-tambakrejo",
    isiPost:
        '<p>Jum&rsquo;at (24/7/2020) &ndash; Baru saja&nbsp;<a href="http://undip.ac.id/">UNDIP</a>&nbsp;mengenalkan Mahasiswa program beasiswa Kemitraan Negara Berkembang dari&nbsp;<a href="http://undip.ac.id/">Universitas Diponegoro</a>, Lalaina Tienh Andriamampionona, yang menjuarai Lomba Bernyanyi Bahasa Indonesia 2020. Acara jumpa pers digelar di ruang Media Center ULT Undip. Adapun lomba diadakan di Universitas Muhammadiyah Surakarta pada bulan Juni-Juli secara virtual. Lomba ini diikuti oleh mahasiswa asing program dharma siswa dan program beasiswa kemitraan negara berkembang yang diinisiasi oleh Kementerian Pendidikan dan Kebudayaan Republik Indonesia. Selain sebagai ajang unjuk bakat dalam menyanyi, lomba ini juga merupakan program untuk memperkenalkan bahasa dan budaya Indonesia kepada mahasiswa dari seluruh dunia.</p><p>Meskipun lomba diselenggarakan di tengah kondisi pandemi, hal ini tidak menyurutkan semangat Lalaina untuk tetap mengikuti lomba. Video audisi dikirimkan secara online dan telah disaksikan oleh sekitar 2.700 orang. Dalam kompetisi ini, Lalaina mendapatkan juara pertama dengan meraih skor sejumlah 268 poin. Lalaina menyanyikan satu lagu nasional dan satu lagu berbahasa Indonesia pilihan. Kepala&nbsp;<a href="http://io.undip.ac.id/">Kantor Internasional Undip</a>, Kartika Widya Utama, S.H., M.H., dalam jumpa pers yang dilaksanakan pagi ini mengucapkan terima kasih kepada Lalaina. Beliau juga mengungkapkan rasa bangganya terhadap mahasiswa Magister Ilmu Politik asal Madagascar ini karena telah mempelajari bahasa Indonesia dan terlebih mendapatkan juara dalam kompetisi yang menggunakan bahasa Indonesia.</p><p>Dalam jumpa pers ini Lalaina mengungkapkan rasa terima kasih kepada seluruh pembimbing yang telah membantu selama berada di Undip. &ldquo;Undip adalah bagian dari kehidupan saya di selama di Semarang dan di Indonesia. Saya banyak belajar bukan cuma di kampus tetapi juga belajar ilmu kehidupan dan budaya kehidupan di Jawa. Senang dan bersyukur melewati semuanya dan dapat banyak lesson dari pengalaman selama di sini&rdquo;, tutur mahasiswa KNB Scholarship angkatan 2017 ini. Lalaina mengatakan bahwa hasil yang telah diraih bukan merupakan usaha dari dirinya sendiri, melainkan dari dukungan banyak pihak yaitu dari kolega yang berada di Indonesia maupun di Madagascar.</p>',
    fileGambar: baseURLImg +
        'post/rehabilitasi-ekosistem-mangrove-di-wilayah-terdampak-rob-dan-erosi-di-pesisir-tambakrejo.jpeg',
  ),
  Post(
    idPost: 8,
    idKategori: 2,
    namaKategori: "Ilmu Pengetahuan",
    namaPenulis: "Rizqi",
    judul:
        'Pengembangan Teknologi Digital Banjir Pasang "ROB" dan Peningkatan Masyarakat Tangguh Bencana Pesisir Desa Binaan Undip',
    slug:
        "pengembangan-teknologi-digital-banjir-pasang-rob-dan-peningkatan-masyarakat-tangguh-bencana-pesisir-desa-binaan-undip",
    isiPost:
        '<p>Semarang &ndash; Tim Pengabdian Masyarakat Iptek Bagi Desa Binaan Undip (IDBU) &nbsp;<a href="http://oseanografi.fpik.undip.ac.id/">Departemen Oseanografi FPIK</a>&nbsp;Universitas Diponegoro memberikan Updating data pada Kalender Rob 2020 &nbsp;di daerah pesisir Tambakrejo, Kelurahan Tanjung Mas Semarang pada hari Sabtu tanggal 19 September 2020 kepada para warga dan tokoh masyarakat serta ketua kolompok masyarakat.</p><p>Sosialisasi penggunaan sekaligus update data Kalender Rob tahun 2020 ini merupakan lanjutan dari kerjasama antara Pokmaswas dengan Tim Pengabdian Masyarakat&nbsp;<a href="http://oseanografi.fpik.undip.ac.id/">Departemen Oseanografi</a>&nbsp;<a href="http://undip.ac.id/">Universitas Diponegoro</a>&nbsp;yang terlaksana melalui Program Iptek Bagi Desa Binaan Undip (IDBU) selama tahun 2018-2020.</p><p>Menurut ketua Tim IDBU Undip, Prof. Dr. Denny Nugroho Sugianto, ST., MSi., menyampaikan bahwa acara ini bertujuan untuk mewujudkan masyarakat yang tangguh terhadap bencana pesisir di Kelurahan Tanjungmas, Semarang &ndash; Jawa Tengah, akibat bencana banjir pasang (rob) yang setiap saat menjadi bagian dari kehidupan masyarakat setempat. Kalender Rob ini sangat bermanfaat bagi masyarakat saat ini. Masyarakat dapat dengan mudah bisa memprediksikan kapan terjadinya rob, seberapa tinggi genangan air rob, berapa lama durasi rob berlangsung, serta bagaimana kondisi level air genangan rob, sehingga bisa dilakukan upaya antisipasi oleh warga itu sendiri dengan mempersiapkan memindahkan barang-barang atau menyelamatkan sebagian perabot rumah tangga nya agar tidak tergenang oleh air rob yang tiba-tiba datang. Manfaat lain yang dirasakan warga adalah ketika akan mempunyai acara-acara soasial, keagamaan, bahkan acara resepsi pernikahan. Warga dapat melihat kalender rob untuk menentukan waktu yang tepat sehingga tidak bersamaan dengan terjadinya Rob. Selain itu bermanfaat juga sebagai informasi untuk mitigasi jangka pendek, menengah maupun panjang untuk pemerintah, stakeholder, dan masyarakat terkait dengan kejadian rob yang terjadi di wilayah pesisir. Hal ini juga sebagai salah satu wujud<a href="http://undip.ac.id/">&nbsp;Universitas Diponegoro</a>&nbsp;dalam rangka implementasi agenda pemerintah yaitu tujuan pembangunan berkelanjutan (SDGs) dengan tujuan goals SDGs 13 (<em>climate action</em>) dan 17 (<em>partnerships for the goals</em>), yaitu &nbsp;<a href="https://www.sdg2030indonesia.org/page/25-tujuan-tujuhbelas">Menguatkan ukuran implementasi dan merevitalisasi kemitraan global untuk pembangunan yang berkelanjutan</a>.&nbsp;<a href="http://sustainability.undip.ac.id/">Sustainable Development Goals (SDGs)</a>&nbsp;merupakan suatu rencana aksi global yang disepakati oleh para pemimpin dunia, termasuk Indonesia, guna mengakhiri kemiskinan, mengurangi kesenjangan dan melindungi lingkungan. SDGs berisi 17 Tujuan dan 169 Target yang diharapkan dapat dicapai pada tahun 2030.</p><p>&nbsp;</p><p><img alt="" src="https://www.undip.ac.id/wp-content/uploads/2020/09/Pengabdian-UNDIP-Rob.jpeg" /></p><p>&nbsp;</p><p>Seperti kita ketahui bahwa bencana banjir pasang yang dikenal dengan istilah rob merupakan suatu peristiwa di alam yang disebabkan dinamika tinggi muka laut yang berpotensi merugikan dan mengganggu kehidupan normal. Bencana rob merupakan suatu hal yang relatif sulit untuk dihindari. Bencana jenis ini pada umumnya disebabkan oleh naiknya muka laut yang berlebihan hingga mengenangi permukaan daratan, dimana salah satu penyebabnya adalah akibat perubahan iklim global (climate change).</p><p>Hal yang sama juga dirasakan oleh beberapa warga setempat misalnya Ketua RT 04 RW 16 Bapak Suratno yang juga menjabat sebagai Ketua Kelompok Masyarakat Pengawas (Pokmaswas) Manunggal Bahari yang mewakili warga, menyampaikan bahwa adanya kelender ROB ini sangat bermanfaat dan membantu warga dan tentunya menjadi pedoman warga untuk menentukan acara-acara yang diselenggarakan di kampung. Menurut ketua RW 16 Tambakrejo Tanjungmas, Bapak Slamet Riyadi, bahwa Kalender Rob yang sudah beberapa tahun ini dibuat oleh Tim IDBU Undip sejak tahun 2018-2020, dan diberikan kepada warga sangat bermanfaat dan membantu warga dalam kehidupan sehari-hari yang tidak luput dari kejadian Rob yang dating setiap saat. Dengan kalender ini warga saat ini bisa melakukan antisipasi dan bisa menyelamatkan barang-barangnya sebelum rob datang.</p><p>Selanjutnya ditambahkan oleh anggota tim Dr. Muhammad Helmi, bahwa kalender rob ini mempunyai 2 versi, yaitu digital dan manual (bentuk kalender biasa). Untuk bentuk digital Aplikasi Kalender Rob berbasis android bisa didownload melalui play store, menampilkan kondisi ketinggian air di mana dalam satu hari terdapat informasi level air tertinggi dan level air terendah dalam satuan meter. Data ditampilkan per-jam dan setiap hari secara langsung. Serta informasi level air apakah masih dalam kondisi ketinggian aman, waspada 1, waspada 2, dan siaga.&nbsp; Terdapat informasi juga kalender masehi dan jawa serta informasi posisi bulan. Saat ini aplikasi kalender rob baru menyajikan data di daerah Kota Semarang dan sekitarnya, dan dalam tahap pengembangan untuk seluruh pantai utara Jawa Tengah, dan akan terus dikembangkan ke daerah-daerah yang rawan terhadap bencana banjir pasang (ROB).</p><p>Pengembangan teknologi digital banjir pasang berupa kalender rob berbasis android dapat menjadi salah satu alternatif solusi yang efektif bagi masyarakat di area terpapar, aktivitas perdagangan industri dan jasa serta pemerintah daerah untuk melakukan mitigasi. Kalender rob digital dapat memberikan data dan informasi mengenai kapan tanggal dan jam terjadi rob sesuai dengan perhitungan Kalender Masehi dan perhitungan Kalender Jawa. Kalender rob juga memberikan data dan informasi kuantitatif tingginya muka air dan durasi kejadian rob di wilayah tersebut.</p>',
    fileGambar: baseURLImg +
        'post/pengembangan-teknologi-digital-banjir-pasang-rob-dan-peningkatan-masyarakat-tangguh-bencana-pesisir-desa-binaan-undip.jpeg',
  ),
];
