import 'package:flutter/material.dart';

class KetentuanPengguna extends StatelessWidget {
  KetentuanPengguna();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Text('Ketentuan Pengguna', style: TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            const Text(
              "Selamat datang di Aplikasi P2P Crowdfunding!",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 16),
            const Text(
              '''
Aplikasi ini adalah platform yang menghubungkan para pemberi pinjaman dengan para peminjam yang membutuhkan dana. Sebagai pengguna aplikasi, kami ingin memastikan bahwa Anda memahami dan menyetujui ketentuan penggunaan kami sebelum memulai pengalaman Anda di platform ini. Harap baca dengan seksama syarat dan ketentuan berikut:
            ''',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "1. Pendaftaran:",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Expanded(
                    child: const Text(
                      '''
a. Anda harus berusia 18 tahun atau lebih untuk menggunakan aplikasi ini.
b. Anda bertanggung jawab atas keakuratan dan kelengkapan informasi yang Anda berikan saat mendaftar.
c. Setiap kali ada perubahan dalam informasi pribadi Anda, Anda harus segera memperbarui profil Anda.
            ''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "2. Keamanan dan Privasi:",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Expanded(
                    child: const Text(
                      '''
a. Kami menghargai privasi Anda dan akan melindungi data pribadi Anda sesuai dengan kebijakan privasi kami. Namun, kami tidak dapat menjamin keamanan penuh terhadap ancaman eksternal.
b. Anda bertanggung jawab atas menjaga kerahasiaan kata sandi Anda dan melindungi akun Anda dari akses yang tidak sah.
c. Segala kegiatan yang dilakukan melalui akun Anda akan dianggap sebagai tindakan yang dilakukan oleh Anda.
            ''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "3. Penawaran dan Pinjaman:",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Expanded(
                    child: const Text(
                      '''
a. Kami menyediakan platform untuk memungkinkan pemberi pinjaman menawarkan pinjaman kepada peminjam. Keputusan untuk memberikan pinjaman sepenuhnya ada pada pemberi pinjaman.
b. Pemberi pinjaman diharapkan melakukan penelitian dan analisis yang cukup sebelum meminjamkan dana kepada peminjam.
c. Peminjam bertanggung jawab atas pembayaran tepat waktu sesuai dengan ketentuan pinjaman yang disepakati.
            ''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "4. Risiko dan Pertanyaan Hukum:",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Expanded(
                    child: const Text(
                      '''
a. Penggunaan aplikasi ini melibatkan risiko keuangan. Anda setuju bahwa Anda bertanggung jawab sepenuhnya atas risiko yang mungkin timbul dari penggunaan aplikasi ini.
b. Kami tidak memberikan saran hukum, keuangan, atau investasi. Jika Anda memiliki pertanyaan atau kekhawatiran hukum, konsultasikan dengan penasihat hukum Anda sebelum menggunakan aplikasi ini.
            ''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                "5. Kebijakan Pembatalan dan Pengembalian Dana:",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Expanded(
                    child: const Text(
                      '''
a. Setiap transaksi atau pinjaman yang telah dilakukan tidak dapat dibatalkan atau dikembalikan, kecuali diatur oleh hukum yang berlaku.
b. Kami berhak, atas kebijakan kami sendiri, untuk membatalkan atau mengubah layanan atau fitur aplikasi ini tanpa pemberitahuan sebelumnya.
            ''',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '''
Harap dicatat bahwa ketentuan ini dapat berubah dari waktu ke waktu sesuai dengan kebijakan kami. Dengan menggunakan aplikasi ini, Anda menyetujui untuk mematuhi ketentuan dan kebijakan yang berlaku pada saat penggunaan.

Terima kasih telah menjadi bagian dari komunitas kami. Jika Anda memiliki pertanyaan lebih lanjut, jangan ragu untuk menghubungi tim dukungan
            ''',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
