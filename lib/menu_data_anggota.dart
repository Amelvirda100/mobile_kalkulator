import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Data Anggota',
      theme: ThemeData(
        fontFamily: 'Inria Sans',
      ),
      home: const MenuDataAnggota(),
    );
  }
}

class Member {
  final String name;
  final String id;
  final String imageUrl;
  final bool isRightAligned;

  const Member({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.isRightAligned,
  });
}

class MenuDataAnggota extends StatelessWidget {
  const MenuDataAnggota({Key? key}) : super(key: key);

  final List<Member> members = const [
    Member(
      name: 'Laras Ayodya Sari',
      id: '123220081',
      imageUrl:
          'https://cdn.builder.io/api/v1/image/assets/TEMP/a61f6acea650861472db38257b7436a8ddced50d4bae81208bc9d28970251f51',
      isRightAligned: false,
    ),
    Member(
      name: 'Virda Stefany Amelia',
      id: '123220132',
      imageUrl:
          'https://cdn.builder.io/api/v1/image/assets/TEMP/a1a35a36dcfa7e61ac44857775c864c1216d2911558974cbd68c916f779dbd8a',
      isRightAligned: true,
    ),
    Member(
      name: 'R Dhea Venesia Sibuea',
      id: '123220134',
      imageUrl:
          'https://cdn.builder.io/api/v1/image/assets/TEMP/26e3a8b787797c740d9daf57292d7af1143f1b4af1e327126f2db2b35af1fde2',
      isRightAligned: false,
    ),
    Member(
      name: 'Faiza Nur Rafida',
      id: '123220159',
      imageUrl:
          'https://cdn.builder.io/api/v1/image/assets/TEMP/e69e2439f9e63275f68c22d7afa30bce8d1905c6e574a53b3b7c64a659d599ec',
      isRightAligned: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFCCD4EE),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, size: 30),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Data Anggota',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: members.length,
                  itemBuilder: (context, index) {
                    final member = members[index];
                    return MemberCard(member: member);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MemberCard extends StatelessWidget {
  final Member member;

  const MemberCard({Key? key, required this.member}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: member.isRightAligned
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!member.isRightAligned) _buildProfileImage(),
          if (!member.isRightAligned) const SizedBox(width: 10),
          _buildMemberInfo(),
          if (member.isRightAligned) const SizedBox(width: 10),
          if (member.isRightAligned) _buildProfileImage(),
        ],
      ),
    );
  }

  Widget _buildProfileImage() {
    return ClipOval(
      child: Image.network(
        member.imageUrl,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.person,
          size: 50,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildMemberInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF2F2),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(member.isRightAligned ? 30 : 30),
          right: Radius.circular(member.isRightAligned ? 30 : 30),
        ),
      ),
      child: Column(
        crossAxisAlignment: member.isRightAligned
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Text(
            member.name,
            style: const TextStyle(fontSize: 15),
          ),
          Text(
            member.id,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
