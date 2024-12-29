import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import untuk Clipboard

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DoaListPage(),
    );
  }
}

class DoaListPage extends StatelessWidget {
  const DoaListPage({super.key});

  // Data daftar doa
  final List<Map<String, String>> doaList = const [
    {
      "title": "Doa Sebelum Tidur",
      "arabic": "بِاسْمِكَ اللَّهُمَّ أَحْيَا وَأَمُوتُ",
      "latin": "Bismikallahumma ahyaa wa amuut",
      "translation": "Dengan menyebut nama Allah, aku hidup dan aku mati."
    },
    {
      "title": "Doa Bangun Tidur",
      "arabic": "الْحَمْدُ لِلَّهِ الَّذِي أَحْيَانَا بَعْدَ مَا أَمَاتَنَا وَإِلَيْهِ النُّشُورُ",
      "latin": "Alhamdulillahilladzi ahyana ba'da maa amaatanaa wa ilaihin nusyuur",
      "translation": "Segala puji bagi Allah yang telah menghidupkan kami setelah mati dan hanya kepada-Nya kami dikembalikan."
    },
    {
      "title": "Doa Masuk Kamar Mandi",
      "arabic": "اللّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْخُبُثِ وَالْخَبَائِثِ",
      "latin": "Allahumma inni a’udzubika minal khubutsi wal khabaa’its",
      "translation": "Ya Allah, aku berlindung pada-Mu dari godaan setan laki-laki dan setan perempuan."
    },
    {
      "title": "Doa Ketika Bercermin",
      "arabic": "اَللّهُمَّ كَمَا حَسَّنْتَ خَلْقِي فَحَسِّنْ خُلُقِي",
      "latin": "Allahumma kamaa hassanta kholqii fahassin khuluqii",
      "translation": "Ya Allah, sebagaimana Engkau telah membaguskan rupa wajahku, maka bagusinlah budi pekertiku."
    },
    {
      "title": "Doa Keluar Rumah",
      "arabic": "بِسْمِ اللَّهِ تَوَكَّلْتُ عَلَى اللَّهِ لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ",
      "latin": "Bismillah, tawakkaltu ‘alallah, laa hawla wa laa quwwata illa billah",
      "translation": "Dengan nama Allah, aku bertawakal kepada Allah. Tiada daya dan kekuatan melainkan dengan pertolongan Allah."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Do'a Sehari-hari"),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: doaList.length,
        itemBuilder: (context, index) {
          final doa = doaList[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul Doa
                  Text(
                    doa['title'] ?? '',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Teks Arab
                  Text(
                    doa['arabic'] ?? '',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 8),
                  // Teks Latin
                  Text(
                    doa['latin'] ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Terjemahan
                  Text(
                    "Artinya: ${doa['translation']}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Tombol Salin
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {
                        final String textToCopy =
                            "${doa['title']}\n\n${doa['arabic']}\n\n${doa['latin']}\n\nArtinya: ${doa['translation']}";
                        Clipboard.setData(ClipboardData(text: textToCopy));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Teks berhasil disalin!"),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.copy, color: Colors.teal),
                      label: const Text(
                        "Salin",
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
